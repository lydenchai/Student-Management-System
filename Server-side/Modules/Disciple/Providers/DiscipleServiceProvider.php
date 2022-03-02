<?php

namespace Modules\Disciple\Providers;

use Illuminate\Support\ServiceProvider;
use Disciple\Repositories\DiscipleRepositoryImpl;
use Disciple\Interface\DiscipleRepositoryInterface;

class DiscipleServiceProvider extends ServiceProvider
{
	public function register()
	{
		$this->app->bind(
			DiscipleRepositoryInterface::class,
			DiscipleRepositoryImpl::class
		);
	}
}
