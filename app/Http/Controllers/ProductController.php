<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductRequest;
use App\Models\Product;
use App\Models\Attribute;
use App\Models\ProductAttribute;
use App\Models\ProductImage;
use App\Models\DescriptiveImage;
use App\Models\ProductCategory;
use App\Models\CategoryValue;
use Illuminate\Support\Facades\Log;

class ProductController extends Controller
{
    public function store(StoreProductRequest $request)
    {
        try {

            $product = Product::create(array_merge(
                $request->only(['name', 'description']),
                ['status' => 1]
            ));

            foreach ($request->input('attributes') as $attributeData) {
                $attribute = Attribute::firstOrCreate(['name' => $attributeData['name']]);

                ProductAttribute::create([
                    'product_id' => $product->id,
                    'attribute_id' => $attribute->id,
                    'value' => $attributeData['value'],
                    'price' => $attributeData['price'],
                    'quantity' => $attributeData['quantity']
                ]);
            }

            if ($request->hasFile('product_images')) {
                foreach ($request->file('product_images') as $image) {
                    $path = $image->store('product_images', 'public');
                    ProductImage::create([
                        'product_id' => $product->id,
                        'images' => $path
                    ]);
                }
            } else {
                dd("No product image detected");
            }

            if ($request->hasFile('descriptive_images')) {
                foreach ($request->file('descriptive_images') as $image) {
                    $path = $image->store('descriptive_images', 'public');
                    DescriptiveImage::create([
                        'product_id' => $product->id,
                        'descriptive_images' => $path
                    ]);
                }
            } else {
                dd("No descriptive images detected");
            }

            $category = ProductCategory::create([
                'product_id' => $product->id,
                'category' => $request->input('category'),
                'status' => 1
            ]);

            CategoryValue::create([
                'product_id' => $product->id,
                'product_category_id' => $category->id,
                'sub_category' => $request->input('sub_category'),
            ]);


            $product = Product::with(['attributes.attribute', 'productImages', 'descriptiveImages'])->find($product->id);

            $formattedProduct = $this->formatProduct($product);

            return response()->json($formattedProduct, 201);
        } catch (\Exception $e) {
            Log::error('Error creating product: ' . $e->getMessage(), ['exception' => $e]);
            return response()->json(['error' => 'Something went wrong'], 500);
        }
    }


    public function index()
    {
        try {
            $products = Product::with(['attributes.attribute', 'productImages', 'descriptiveImages', 'getCategory', 'categoryValue'])->get();

            $formattedProducts = $products->map(function ($product) {
                try {
                    $attributes = $product->attributes->groupBy(function ($attribute) {
                        return strtolower($attribute->attribute->name);
                    })->map(function ($group) {
                        return $group->map(function ($attribute) {
                            return [
                                'value' => $attribute->value,
                                'price' => $attribute->price,
                                'quantity' => $attribute->quantity
                            ];
                        });
                    });

                    $productImages = $product->productImages->map(function ($image) {
                        return url('storage/' . $image->images);
                    });

                    $descriptiveImages = $product->descriptiveImages->map(function ($image) {
                        return url('storage/' . $image->descriptive_images);
                    });

                    $category = null;
                    $subCategory = null;

                    try {
                        $category = $product->getCategory->category;
                    } catch (\Exception $e) {
                        Log::error('Error fetching category for product ID ' . $product->id . ': ' . $e->getMessage(), ['exception' => $e]);
                    }

                    try {
                        $subCategory = $product->categoryValue->sub_category;
                    } catch (\Exception $e) {
                        Log::error('Error fetching sub-category for product ID ' . $product->id . ': ' . $e->getMessage(), ['exception' => $e]);
                    }

                    return [
                        'id' => $product->id,
                        'name' => $product->name,
                        'description' => $product->description,
                        'attributes' => $attributes,
                        'status' => $product->status,
                        'product_images' => $productImages,
                        'descriptive_images' => $descriptiveImages,
                        'category' => $category,
                        'sub_category' => $subCategory,
                    ];
                } catch (\Exception $e) {
                    Log::error('Error formatting product ID ' . $product->id . ': ' . $e->getMessage(), ['exception' => $e]);
                    return null; 
                }
            })->filter(); 

            return response()->json(['status' => 1, 'data' => $formattedProducts], 200);
        } catch (\Exception $e) {
            Log::error('Error fetching products: ' . $e->getMessage(), ['exception' => $e]);
            return response()->json(['error' => 'Something went wrong'], 500);
        }
    }

    private function formatProduct($product)
    {
        $attributes = [];

        foreach ($product->attributes as $attribute) {
            $attributeName = strtolower($attribute->attribute->name);
            $attributeData = [
                'value' => $attribute->value,
                'price' => $attribute->price,
                'quantity' => $attribute->quantity
            ];

            if (!isset($attributes[$attributeName])) {
                $attributes[$attributeName] = [];
            }

            $attributes[$attributeName][] = $attributeData;
        }

        $productImages = $product->productImages->map(function ($image) {
            return url('storage/' . $image->images);
        });

        $descriptiveImages = $product->descriptiveImages->map(function ($image) {
            return url('storage/' . $image->descriptive_images);
        });

        return [
            'id' => $product->id,
            'name' => $product->name,
            'description' => $product->description,
            'attributes' => $attributes,
            'status' => $product->status,
            'product_images' => $productImages,
            'descriptive_images' => $descriptiveImages,
            'category' => $product->getCategory->category,
            'sub_category' => $product->categoryValue->sub_category,
        ];
    }
}
