<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Modules\Disciple\Http\Controllers\DiscipleController;
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

Route::middleware('auth:api')->get('/disciple', function (Request $request) {
    return $request->user();
});

// Disciple Public Route
Route::get('/disciples', [DiscipleController::class, 'index']);
Route::get('/disciples/{id}', [DiscipleController::class, 'show']);

// Disciple Private Route
Route::post('/disciples', [DiscipleController::class, 'store']);
Route::put('/disciples/{id}', [DiscipleController::class, 'update']);
Route::delete('/disciples/{id}', [DiscipleController::class, 'destroy']);
