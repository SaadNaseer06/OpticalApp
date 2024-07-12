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
}
