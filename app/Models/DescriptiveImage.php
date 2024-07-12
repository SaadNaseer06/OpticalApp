<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DescriptiveImage extends Model
{
    use HasFactory;

    protected $fillable = ['product_id', 'descriptive_images'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
