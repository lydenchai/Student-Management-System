<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Modules\Permission\Http\Controllers\PermissionController;
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

Route::middleware('auth:api')->get('/permission', function (Request $request) {
    return $request->user();
});

// Permission Public Route
Route::get('/permissions', [PermissionController::class, 'index']);
Route::get('/permissions/{id}', [PermissionController::class, 'show']);

// Permission Private Route
Route::post('/permissions', [PermissionController::class, 'store']);
Route::put('/permissions/{id}', [PermissionController::class, 'update']);
Route::delete('/permissions/{id}', [PermissionController::class, 'destroy']);