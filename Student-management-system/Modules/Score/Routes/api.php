<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Modules\Score\Http\Controllers\ScoreController;
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

Route::middleware('auth:api')->get('/score', function (Request $request) {
    return $request->user();
});

// Score Public Route
Route::get('/score', [ScoreController::class, 'index']);
Route::get('/score/{id}', [ScoreController::class, 'show']);

// Score Private Route
Route::post('/score', [ScoreController::class, 'store']);
Route::put('/score/{id}', [ScoreController::class, 'update']);
Route::delete('/score/{id}', [ScoreController::class, 'destroy']);