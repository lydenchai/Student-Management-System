<?php

namespace Modules\Permission\Entities;

use App\Models\Student;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Permission extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'start_At',
        'end_At',
        'type',
        'description'
    ];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
