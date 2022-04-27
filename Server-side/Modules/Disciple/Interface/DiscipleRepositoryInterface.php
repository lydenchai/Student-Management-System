<?php

namespace Disciple\Interface;

interface DiscipleRepositoryInterface
{
    public function all();
    public function save(array $data);
    public function find($id);
    public function update($id, array $newData);
    public function delete($id);
}
