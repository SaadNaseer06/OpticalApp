<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\CartItemCollection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Order;

class OrderController extends Controller
{
    public function getOrders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ]);
        }

        $userID = $request->input('user_id');

        $order = Order::where('user_id', $userID)->get();

        if ($order) {
            return response()->json([
                'status' => 1,
                'message' => 'Orders Fetch Successfully!',
                'data' => $order,
            ], 200);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'Something Went Wrong!'
            ]);
        }
    }
}
