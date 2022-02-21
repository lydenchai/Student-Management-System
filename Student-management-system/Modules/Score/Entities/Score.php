<?php

namespace Modules\Score\Entities;

use App\Models\Student;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Score extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'htmlcss',
        'javascript',
        'python',
        'php',
        'laravel',
        'java',
    ];

    protected $hidden = [
        'creatd_at',
        'updated_at'
    ];
    
    protected static function newFactory()
    {
        return \Modules\Score\Database\factories\ScoreFactory::new();
    }

    public function student(){
        return $this->belongsTo(Student::class);
    }
}
