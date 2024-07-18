<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'name',
        'description',
        'status'
    ];

    public function attributes()
    {
        return $this->hasMany(ProductAttribute::class);
    }

    public function productImages()
    {
        return $this->hasMany(ProductImage::class);
    }

    public function descriptiveImages()
    {
        return $this->hasMany(DescriptiveImage::class);
    }

    public function category()
    {
        return $this->belongsTo(ProductCategory::class);
    }

    public function subCategory()
    {
        return $this->belongsTo(CategoryValue::class);
    }

    public function getCategory()
    {
        return $this->hasOne(ProductCategory::class);
    }

    public function categoryValue()
    {
        return $this->hasOne(CategoryValue::class);
    }
}
