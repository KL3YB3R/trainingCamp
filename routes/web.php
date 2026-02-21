<?php

use App\Http\Controllers\AddressController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\AforoController;
use App\Http\Controllers\GalleryController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\VisitorsController;
use Illuminate\Support\Facades\Route;

Route::controller(HomeController::class)->group(function () {
    Route::get('/', 'index')->name('home');
});

Route::controller(LoginController::class)->group(function () {
    Route::get('/login', 'index')->name('login');
    Route::post('/login/authenticate', 'authenticate')->name('login.authenticate');
    Route::get('/logout', 'logout')->name('logout');
});

Route::controller(RegisterController::class)->group(function () {
    Route::get('/register', 'index')->name('register');
    Route::post('/register/saveUser', 'saveUser')->name('register.saveUser');
});

Route::controller(NewsController::class)->group(function () {
    Route::get('/news', 'index')->name('news.index');
    Route::post('/news/getNews', 'getNews')->name('news.getNews');
});

Route::controller(GalleryController::class)->group(function () {
    Route::get('/gallery', 'index')->name('gallery.index');
    Route::post('/gallery/getImages', 'getImages')->name('gallery.getImages');
});

Route::middleware(['auth', 'verified'])->group(function () {
    Route::controller(VisitorsController::class)->group(function () {
        Route::get('/visitors', 'index')->name('visitors.index');
    });

    Route::controller(ReservationController::class)->group(function () {
        Route::post('/reservation/store', 'store')->name('reservation.index');
        Route::post('/reservation/pay', 'pay')->name('reservation.pay');
        Route::post('/reservation/edit', 'edit')->name('reservation.edit');
        Route::post('/reservation/delete', 'delete')->name('reservation.delete');
        Route::post('/reservation/getInformationReservation', 'getInformationReservation')->name('reservation.getInformationReservation');
    });

    Route::controller(AdminController::class)->group(function () {
        Route::get('/admin', 'index')->name('admin.index');
        Route::post('/admin/getUsers', 'getUsers')->name('admin.getUsers');
        Route::post('/admin/getReservations', 'getReservations')->name('admin.getReservations');
        Route::post('/admin/getPayments', 'getPayments')->name('admin.getPayments');
        Route::post('/admin/deleteUser', 'deleteUser')->name('admin.deleteUser');
        Route::post('/admin/updateStatusPayments', 'updateStatusPayments')->name('admin.updateStatusPayments');
        Route::post('/admin/getParameters', 'getParameters')->name('admin.getParameters');
    });

    Route::controller(AforoController::class)->group(function () {
        Route::post('/aforo/store', 'store')->name('admin.store');
    });

    Route::controller(AddressController::class)->group(function () {
        Route::post('/address/getStates', 'getStates')->name('address.getStates');
        Route::post('/address/getMunicipalities', 'getMunicipalities')->name('address.getMunicipalities');
        Route::post('/address/getParishes', 'getParishes')->name('address.getParishes');
    });

    Route::controller(NewsController::class)->group(function () {
        Route::post('/news/store', 'store')->name('news.store');
        Route::post('/news/delete', 'delete')->name('gallery.delete');
    });
        
    Route::controller(GalleryController::class)->group(function () {
        Route::post('/gallery/store', 'store')->name('gallery.store');
        Route::post('/gallery/delete', 'delete')->name('gallery.delete');
    });
});

