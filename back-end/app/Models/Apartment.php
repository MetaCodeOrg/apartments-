<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Storage;

class Apartment extends Model
{
    protected $fillable = [
        'user_id',
        'title',
        'governorate',
        'city',
        'street',
        'price',
        'long_description',
        'short_description',
        'apartment_type',
        'images',
        'features',
        'rating'
    ];

    protected $casts = [
        'images' => 'array',
        'features' => 'array',
        'price' => 'decimal:2',
        'rating' => 'decimal:1'
    ];

    protected $appends = ['image_urls'];

    public function getImageUrlsAttribute()
    {
        if (!$this->images) {
            return [];
        }
        
        return array_map(function($image) {
            return Storage::url($image);
        }, $this->images);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}