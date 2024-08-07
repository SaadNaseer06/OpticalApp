<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AddressDetail;
use Illuminate\Support\Facades\Validator;

class AddressDetailController extends Controller
{
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'email' => 'required',
            'first_name' => 'required',
            'last_name' => 'required',
            'phone' => 'required',
            'state' => 'required',
            'city' => 'required',
            'house_number' => 'required',
            'street' => 'required',
            'area' => 'required',
            'postal_code' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ]);
        }

        try {
            $address = AddressDetail::create([
                'user_id' => $request->input('user_id'),
                'email' => $request->input('email'),
                'first_name' => $request->input('first_name'),
                'last_name' => $request->input('last_name'),
                'phone' => $request->input('phone'),
                'state' => $request->input('state'),
                'city' => $request->input('city'),
                'house_number' => $request->input('house_number'),
                'street' => $request->input('street'),
                'area' => $request->input('area'),
                'postal_code' => $request->input('postal_code')
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 0,
                'message' => 'Unable to create address details.Error ' . $e->getMessage()
            ]);
        }

        if ($address) {
            return response()->json([
                'status' => 1,
                'message' => 'Address Detail Added Successfully',
                'data' => $address
            ]);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'Something Went Wrong!'
            ]);
        }
    }

    public function getDetails(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ]);
        }

        $userID = $request->input('user_id');
        $address = AddressDetail::where('user_id', $userID)->get();

        if($address)
        {
            return response()->json([
                'status' => 1,
                'message' => 'Details Fetch Successfully',
                'data' => $address
            ]);
        } else {
            return response()->json(['status' => 0, 'message' => 'Something went wrong']);
        }
    }

    public function deleteAddress(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'user_id' => 'required',
            'house_number' => 'required'
        ]);

        if($validator->fails()){
            return response()->json([
                'errors' => $validator->fails()
            ]);
        }

        $userID = $request->input('user_id');
        $houseNumber = $request->input('house_number');

        $address = AddressDetail::where(['user_id' => $userID, 'house_number' => $houseNumber])->first();

        try {
            $address->delete();
            return response()->json([
                'status' => 1,
                'message' => 'Address Deleted Successfully'
            ]);
        } catch(\Exception $e) {
            return response()->json([
                'status' => 0,
                'message' => $e->getMessage()
            ]);
        }
    }
}
