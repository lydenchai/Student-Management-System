<?php

namespace Permission\Repositories;

use App\Models\Student;
use Modules\Permission\Entities\Permission;
use Permission\Interface\PermissionRepositoryInterface;


class PermissionRepositoryImpl implements PermissionRepositoryInterface
{
    //To view all the data
    public function getAllPermissions()
    {
        return Permission::with('student')->latest()->get();
    }

    //Store the data
    public function createPermission(array $permissionDetails)
    {
        return Permission::create($permissionDetails);
    }

    //Get an individual record
    public function getPermissionById($permissionId)
    {
        return Permission::findOrFail($permissionId);
    }

    //Update the data
    public function updatePermission($permissionId, array $newDetails)
    {
        return Permission::whereId($permissionId)->update($newDetails);
    }

    //Delete the data
    public function deletePermission($permissionId)
    {
        Permission::destroy($permissionId);
    }
}
