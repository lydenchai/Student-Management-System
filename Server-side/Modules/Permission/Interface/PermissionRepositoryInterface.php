<?php

namespace Permission\Interface;

interface PermissionRepositoryInterface
{
    public function getAllPermissions();
    public function createPermission(array $permissionDetails);
    public function getPermissionById($permissionId);
    public function updatePermission($permissionId, array $newDetails);
    public function deletePermission($permissionId);
}
