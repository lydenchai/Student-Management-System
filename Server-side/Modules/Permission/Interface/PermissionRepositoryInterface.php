<?php

namespace Permission\Interface;

interface PermissionRepositoryInterface
{
    public function all();
    public function save(array $data);
    public function find($id);
    public function update($id, array $newData);
    public function delete($id);
}
