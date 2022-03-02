<?php

use Modules\Permission\Providers\PermissionServiceProvider;

return [
    'name' => 'Permission',
    'providers' => [
        Permission\Providers\PermissionServiceProvider::class,
    ]
];
