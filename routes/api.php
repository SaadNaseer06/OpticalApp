<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
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
