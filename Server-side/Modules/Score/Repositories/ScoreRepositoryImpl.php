<?php

namespace Score\Repositories;

use App\Models\Student;
use Modules\Score\Entities\Score;
use Score\Interface\ScoreRepositoryInterface;


class ScoreRepositoryImpl implements ScoreRepositoryInterface
{
    //To view all the data
    public function getAllScores()
    {
        return Score::with('student')->latest()->get();
    }

    //Store the data
    public function createScore(array $scoreDetails)
    {
        return Score::create($scoreDetails);
    }

    //Get an individual record
    public function getScoreById($scoreId)
    {
        return Score::findOrFail($scoreId);
    }

    //Update the data
    public function updateScore($scoreId, array $newDetails)
    {
        return Score::whereId($scoreId)->update($newDetails);
    }

    //Delete the data
    public function deleteScore($scoreId)
    {
        Score::destroy($scoreId);
    }
}
