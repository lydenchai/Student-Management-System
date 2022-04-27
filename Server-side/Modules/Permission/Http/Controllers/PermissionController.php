<?php

namespace Modules\Permission\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use Illuminate\Contracts\Support\Renderable;
use Permission\Interface\PermissionRepositoryInterface;

class PermissionController extends Controller
{
    private PermissionRepositoryInterface $permissionRepository;

    public function __construct(PermissionRepositoryInterface $permissionRepository)
    {
        $this->permissionRepository = $permissionRepository;
    }

    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index(): JsonResponse
    {
        return response()->json([
            'data' => $this->permissionRepository->all()
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
            'start_At' => 'required',
            'end_At' => 'required',
            'type' => 'required',
            'description' => 'required',
        ]);
        $data = $request->only([
            'student_id',
            'start_At',
            'end_At',
            'type',
            'description',
        ]);
        
        return response()->json(
            [
                'message' => 'Permission created',
                'data' => $this->permissionRepository->save($data)
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
            'data' => $this->permissionRepository->find($id)
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
            'start_At' => 'required',
            'end_At' => 'required',
            'type' => 'required',
            'description' => 'required',
        ]);
        $data = $request->only([
            'student_id',
            'start_At',
            'end_At',
            'type',
            'description',
        ]);
        return response()->json([
            'message' => "Permission updated",
            'data' => $this->permissionRepository->update($id, $data)
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
        $this->permissionRepository->delete($id);

        return response()->json(Response::HTTP_NO_CONTENT);
    }
}
