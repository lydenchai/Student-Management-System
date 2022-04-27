<?php

namespace Modules\Disciple\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use Illuminate\Contracts\Support\Renderable;
use Disciple\Interface\DiscipleRepositoryInterface;

class DiscipleController extends Controller
{
    private DiscipleRepositoryInterface $discipleRepository;

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
            'data' => $this->discipleRepository->all()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request): JsonResponse
    {   
        $request->validate([
            'student_id' => 'required',
            'date' => 'required',
            'type' => 'required',
            'description' => 'required'
        ]);
        $data = $request->only([
            'student_id',
            'date',
            'type',
            'description'
        ]);
        
        return response()->json(
            [
                'message' => 'Disciple created',
                'data' => $this->discipleRepository->save($data)
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
            'data' => $this->discipleRepository->find($id)
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
        $request->validate([
            'student_id' => 'required',
            'date' => 'required',
            'type' => 'required',
            'description' => 'required'
        ]);
        $data = $request->only([
            'student_id',
            'date',
            'type',
            'description'
        ]);

        return response()->json([
            'message' => "Disciple updated",
            'data' => $this->discipleRepository->update($id, $data)
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
        $this->discipleRepository->delete($id);

        return response()->json(Response::HTTP_NO_CONTENT);
    }
}
