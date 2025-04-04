<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Request;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request as HttpRequest;
use Illuminate\Support\Facades\Validator;

class RequestController extends Controller
{
    use ApiResponseTrait;

    public function store(HttpRequest $request)
    {
        $validator = Validator::make($request->all(), [
            'apartment_id' => 'required|exists:apartments,id',
            'message' => 'nullable|string'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $requestModel = Request::create([
                'user_id' => $request->user()->id,
                'apartment_id' => $request->apartment_id,
                'message' => $request->message,
                'status' => 'pending'
            ]);

            return response()->json([
                'status' => 'Success',
                'code' => 201,
                'message' => 'Request sent successfully',
                'data' => $requestModel
            ], 201);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to send request: ' . $e->getMessage(), 500);
        }
    }

    public function updateStatus(HttpRequest $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|in:accepted,rejected'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $requestModel = Request::findOrFail($id);
            
            // Check if the user owns the apartment
            if ($requestModel->apartment->user_id !== $request->user()->id) {
                return $this->errorResponse('Unauthorized', 403);
            }

            $requestModel->update(['status' => $request->status]);

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Request status updated successfully',
                'data' => $requestModel
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to update request: ' . $e->getMessage(), 500);
        }
    }

    public function myRequests(HttpRequest $request)
    {
        try {
            $requests = Request::where('user_id', $request->user()->id)
                             ->with(['apartment', 'apartment.user'])
                             ->get();

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Requests retrieved successfully',
                'data' => $requests
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to retrieve requests: ' . $e->getMessage(), 500);
        }
    }

    public function receivedRequests(HttpRequest $request)
    {
        try {
            $requests = Request::whereHas('apartment', function($query) use ($request) {
                            $query->where('user_id', $request->user()->id);
                        })
                        ->with(['user', 'apartment'])
                        ->get();

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Received requests retrieved successfully',
                'data' => $requests
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to retrieve requests: ' . $e->getMessage(), 500);
        }
    }
}