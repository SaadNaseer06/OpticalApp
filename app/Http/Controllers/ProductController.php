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
            // Log request data for debugging
            Log::info('Request data:', $request->all());

            // Step 1: Create the product with a static status of 1
            Log::info('Creating product');
            $product = Product::create(array_merge(
                $request->only(['name', 'description']),
                ['status' => 1]  // Set status to 1
            ));
            Log::info('Product created:', $product->toArray());

            // Step 2: Attach attributes
            Log::info('Attaching attributes');
            foreach ($request->input('attributes') as $attributeData) {
                $attribute = Attribute::firstOrCreate(['name' => $attributeData['name']]);
                Log::info('Attribute created or found:', $attribute->toArray());

                ProductAttribute::create([
                    'product_id' => $product->id,
                    'attribute_id' => $attribute->id,
                    'value' => $attributeData['value'],
                    'price' => $attributeData['price'],
                    'quantity' => $attributeData['quantity']
                ]);
                Log::info('Product attribute attached');
            }

            // Step 3: Handle product images
            // Step 3: Handle product images
            if ($request->hasFile('product_images')) {
                foreach ($request->file('product_images') as $image) {
                    $path = $image->store('product_images', 'public');
                    ProductImage::create([
                        'product_id' => $product->id,
                        'images' => $path
                    ]);
                }
            }

            // Step 4: Handle descriptive images
            // Step 4: Handle descriptive images
            if ($request->hasFile('descriptive_images')) {
                foreach ($request->file('descriptive_images') as $image) {
                    $path = $image->store('descriptive_images', 'public');
                    DescriptiveImage::create([
                        'product_id' => $product->id,
                        'descriptive_images' => $path
                    ]);
                }
            } else {
                // Debugging: Add this line to check if descriptive_images are detected
                dd("No descriptive images detected");
            }

            // Step 5: Save category and sub_category
            Log::info('Saving category and sub_category');
            $category = ProductCategory::create([
                'product_id' => $product->id,
                'category' => $request->input('category'),
                'status' => 1
            ]);
            Log::info('Category saved:', $category->toArray());

            CategoryValue::create([
                'product_id' => $product->id,
                'product_category_id' => $category->id,
                'sub_category' => $request->input('sub_category'),
            ]);
            Log::info('Sub-category saved');

            // Debugging point

            // Step 6: Fetch the newly created product with its attributes and images
            Log::info('Fetching the created product with relationships');
            $product = Product::with(['attributes.attribute', 'productImages', 'descriptiveImages'])->find($product->id);

            // Debugging: Log or print the product and its relationships
            Log::info('Product fetched: ', $product->toArray());

            $formattedProduct = $this->formatProduct($product);

            return response()->json($formattedProduct, 201);
        } catch (\Exception $e) {
            Log::error('Error creating product: ' . $e->getMessage(), ['exception' => $e]);
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
            return url('storage/' . $image->images); // Generate full URL for product image
        });

        $descriptiveImages = $product->descriptiveImages->map(function ($image) {
            return url('storage/' . $image->descriptive_images); // Generate full URL for descriptive image
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