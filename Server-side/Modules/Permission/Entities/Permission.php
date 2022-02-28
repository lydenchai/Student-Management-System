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
        'startAt', 
        'endAt', 
        'type', 
        'description'
    ];

    protected $hidden =[
        'created_at',
        'updated_at'
    ];

    protected static function newFactory()
    {
        return \Modules\Permission\Database\factories\PermissionFactory::new();
    }

    public function student(){
        return $this->belongsTo(Student::class);
    }
}
