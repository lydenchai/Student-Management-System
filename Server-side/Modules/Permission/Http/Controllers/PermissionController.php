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
            'data' => $this->permissionRepository->getAllPermissions()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request): JsonResponse
    {
        $permissionDetails = $request->only([
            'student_id',
            'startAt',
            'endAt',
            'type',
            'description',
        ]);
        return response()->json(
            [
                'message' => 'Permission created',
                'data' => $this->permissionRepository->createPermission($permissionDetails)
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
        $permissionId = $request->route('id');

        return response()->json([
            'data' => $this->permissionRepository->getPermissionById($permissionId)
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
        $permissionId = $request->route('id');
        $permissionDetails = $request->only([
            'student_id',
            'startAt',
            'endAt',
            'type',
            'description',
        ]);
        return response()->json([
            'message' => "Permission updated",
            'data' => $this->permissionRepository->updatePermission($permissionId, $permissionDetails)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy(Request $request): JsonResponse
    {
        $permissionId = $request->route('id');
        $this->permissionRepository->deletePermission($permissionId);
        return response()->json([
            'message' => 'Permission deleted'
        ], Response::HTTP_NO_CONTENT);
    }
}
