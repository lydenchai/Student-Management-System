<?php

namespace Score\Repositories;

use App\Models\Student;
use Modules\Score\Entities\Score;
use Score\Interface\ScoreRepositoryInterface;


class ScoreRepositoryImpl implements ScoreRepositoryInterface
{
    //To view all the data
    public function all()
    {
        return Score::with('student')->latest()->get();
    }

    //Store the data
    public function save(array $data)
    {
        return Score::create($data);
    }

    //Get an individual record
    public function find($id)
    {
        return Score::findOrFail($id);
    }

    //Update the data
    public function update($id, array $newData)
    {
        return Score::whereId($id)->update($newData);
    }

    //Delete the data
    public function delete($id)
    {
        Score::destroy($id);
    }
}
