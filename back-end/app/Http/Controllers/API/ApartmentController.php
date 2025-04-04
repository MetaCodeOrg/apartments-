<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Apartment;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ApartmentController extends Controller
{
    use ApiResponseTrait;

    public function index()
    {
        try {
            $apartments = Apartment::with('user')->get();
            
            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Apartments retrieved successfully',
                'data' => $apartments
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to retrieve apartments: ' . $e->getMessage(), 500);
        }
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'governorate' => 'required|string',
            'city' => 'required|string',
            'street' => 'required|string',
            'price' => 'required|numeric',
            'apartment_type' => 'required|in:rent,Furnished',
            'long_description' => 'required|string',
            'short_description' => 'required|string',
            'images.*' => 'required|image|mimes:jpeg,png,jpg|max:2048'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $imagePaths = [];
            if ($request->hasFile('images')) {
                foreach ($request->file('images') as $image) {
                    $path = $image->store('apartments', 'public');
                    $imagePaths[] = $path;
                }
            }

            $apartment = Apartment::create([
                'user_id' => $request->user()->id,
                'title' => $request->title,
                'governorate' => $request->governorate,
                'city' => $request->city,
                'street' => $request->street,
                'price' => $request->price,
                'apartment_type' => $request->apartment_type,
                'long_description' => $request->long_description,
                'short_description' => $request->short_description,
                'images' => $imagePaths,
                'rating' => 0.0
            ]);

            return response()->json([
                'status' => 'Success',
                'code' => 201,
                'message' => 'Apartment created successfully',
                'data' => $apartment
            ], 201);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to create apartment: ' . $e->getMessage(), 500);
        }
    }

    public function show($id)
    {
        try {
            $apartment = Apartment::with('user')->findOrFail($id);
            
            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Apartment retrieved successfully',
                'data' => $apartment
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Apartment not found', 404);
        }
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'string|max:255',
            'governorate' => 'string',
            'city' => 'string',
            'street' => 'string',
            'price' => 'numeric',
            'apartment_type' => 'in:rent,Furnished',
            'long_description' => 'string',
            'short_description' => 'string',
            'images.*' => 'image|mimes:jpeg,png,jpg|max:2048'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors(), 422);
        }

        try {
            $apartment = Apartment::findOrFail($id);
            
            if ($apartment->user_id !== $request->user()->id) {
                return $this->errorResponse('Unauthorized', 403);
            }

            $updateData = $request->only([
                'title', 'governorate', 'city', 'street', 'price',
                'apartment_type', 'long_description', 'short_description'
            ]);

            if ($request->hasFile('images')) {
                $imagePaths = [];
                foreach ($request->file('images') as $image) {
                    $path = $image->store('apartments', 'public');
                    $imagePaths[] = $path;
                }
                $updateData['images'] = $imagePaths;
            }

            $apartment->update($updateData);

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Apartment updated successfully',
                'data' => $apartment
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to update apartment: ' . $e->getMessage(), 500);
        }
    }

    public function destroy($id)
    {
        try {
            $apartment = Apartment::findOrFail($id);
            
            if ($apartment->user_id !== auth()->id()) {
                return $this->errorResponse('Unauthorized', 403);
            }

            $apartment->delete();

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Apartment deleted successfully',
                'data' => null
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Failed to delete apartment: ' . $e->getMessage(), 500);
        }
    }

    public function search(Request $request)
    {
        try {
            $query = Apartment::query();

            if ($request->has('governorate')) {
                $query->where('governorate', 'like', '%' . $request->governorate . '%');
            }
            if ($request->has('city')) {
                $query->where('city', 'like', '%' . $request->city . '%');
            }
            if ($request->has('price_min')) {
                $query->where('price', '>=', $request->price_min);
            }
            if ($request->has('price_max')) {
                $query->where('price', '<=', $request->price_max);
            }
            if ($request->has('apartment_type')) {
                $query->where('apartment_type', $request->apartment_type);
            }

            $apartments = $query->with('user')->get();

            return response()->json([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Search results retrieved successfully',
                'data' => $apartments
            ], 200);
        } catch (\Exception $e) {
            return $this->errorResponse('Search failed: ' . $e->getMessage(), 500);
        }
    }
}