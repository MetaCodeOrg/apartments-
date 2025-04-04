<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $fillable = [
        'username',
        'email',
        'password',
        'phone_number',
        'is_phone_verified',
        'is_email_verified',
        'user_type',
        'token',
        'verification_code',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'is_phone_verified' => 'boolean',
        'is_email_verified' => 'boolean',
        'password' => 'hashed',
    ];

    public function apartments(): HasMany
    {
        return $this->hasMany(Apartment::class);
    }
}
