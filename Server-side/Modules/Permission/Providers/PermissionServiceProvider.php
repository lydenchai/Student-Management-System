<?php

namespace Modules\Permission\Providers;

use Illuminate\Support\ServiceProvider;
use Permission\Repositories\PermissionRepositoryImpl;
use Permission\Interface\PermissionRepositoryInterface;

class PermissionServiceProvider extends ServiceProvider
{
	public function register()
	{
		$this->app->bind(
			PermissionRepositoryInterface::class,
			PermissionRepositoryImpl::class
		);
	}
}
