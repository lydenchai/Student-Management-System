<?php

namespace Modules\Score\Providers;
use Illuminate\Support\ServiceProvider;
use Score\Repositories\ScoreRepositoryImpl;
use Score\Interface\ScoreRepositoryInterface;

class ScoreServiceProvider extends ServiceProvider
{
    public function register()
	{
		$this->app->bind(
			ScoreRepositoryInterface::class,
			ScoreRepositoryImpl::class
		);
    }
}
