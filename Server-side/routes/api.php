<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\StudentController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// Public route
Route::get('/user', [UserController::class, 'index']);
Route::get('/getUserByID/{id}', [UserController::class, 'getUserByID']);
Route::get('/searchUser/search/{username}', [UserController::class, 'searchUser']);

// Private route
Route::post('/register', [UserController::class, 'register']);
Route::post('/login', [UserController::class, 'login']);
Route::put('/updateUser/{id}', [UserController::class, 'updateUser']);
Route::delete('/deleteUser/{id}', [UserController::class, 'deleteUser']);

// ============================================================== STUDENT ============================================================
// Public route
Route::get('students', [StudentController::class, 'index']);
Route::get('students/{id}', [StudentController::class, 'show']);
Route::get('/searchStudent/search/{studentname}', [StudentController::class, 'searchStudent']);

// Private route
Route::post('students', [StudentController::class, 'store']);
Route::put('students/{id}', [StudentController::class, 'update']);
Route::delete('students/{id}', [StudentController::class, 'destroy']);
