<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    use ApiResponseTrait;

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'phone_number' => 'required|string|unique:users'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = User::create([
                'username' => $request->username,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'phone_number' => $request->phone_number,
                'verification_code' => Str::random(6)
            ]);

            $token = $user->createToken('auth_token')->plainTextToken;

            return $this->successResponse([
                'user' => $user,
                'token' => $token
            ], 'User registered successfully', 201);

        } catch (\Exception $e) {
            return $this->errorResponse('Registration failed: ' . $e->getMessage(), 500);
        }
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = User::where('email', $request->email)->first();
            
            if (!$user || !Hash::check($request->password, $user->password)) {
                return $this->errorResponse('Invalid login credentials', 401);
            }
            

            if (!$user->is_email_verified) {
                // Generate new verification code
                $verificationCode = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
                $user->update(['verification_code' => $verificationCode]);

                // Here you should implement email sending with the verification code
                // Mail::to($user->email)->send(new VerificationEmail($verificationCode));

                return $this->errorResponse('Email not verified',403);
            }

            $token = $user->createToken('auth_token')->plainTextToken;
            $user->update(['token' => $token]);


            return $this->successResponse([
                'user' => $user,
                'token' => $token
            ], 'Logged in successfully');

        } catch (\Exception $e) {
            return $this->errorResponse('Login failed: ' . $e->getMessage(), 500);
        }
    }

    public function sendVerificationCode(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = User::where('email', $request->email)->first();
            $verificationCode = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            $user->update(['verification_code' => $verificationCode]);


            // Here implement email sending with verification code
            // Mail::to($user->email)->send(new VerificationEmail($verificationCode));

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Verification code sent successfully',
                'data' => [
                    'verification_code' => $verificationCode
                ]
            ], 200);

        } catch (\Exception $e) {
            return $this->errorResponse('Failed to send verification code: ' . $e->getMessage(), 500);
        }
    }

    public function resendVerificationCode(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = User::where('email', $request->email)->first();
            
            if ($user->is_email_verified) {
                return $this->errorResponse('Email is already verified', 400);
            }

            $verificationCode = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            $user->update(['verification_code' => $verificationCode]);

            // Here implement email sending with verification code
            // Mail::to($user->email)->send(new VerificationEmail($verificationCode));

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Verification code resent successfully',
                'data' => [
                    'verification_code' => $verificationCode
                ]
            ], 200);

        } catch (\Exception $e) {
            return $this->errorResponse('Failed to resend verification code: ' . $e->getMessage(), 500);
        }
    }

    public function forgotPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = User::where('email', $request->email)->first();
            return $this->successResponse(null, 'Password reset code sent to your email');

        } catch (\Exception $e) {
            return $this->errorResponse('Failed to process request: ' . $e->getMessage(), 500);
        }
    }

    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users',
            // 'verification_code' => 'required|string',
            'password' => 'required|string|min:8'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = User::where('email', $request->email)
                        // ->where('verification_code', $request->verification_code)
                        ->first();

            if (!$user) {
                return $this->errorResponse('Invalid verification code', 400);
            }

            $user->update([
                'password' => Hash::make($request->password),
                'verification_code' => null
            ]);

            return $this->successResponse(null, 'Password reset successfully');

        } catch (\Exception $e) {
            return $this->errorResponse('Password reset failed: ' . $e->getMessage(), 500);
        }
    }

    public function verifyEmail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users',
            'verification_code' => 'required|string'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $user = User::where('email', $request->email)
                        ->where('verification_code', $request->verification_code)
                        ->first();

            if (!$user) {
                return $this->errorResponse('Invalid verification code', 400);
            }

            $user->update([
                'is_email_verified' => true,
                'verification_code' => null
            ]);

            return $this->successResponse(null, 'Email verified successfully');

        } catch (\Exception $e) {
            return $this->errorResponse('Email verification failed: ' . $e->getMessage(), 500);
        }
    }

    public function logout(Request $request)
    {
        try {
            $request->user()->currentAccessToken()->delete();
            return $this->successResponse(null, 'Logged out successfully');
        } catch (\Exception $e) {
            return $this->errorResponse('Logout failed: ' . $e->getMessage(), 500);
        }
    }
}