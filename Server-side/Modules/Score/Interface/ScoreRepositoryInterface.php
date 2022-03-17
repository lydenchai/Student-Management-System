<?php

namespace Score\Interface;

interface ScoreRepositoryInterface
{
    public function getAllScores();
    public function createScore(array $scoreDetails);
    public function getScoreById($scoreId);
    public function updateScore($scoreId, array $newDetails);
    public function deleteScore($scoreId);
}
