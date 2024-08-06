<?php

use App\Http\Controllers\BookmarkController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
use App\Models\Bookmark;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/register', [UserController::class, 'register']);
Route::post('/login', [UserController::class, 'login']);

Route::post('/forgotpassword', [UserController::class, 'forgotPassword']);
Route::post('/resetpassword', [UserController::class, 'resetPassword']);

Route::middleware('auth:api')->post('product', [ProductController::class, 'store']);
Route::get('products', [ProductController::class, 'index']);

Route::middleware('auth:api')->post('wishlist', [BookmarkController::class, 'wishlist']);
Route::middleware('auth:api')->get('get-wishlist', [BookmarkController::class, 'getWishlist']);
Route::middleware('auth:api')->post('delete-wishlist', [BookmarkController::class, 'deleteWishlist']);
Route::middleware('auth:api')->get('cart', [CartController::class, 'store']);
Route::middleware('auth:api')->get('cart-show', [CartController::class, 'show']);
Route::middleware('auth:api')->post('cart-delete', [CartController::class, 'destroy']);
Route::middleware('auth:api')->post('cart-product', [CartController::class, 'addProducts']);
Route::middleware('auth:api')->post('checkout', [CartController::class, 'checkout']);
Route::middleware('auth:api')->get('order', [OrderController::class, 'getOrders']);