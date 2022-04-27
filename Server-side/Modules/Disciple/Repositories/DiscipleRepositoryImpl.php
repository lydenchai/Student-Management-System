<?php

namespace Disciple\Repositories;

use Modules\Disciple\Entities\Disciple;
use Disciple\Interface\DiscipleRepositoryInterface;

class DiscipleRepositoryImpl implements DiscipleRepositoryInterface
{
    //To view all the data
    public function all()
    {
        return Disciple::with('student')->latest()->get();
    }

    //Store the data
    public function save(array $data)
    {
        return Disciple::create($data);
    }

    //Get an individual record
    public function find($id)
    {
        return Disciple::findOrFail($id);
    }

    //Update the data
    public function update($id, array $newData)
    {
        return Disciple::whereId($id)->update($newData);
    }

    //Delete the data
    public function delete($id)
    {
        Disciple::destroy($id);
    }
}
