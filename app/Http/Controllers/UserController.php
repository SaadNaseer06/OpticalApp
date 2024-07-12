<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Mail;
use App\Models\ForgetPassword;

class UserController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users,email',
            'password' => 'required|min:8',
            'role' => 'required'
        ]);
        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->role = $request->role;
        $user->status = 1;
        $user->save();

        return response()->json(['status' => 1, 'message' => 'user created successfully', 'data' => $user]);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            if (!$user || $user->status == 0) {
                return response()->json(['status' => 0, 'message' => 'Your account is inactive'], 403);
            }

            $token = $user->createToken('Token')->plainTextToken;

            $user->forceFill([
                'remember_token' => $token,
            ]);
            $user->save();

            return response()->json(['status' => 1, 'data' => $user, 'token' => $token, 'message' => "User Log In Successfully"], 201);
        }

        return response()->json(['status' => '0', "data" => null, "message" => "Invalid Email or Password"], 401);
    }


    public function forgotPassword(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email|exists:users,email',
            ]);
        } catch (ValidationException $e) {
            return response()->json(['status' => 0, 'message' => 'Email not found'], 404);
        }

        $otp = random_int(100000, 999999);
        $expiration = now()->addMinutes(5);

        $user = User::where('email', $request->email)->first();

        if (!$user || $user->status == 0) {
            return response()->json(['status' => 0, 'message' => 'Your account is inactive'], 403);
        }
        ForgetPassword::create([
            'user_id' => $user->id,
            'otp' => $otp,
            'expires_at' => $expiration
        ]);

        Mail::raw("Your OTP for password reset is: $otp", function ($message) use ($request) {
            $message->to($request->email)->subject('Password Reset OTP');
        });

        return response()->json(['status' => 1, 'data' => $user, 'message' => 'OTP has been sent to your email'], 200);
    }

    public function resetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users,email',
            'otp' => 'required|digits:6',
            'password' => 'required|string|min:6',
        ]);

        $user = User::where('email', $request->email)->first();
        if($user == null){
            return response()->json(['status' => 0,'message' => 'Email Not Found!'],404);
        }
        
        $forgetPassword = ForgetPassword::where('user_id', $user->id)->latest()->first();

        if ($forgetPassword && $forgetPassword->otp == $request->otp) {
            if (now()->gt($forgetPassword->expires_at)) {
                $forgetPassword->delete();
                return response()->json(['status' => 0,'error' => 'OTP has expired'], 401);
            }

            $user->password = Hash::make($request->password);
            $user->save();

            $forgetPassword->delete();

            return response()->json(['status' => 1,'message' => 'Password reset successful'], 200);
        }

        return response()->json(['status' => 0,'message' => 'Invalid OTP'], 401);
    }
}
