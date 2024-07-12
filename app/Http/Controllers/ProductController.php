<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductRequest;
use App\Models\Product;
use App\Models\Attribute;
use App\Models\ProductAttribute;
use App\Models\ProductImage;
use App\Models\DescriptiveImage;
use Illuminate\Support\Facades\Log;

class ProductController extends Controller
{
    public function store(StoreProductRequest $request)
    {
        try {
            // Step 1: Create the product with a static status of 1
            $product = Product::create(array_merge(
                $request->only(['name', 'description']),
                ['status' => 1]  // Set status to 1
            ));

            // Step 2: Attach attributes
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

            // Step 5: Fetch the newly created product with its attributes and images
            $product = Product::with(['attributes.attribute', 'productImages', 'descriptiveImages'])->find($product->id);

            // Debugging: Log or print the product and its relationships
            Log::info('Product fetched: ', $product->toArray());

            $formattedProduct = $this->formatProduct($product);

            return response()->json($formattedProduct, 201);
        } catch (\Exception $e) {
            Log::error('Error creating product: ' . $e->getMessage());
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
            return asset('storage/' . $image->image); // Include the full path
        });

        $descriptiveImages = $product->descriptiveImages->map(function ($image) {
            return asset('storage/' . $image->image); // Include the full path
        });

        return [
            'id' => $product->id,
            'name' => $product->name,
            'description' => $product->description,
            'attributes' => $attributes,
            'status' => $product->status,
            'product_images' => $productImages,
            'descriptive_images' => $descriptiveImages,
        ];
    }
}





// namespace App\Http\Controllers;

// use App\Http\Requests\StoreProductRequest;
// use App\Models\Product;
// use App\Models\Attribute;
// use App\Models\ProductAttribute;
// use Illuminate\Http\Request;
// use Illuminate\Http\JsonResponse;


// class ProductController extends Controller
// {
//     // Fetch all products with their attributes
//     public function index()
//     {
//         $products = Product::with(['attributes.attribute'])->get()->map(function ($product) {
//             return $this->formatProduct($product);
//         });

//         return response()->json($products);
//     }

//     // Fetch a single product with its attributes
//     public function show($id)
//     {
//         $product = Product::with(['attributes.attribute'])->find($id);

//         if (!$product) {
//             return response()->json(['message' => 'Product not found'], 404);
//         }

//         $formattedProduct = $this->formatProduct($product);

//         return response()->json($formattedProduct);
//     }

//     // Store a new product with its attributes
//     public function store(StoreProductRequest $request)
//     {
//         try {
//             // Step 1: Create the product with a static status of 1
//             $product = Product::create(array_merge(
//                 $request->only(['name', 'description']),
//                 ['status' => 1] 
//             ));

//             dd($request->input('attributes'));

//             // Step 2: Attach attributes
//             foreach ($request->input('attributes') as $attributeData) {
//                 $attribute = Attribute::firstOrCreate(['name' => $attributeData['name']]);

//                 ProductAttribute::create([
//                     'product_id' => $product->id,
//                     'attribute_id' => $attribute->id,
//                     'value' => $attributeData['value'],
//                     'price' => $attributeData['price'],
//                     'quantity' => $attributeData['quantity']
//                 ]);
//             }

//             // Step 3: Fetch the newly created product with its attributes
//             $product = Product::with(['attributes.attribute'])->find($product->id);
//             $formattedProduct = $this->formatProduct($product);

//             return response()->json([
//                 'status' => 1,
//                 'message' => 'Product Created Successfully',
//                 'data' => $formattedProduct
//             ], 201);
//         } catch (ModelNotFoundException $e) {
//             // Handle model not found exception
//             return response()->json([
//                 'status' => 0,
//                 'error' => 'Resource not found'
//             ], 404);
//         } catch (\Exception $e) {
//             // Handle other unexpected exceptions
//             return response()->json([
//                 'status' => 0,
//                 'error' => 'Something went wrong'
//             ], 500);
//         }
//     }

//     // Helper function to format product data
//     private function formatProduct($product)
//     {
//         $attributes = [];

//         foreach ($product->attributes as $attribute) {
//             $attributeName = strtolower($attribute->attribute->name);
//             $attributeData = [
//                 'value' => $attribute->value,
//                 'price' => $attribute->price,
//                 'quantity' => $attribute->quantity
//             ];

//             if (!isset($attributes[$attributeName])) {
//                 $attributes[$attributeName] = [];
//             }

//             $attributes[$attributeName][] = $attributeData;
//         }

//         return [
//             'id' => $product->id,
//             'name' => $product->name,
//             'description' => $product->description,
//             'attributes' => $attributes,
//             'status' => $product->status
//         ];
//     }
// }
