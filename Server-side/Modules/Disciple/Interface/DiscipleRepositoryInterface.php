<?php

namespace Disciple\Interface;

interface DiscipleRepositoryInterface
{
    public function getAllDisciples();
    public function createDisciple(array $discipleDetails);
    public function getDiscipleById($discipleId);
    public function updateDisciple($discipleId, array $newDetails);
    public function deleteDisciple($discipleId);
}
