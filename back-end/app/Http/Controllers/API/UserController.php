<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    use ApiResponseTrait;

    public function getProfile(Request $request)
    {
        try {
            $user = $request->user();
            
            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Profile retrieved successfully',
                'data' => [
                    'user' => $user
                ]
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to retrieve profile: ' . $e->getMessage(), 500);
        }
    }

    public function updateProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:255',
            'phone_number' => 'required|string|unique:users,phone_number,' . $request->user()->id,
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = $request->user();
            $user->update([
                'username' => $request->username,
                'phone_number' => $request->phone_number,
            ]);

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Profile updated successfully',
                'data' => [
                    'user' => $user
                ]
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to update profile: ' . $e->getMessage(), 500);
        }
    }

    public function updatePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'current_password' => 'required|string',
            'new_password' => 'required|string|min:8|different:current_password',
            'confirm_password' => 'required|same:new_password'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = $request->user();

            if (!Hash::check($request->current_password, $user->password)) {
                return $this->errorResponse('Current password is incorrect', 401);
            }

            $user->update([
                'password' => Hash::make($request->new_password)
            ]);

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Password updated successfully',
                'data' => null
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to update password: ' . $e->getMessage(), 500);
        }
    }

    public function updateUserType(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_type' => 'required|string|in:user,admin,agent'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = $request->user();
            $user->update([
                'user_type' => $request->user_type
            ]);

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'User type updated successfully',
                'data' => [
                    'user' => $user
                ]
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to update user type: ' . $e->getMessage(), 500);
        }
    }
}