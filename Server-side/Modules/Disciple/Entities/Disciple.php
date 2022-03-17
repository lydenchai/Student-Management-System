<?php

namespace Modules\Disciple\Entities;

use App\Models\Student;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Disciple extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'dateWn',
        'type',
        'description'
    ];
    
    protected $hidden = [
        'created_at',
        'updated_at'
    ];

    public function Student()
    {
        return $this->belongsTo(Student::class);
    }
}
