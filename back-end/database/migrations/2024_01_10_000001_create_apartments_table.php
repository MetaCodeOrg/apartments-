<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('apartments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('title');
            $table->string('governorate');
            $table->string('city');
            $table->string('street');
            $table->decimal('price', 10, 2);
            $table->text('long_description');
            $table->string('short_description');
            $table->enum('apartment_type', ['rent', 'Furnished'])->default('Furnished');
            $table->json('images')->nullable();
            $table->json('features')->nullable();  // Store features as JSON array
            $table->decimal('rating', 2, 1)->default(0.0);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('apartments');
    }
};
