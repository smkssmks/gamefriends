<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('index');
// });

Route::get('/', [UserController::class, 'index'])
->name('index')->middleware('auth');

Route::post('/users', [UserController::class, 'users'])
->name('users')->middleware('auth');

Route::get('/user/{user}',[UserController::class, 'user'])
->name('user')->middleware('auth');

Route::get('/edit', [UserController::class, 'edit'])
->name('edit')->middleware('auth');

Route::get('/update', [UserController::class, 'update'])
->name('update')->middleware('auth');
Route::patch('/update', [UserController::class, 'update'])
->name('update')->middleware('auth');

Route::get('/search', [UserController::class, 'search'])
->name('search')->middleware('auth');

Route::get('/list', [UserController::class, 'list'])
->name('list')->middleware('auth');
Route::patch('/list', [UserController::class, 'list'])
->name('list')->middleware('auth');

Route::get('/delete', [UserController::class, 'delete'])
->name('delete')->middleware('auth');



Route::get('/deleteexe/{user}', [UserController::class, 'deleteexe'])
->name('deleteexe')->middleware('auth');



Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
