<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\ApartmentController;
use App\Http\Controllers\API\RequestController;
use Illuminate\Support\Facades\Route;

Route::middleware('api')->group(function () {
    // Auth routes
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/forgot-password', [AuthController::class, 'forgotPassword']);
    Route::post('/reset-password', [AuthController::class, 'resetPassword']);
    Route::post('/verify-email', [AuthController::class, 'verifyEmail']);
    Route::post('/send-verification-code', [AuthController::class, 'sendVerificationCode']);
    Route::post('/resend-verification-code', [AuthController::class, 'resendVerificationCode']);

    // Protected routes
    // Add these inside your auth:sanctum middleware group
    Route::middleware('auth:sanctum')->group(function () {
        // User profile routes
        Route::get('/user/profile', [UserController::class, 'getProfile']);
        Route::put('/user/profile', [UserController::class, 'updateProfile']);
        Route::put('/user/password', [UserController::class, 'updatePassword']);
        Route::put('/user/type', [UserController::class, 'updateUserType']);
        
        // Existing logout route
        Route::post('/logout', [AuthController::class, 'logout']);
    });

    // Handle wrong method error
    Route::match(['get', 'put', 'delete'], '/register', function() {
        return response()->json([
            'status' => 'Error',
            'message' => 'Method not allowed. Please use POST method for registration.',
            'data' => null
        ], 405);
    });

    // Public routes
    Route::get('/apartments', [ApartmentController::class, 'index']);
    Route::get('/apartments/{id}', [ApartmentController::class, 'show']);
    Route::get('/apartments/search', [ApartmentController::class, 'search']);

    // Protected routes
    Route::middleware('auth:sanctum')->group(function () {
        Route::post('/apartments', [ApartmentController::class, 'store']);
        Route::put('/apartments/{id}', [ApartmentController::class, 'update']);
        Route::delete('/apartments/{id}', [ApartmentController::class, 'destroy']);
    });
    // Add these inside your auth:sanctum middleware group
    Route::middleware('auth:sanctum')->group(function () {
        // Request routes
        Route::post('/requests', [RequestController::class, 'store']);
        Route::put('/requests/{id}/status', [RequestController::class, 'updateStatus']);
        Route::get('/my-requests', [RequestController::class, 'myRequests']);
        Route::get('/received-requests', [RequestController::class, 'receivedRequests']);
    });
});