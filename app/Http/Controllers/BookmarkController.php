<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\User;
use App\Models\Bookmark;
use Illuminate\Http\Request;

class BookmarkController extends Controller
{
    public function wishlist(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
            'product_id' => 'required',
        ]);

        $user = User::where('id', $request->input('user_id'))->first();
        $product = Product::where('id', $request->input('product_id'))->first();

        if ($user && $product) {
            $existingBookmark = Bookmark::where('user_id', $request->input('user_id'))
                ->where('product_id', $request->input('product_id'))
                ->first();

            if ($existingBookmark) {
                return response()->json([
                    'status' => 0,
                    'message' => 'Product already in wishlist',
                ]);
            }

            $bookmark = new Bookmark;
            $bookmark->user_id = $request->input('user_id');
            $bookmark->product_id = $request->input('product_id');
            $bookmark->save();

            return response()->json([
                'status' => 1,
                'message' => 'Product added to wishlist',
                'data' => $bookmark
            ]);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'Something went wrong!'
            ]);
        }
    }


    public function getWishlist(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
            'product_id' => 'required',
        ]);

        $bookmarks = Bookmark::where('user_id', $request->user_id)
            ->where('product_id', $request->product_id)
            ->first();

        if ($bookmarks) {
            return response()->json(['status' => 1, 'message' => 'Wishlist retrieved successfully', 'data' => $bookmarks]);
        } else {
            return response()->json(['status' => 0, 'message' => 'Wishlist not found', 'data' => NULL]);
        }
    }

    public function deleteWishlist(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
            'product_id' => 'required'
        ]);

        $bookmark = Bookmark::where('user_id', $request->user_id)
            ->where('product_id', $request->product_id)
            ->delete();
        if ($bookmark) {
            return response()->json(['status' => 1, 'message' => 'Wishlist deleted successfully']);
        } else {
            return response()->json(['status' => 0, 'message' => 'Wishlist not found']);
        }
    }

    public function cart(Request $request)
    {
    }
}
