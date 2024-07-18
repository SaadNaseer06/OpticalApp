<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            // 'name' => 'required|string|max:255',
            // 'description' => 'nullable|string',
            // 'attributes' => 'required|array',
            // 'attributes.*.name' => 'required|string|exists:attributes,name',
            // 'attributes.*.value' => 'required|string',
            // 'attributes.*.price' => 'required|numeric',
            // 'attributes.*.quantity' => 'required|integer',
            // 'category' => 'required|string|max:255',
            // 'sub_category' => 'nullable|string|max:255',
            // 'product_images.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            // 'descriptive_images.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ];
    }
}
