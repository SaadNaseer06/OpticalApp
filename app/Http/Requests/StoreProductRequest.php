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
            'name' => 'required',
            'description' => 'nullable',
            'attributes' => 'required',  // Ensure attributes is an array
            'attributes.*.name' => 'required',  // Check each attribute name exists in attributes table
            'attributes.*.value' => 'required',  // Value must be a string
            'attributes.*.price' => 'required',  // Price must be numeric
            'attributes.*.quantity' => 'required',  // Quantity must be an integer
            'product_images' => 'required|array',
            'product_images.*' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',  // Adjust max size as needed
            'description_images' => 'nullable|array',
            'description_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',  // Adjust max size as needed
        ];
    }
}
