<?php

namespace Modules\Disciple\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use Modules\Disciple\Entitites\Disciple;
use Illuminate\Contracts\Support\Renderable;
use Disciple\Interface\DiscipleRepositoryInterface;

class DiscipleController extends Controller
{
    private DiscipleRepositoryInterface $DiscipleRepository;

    public function __construct(DiscipleRepositoryInterface $discipleRepository)
    {
        $this->discipleRepository = $discipleRepository;
    }

    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index(): JsonResponse
    {
        return response()->json([
            'data' => $this->discipleRepository->getAllDisciples()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request): JsonResponse
    {
        $discipleDetails = $request->only([
            'student_id',
            'dateWn',
            'type',
            'description'
        ]);
        return response()->json(
            [
                'message' => 'Disciple created',
                'data' => $this->discipleRepository->createDisciple($discipleDetails)
            ],
            Response::HTTP_CREATED
        );
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show(Request $request): JsonResponse
    {
        $discipleId = $request->route('id');

        return response()->json([
            'data' => $this->discipleRepository->getDiscipleById($discipleId)
        ]);
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request): JsonResponse
    {
        $discipleId = $request->route('id');
        $discipleDetails = $request->only([
            'student_id',
            'dateWn',
            'type',
            'description'
        ]);
        return response()->json([
            'message' => "Disciple updated",
            'data' => $this->discipleRepository->updateDisciple($discipleId, $discipleDetails)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy(Request $request): JsonResponse
    {
        $discipleId = $request->route('id');
        $this->discipleRepository->deleteDisciple($discipleId);
        return response()->json([
            'message' => 'Disciple deleted'
        ], Response::HTTP_NO_CONTENT);
    }
}
