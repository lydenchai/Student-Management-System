<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'username' => $this->username,
            'email' => $this->email,
            'password' => $this->password,
            'role' => $this->role,
            'image' => $this->image,
            'created_at' => $this->created_at->format('D, j M Y  h:i A'),
            'updated_at' => $this->updated_at->format('D, j M Y  h:i A'),
            'student' => $this->student,
        ];
    }
}
