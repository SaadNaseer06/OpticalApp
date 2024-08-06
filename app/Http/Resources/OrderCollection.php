<?php

namespace App\Http\Resources;

use App\Models\ProductAttribute;
use Illuminate\Http\Request;
use App\Models\ProductImage;
use App\Models\Product;
use Illuminate\Http\Resources\Json\ResourceCollection;

class OrderCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    public function toArray(Request $request): array
    {
        return $this->collection->map(function ($item) {
            $productAttribute = ProductAttribute::find($item->product_id);
            $product = Product::find($item->product_id);
            $productImages = ProductImage::where('product_id', $item->product_id)->get();
            $imagesWithUrls = $productImages->map(function ($image) {
                return url('storage/' . $image->images);
            });

            return [
                'product_id' => $item->product_id,
                'price' => $productAttribute->price,
                'name' => $product->name,
                'images' => $imagesWithUrls,
            ];
        })->all();  
    }
}
