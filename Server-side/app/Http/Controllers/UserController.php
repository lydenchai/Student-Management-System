<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
    public function index()
    {
        return UserResource::collection(User::with('student')->latest()->get());
    }

    public function register(Request $request)
    {
        $request->validate([
            'username' => 'required|max:50',
            'email' => 'required|unique:users',
            'password' => 'required|min:8',
            'image' => 'nullable|image|mimes:jpg,jpeg,png,gif,jfif|max:1999',
        ]);
        $request->file('image')->store('public/images');
        $user = new User();
        $user->username = $request->username;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->role = $request->role;
        $user->student_id = $request->student_id;
        $user->image = $request->file('image')->hashName();
        $user->save();
        $token = $user->createToken('MyToken')->plainTextToken;
        return response()->json([
            'Message' => 'User Created',
            'data' => $user,
            'token' => $token
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getUserByID($id)
    {
        return User::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateUser(Request $request, $id)
    {
        $request->validate([
            'username' => 'required|max:50',
            'email' => 'required',
            'password' => 'required|min:8',
        ]);
        $user = User::findOrFail($id);
        $user->username = $request->username;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->role = $request->role;
        $user->student_id = $request->student_id;
        $user->save();
        return response()->json([
            'Message' => 'User Updated',
            'data' => $user,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function deleteUser($id)
    {
        $isDeleted = User::destroy($id);
        if ($isDeleted == 1) {
            return response()->json(['massage' => 'Deleted'], 200);
        } else {
            return response()->json(['massage' => 'Not Found'], 404);
        }
    }

    // User log out 
    public function logout(Request $request)
    {
        auth()->user()->tokens()->delete();
        return response()->json(['Message' => 'Logouted']);
    }

    // user log in 
    public function login(Request $request)
    {
        $user = User::where('email', $request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['Message' => 'Bed login']);
        }
        $token = $user->createToken('MyToken')->plainTextToken;
        return response()->json([
            'Message' => 'Logined',
            'data' => $user,
            'token' => $token
        ]);
    }

    // Search user
    public function searchUser($username)
    {
        return User::where('username', 'like', '%' . $username . '%')->get();
    }
}
