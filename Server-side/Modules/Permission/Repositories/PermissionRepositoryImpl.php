<?php

namespace Permission\Repositories;

use App\Models\Student;
use Modules\Permission\Entities\Permission;
use Permission\Interface\PermissionRepositoryInterface;


class PermissionRepositoryImpl implements PermissionRepositoryInterface
{
    //To view all the data
    public function all()
    {
        return Permission::with('student')->latest()->get();
    }

    //Store the data
    public function save(array $data)
    {
        return Permission::create($data);
    }

    //Get an individual record
    public function find($id)
    {
        return Permission::findOrFail($id);
    }

    //Update the data
    public function update($id, array $newData)
    {
        return Permission::whereId($id)->update($newData);
    }

    //Delete the data
    public function delete($id)
    {
        Permission::destroy($id);
    }
}
