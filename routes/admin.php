<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\PetProductController;
use App\Http\Controllers\Admin\UserController;
// use App\Http\Controllers\Admin\CategoryController;
// use App\Http\Controllers\Admin\ProductController;

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

Route::get('/', [DashboardController::class, 'index'])->name('dashboard.index');

Route::prefix('tai-khoan')->group(function () {
    Route::get('/', [UserController::class, 'index'])->name('user.index');
    Route::get('xoa/{id}', [UserController::class, 'remove'])->name('user.remove');
    Route::get('tao-moi', [UserController::class, 'addForm'])->name('user.add');
    Route::post('tao-moi', [UserController::class, 'saveAdd']);
    Route::get('cap-nhat/{id}', [UserController::class, 'editForm'])->name('user.edit');
    Route::post('cap-nhat/{id}', [UserController::class, 'saveEdit']);
    Route::get('ho-so/{id}', [UserController::class, 'proFile'])->name('user.profile');
    Route::get('doi-mat-khau/{id}', [UserController::class, 'changePForm'])->name('user.changeP');
    Route::post('doi-mat-khau/{id}', [UserController::class, 'saveChangeP']);
});

Route::prefix('thu-cung')->group(function () {
    Route::get('/', [PetProductController::class, 'index'])->name('pet.index');
    Route::get('detail/{id}', [PetProductController::class, 'detail'])->name('pet.detail');
    Route::delete('xoa/{id}', [PetProductController::class, 'remove'])->name('pet.remove');
    Route::get('tao-moi', [PetProductController::class, 'addForm'])->name('pet.add');
    Route::post('tao-moi', [PetProductController::class, 'saveAdd'])->name('pet.saveAdd');
    Route::get('cap-nhat/{id}', [PetProductController::class, 'editForm'])->name('pet.edit');
    Route::post('cap-nhat/{id}', [PetProductController::class, 'saveEdit'])->name('pet.saveEdit');
    Route::post('upload', [PetProductController::class, 'upload'])->name('pet.upload');
    Route::get('dataPet', [PetProductController::class, 'getData'])->name('pet.filter');
    Route::post('import', [PetProductController::class, 'store'])->name('pet.import');
});

// Route::prefix('danh-muc')->group(function () {
//     Route::get('/', [CategoryController::class, 'index'])->name('category.index');
//     Route::get('detail/{id}', [CategoryController::class, 'detail'])->name('category.detail');
//     Route::get('xoa/{id}', [CategoryController::class, 'remove'])->name('category.remove');
//     Route::get('tao-moi', [CategoryController::class, 'addForm'])->name('category.add');
//     Route::post('tao-moi', [CategoryController::class, 'saveAdd']);
//     Route::get('cap-nhat/{id}', [CategoryController::class, 'editForm'])->name('category.edit');
//     Route::post('cap-nhat/{id}', [CategoryController::class, 'saveEdit']);
// });

// Route::prefix('san-pham')->group(function () {
//     Route::get('/', [ProductController::class, 'index'])->name('product.index');
//     Route::get('xoa/{id}', [ProductController::class, 'remove'])->middleware('permission:remove product')->name('product.remove');

//     Route::middleware('permission:add product')->group(function(){
//         Route::get('tao-moi', [ProductController::class, 'addForm'])->name('product.add');
//         Route::post('tao-moi', [ProductController::class, 'saveAdd']);
//         Route::get('cap-nhat/{id}', [ProductController::class, 'editForm'])->name('product.edit');
//         Route::post('cap-nhat/{id}', [ProductController::class, 'saveEdit']);
//     });
// });