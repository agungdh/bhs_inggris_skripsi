<?php

Route::get('/', 'MainController@index')->name('main.index');
Route::get('/logout', 'MainController@logout')->name('main.logout');
Route::post('/login', 'MainController@login')->name('main.login');

Route::get('/temp', 'TempController@index')->name('temp.index');
Route::post('/temp', 'TempController@sendData')->name('temp.sendData');

Route::middleware(['MustLoggedIn'])->group(function () {
	Route::get('/profil', 'MainController@profil')->name('main.profil');
	Route::put('/profil', 'MainController@saveProfil')->name('main.saveProfil');

	Route::get('/publicajax/getPegawaiWithBidangSektor', 'PublicAjaxController@getPegawaiWithBidangSektor')->name('publicAjax.getPegawaiWithBidangSektor');
	Route::get('/publicajax/getBidangSektor', 'PublicAjaxController@getBidangSektor')->name('publicAjax.getBidangSektor');
	Route::get('/publicajax/getPegawai', 'PublicAjaxController@getPegawai')->name('publicAjax.getPegawai');

	Route::get('/sewakendaraan/{id_kendaraan}', 'SewaKendaraanController@index')->name('sewakendaraan.index');
	Route::get('/sewakendaraan/{id_kendaraan}/create', 'SewaKendaraanController@create')->name('sewakendaraan.create');
	Route::post('/sewakendaraan/{id_kendaraan}', 'SewaKendaraanController@store')->name('sewakendaraan.store');
	Route::get('/sewakendaraan/{id}/edit', 'SewaKendaraanController@edit')->name('sewakendaraan.edit');
	Route::put('/sewakendaraan/{id}', 'SewaKendaraanController@update')->name('sewakendaraan.update');
	Route::delete('/sewakendaraan/{id}', 'SewaKendaraanController@destroy')->name('sewakendaraan.destroy');

	Route::get('/gajisupir/{id_pegawai}', 'GajiSupirController@index')->name('gajisupir.index');
	Route::get('/gajisupir/{id_pegawai}/create', 'GajiSupirController@create')->name('gajisupir.create');
	Route::post('/gajisupir/{id_pegawai}', 'GajiSupirController@store')->name('gajisupir.store');
	Route::get('/gajisupir/{id}/edit', 'GajiSupirController@edit')->name('gajisupir.edit');
	Route::put('/gajisupir/{id}', 'GajiSupirController@update')->name('gajisupir.update');
	Route::delete('/gajisupir/{id}', 'GajiSupirController@destroy')->name('gajisupir.destroy');

	Route::resources([
		'bidangsektor' => 'BidangSektorController',
		'pegawai' => 'PegawaiController',
		'supir' => 'SupirController',
		'petugasjaga' => 'PetugasJagaController',
		'fungsiumum' => 'FungsiUmumController',
		'kendaraan' => 'KendaraanController',
		'pemakaian' => 'PemakaianController',
		'user' => 'UserController',
	]);
});