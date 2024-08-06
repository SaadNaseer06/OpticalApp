<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Cart;
use App\Http\Resources\CartItemCollection;
use App\Models\CartItem;
use Illuminate\Support\Facades\Validator;
use App\Models\ProductAttribute;
use App\Models\Product;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Models\Order;

class CartController extends Controller
{
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 400);
        }

        $productID = $request->input('product_id');
        $userID = null;

        if (Auth::guard('api')->check()) {
            $userID = auth('api')->user()->id;
        }

        $key = Str::random(40);

        try {
            $cart = Cart::create([
                'key' => $key,
                'user_id' => $userID,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 0,
                'message' => 'Unable to create the cart. Error: ' . $e->getMessage(),
            ], 500);
        }

        try {
            $product = Product::findOrFail($productID);
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'message' => 'The Product you\'re trying to add does not exist.',
            ], 404);
        }

        CartItem::create(['cart_id' => $cart->id, 'product_id' => $productID]);

        $cartItems = CartItem::where('cart_id', $cart->id)->with('product')->get();

        return response()->json([
            'status' => 1,
            'message' => 'The Cart was updated with the given product information successfully',
            'cart_key' => $cart->key,
            'cart_items' => $cartItems,
        ], 200);
    }

    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cartKey' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 400);
        }

        $cartKey = $request->input('cartKey');
        $cart = Cart::where('key', $cartKey)->with('items')->first();

        if ($cart) {
            if ($cart->items->isEmpty()) {
                return response()->json([
                    'message' => 'Cart found, but no items in cart.',
                ], 200);
            }

            return response()->json([
                'cart' => $cart->id,
                'Items in Cart' => new CartItemCollection($cart->items),
            ], 200);
        } else {
            return response()->json([
                'message' => 'The CartKey you provided does not match any Cart.',
            ], 400);
        }
    }

    public function destroy(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cartKey' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 400);
        }


        $cartKey = $request->input('cartKey');

        $cart = Cart::where('key', $cartKey)->first();

        if ($cart->key == $cartKey) {
            $cart->delete();
            return response()->json([
                'status' => 1,
                'message' => 'Cart Deleted Successfully'
            ]);
        } elseif ($cart->key == null) {
            return response()->json([
                'status' => 0,
                'message' => 'Cart Key does not exist'
            ]);
        } else {

            return response()->json([
                'message' => 'The CarKey you provided does not match the Cart Key for this Cart.',
            ], 400);
        }
    }

    public function checkout(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|numeric|min:1|max:10',
            'totalPrice' => 'required|numeric',
            'value' => 'required|string',
            'name' => 'required|string',
            'address' => 'required|string',
            'phone' => 'required|numeric'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 400);
        }

        $productID = $request->input('product_id');
        $quantity = $request->input('quantity');
        $totalPrice = $request->input('totalPrice');
        $value = $request->input('value');
        $name = $request->input('name');
        $address = $request->input('address');
        $phone = $request->input('phone');
        $userID = null;

        if (Auth::guard('api')->check()) {
            $userID = auth('api')->user()->id;
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'User is not authenticated.',
            ], 401);
        }

        try {
            $order = Order::create([
                'product_id' => $productID,
                'user_id' => $userID,
                'quantity' => $quantity,
                'totalPrice' => $totalPrice,
                'value' => $value,
                'name' => $name,
                'address' => $address,
                'phone' => $phone
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 0,
                'message' => 'Unable to create the order. Error: ' . $e->getMessage(),
            ], 500);
        }

        try {
            $cart = Cart::where('user_id', $userID)->first();
            if ($cart) {
                CartItem::where('cart_id', $cart->id)->delete();
                $cart->delete();
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 0,
                'message' => 'Unable to remove the cart. Error: ' . $e->getMessage(),
            ], 500);
        }

        return response()->json([
            'status' => 1,
            'message' => 'Order placed successfully and cart removed.',
            'order' => $order,
        ], 201);
    }
}
