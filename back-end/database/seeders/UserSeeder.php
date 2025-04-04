<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        // Create admin user
        User::create([
            'username' => 'Admin',
            'email' => 'admin@example.com',
            'password' => Hash::make('password123'),
            'phone_number' => '1234567890',
            'is_phone_verified' => true,
            'is_email_verified' => true,
            'user_type' => 'admin',
        ]);

        // Create regular user
        User::create([
            'username' => 'User',
            'email' => 'user@example.com',
            'password' => Hash::make('password123'),
            'phone_number' => '0987654321',
            'is_phone_verified' => true,
            'is_email_verified' => true,
            'user_type' => 'user',
        ]);
    }
}