<?php

namespace Modules\Score\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use Illuminate\Contracts\Support\Renderable;
use Score\Interface\ScoreRepositoryInterface;

class ScoreController extends Controller
{
    private ScoreRepositoryInterface $scoreRepository;

    public function __construct(ScoreRepositoryInterface $scoreRepository)
    {
        $this->scoreRepository = $scoreRepository;
    }

    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index(): JsonResponse
    {
        return response()->json([
            'data' => $this->scoreRepository->all()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request): JsonResponse
    {
        $data = $request->only([
            'student_id',
            'htmlcss',
            'javascript',
            'python',
            'php',
            'laravel',
            'java',
        ]);
        
        return response()->json(
            [
                'message' => 'Score created',
                'data' => $this->scoreRepository->save($data)
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
        $id = $request->route('id');

        return response()->json([
            'data' => $this->scoreRepository->find($id)
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
        $id = $request->route('id');
        $data = $request->only([
            'student_id',
            'htmlcss',
            'javascript',
            'python',
            'php',
            'laravel',
            'java',
        ]);
        
        return response()->json([
            'message' => "Score updated",
            'data' => $this->scoreRepository->update($id, $data)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy(Request $request): JsonResponse
    {
        $id = $request->route('id');
        $this->scoreRepository->delete($id);
        return response()->json(Response::HTTP_NO_CONTENT);
    }
}
