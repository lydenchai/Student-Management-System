<?php

namespace Disciple\Repositories;

use Modules\Disciple\Entities\Disciple;
use Disciple\Interface\DiscipleRepositoryInterface;

class DiscipleRepositoryImpl implements DiscipleRepositoryInterface
{
    //To view all the data
    public function getAllDisciples()
    {
        return Disciple::with('student')->latest()->get();
    }

    //Store the data
    public function createDisciple(array $discipleDetails)
    {
        return Disciple::create($discipleDetails);
    }

    //Get an individual record
    public function getDiscipleById($discipleId)
    {
        return Disciple::findOrFail($discipleId);
    }

    //Update the data
    public function updateDisciple($discipleId, array $newDetails)
    {
        return Disciple::whereId($discipleId)->update($newDetails);
    }

    //Delete the data
    public function deleteDisciple($discipleId)
    {
        Disciple::destroy($discipleId);
    }
}
