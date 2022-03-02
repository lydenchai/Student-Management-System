<?php

use Modules\Score\Providers\ScoreServiceProvider;

return [
    'name' => 'Score',
    'providers' => [
        Score\Providers\ScoreServiceProvider::class,
    ]
];
