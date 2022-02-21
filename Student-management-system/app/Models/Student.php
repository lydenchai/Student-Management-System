<?php

namespace App\Models;

use App\Models\User;
use Modules\Score\Entities\Score;
use Illuminate\Database\Eloquent\Model;
use Modules\Disciple\Entities\Disciple;
use Modules\Permission\Entities\Permission;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Student extends Model
{
    use HasFactory;

    protected $fillable = [
        'first_name',
        'last_name',
        'class',
        'phone',
        'gender',
        'image'
    ];

    protected $hidden =[
        'created_at',
        'updated_at'
    ];

    public function score(){
        return $this->hasMany(Score::class);
    }
    
    public function permission(){
        return $this->hasMany(Permission::class);
    }
    
    public function disciple(){
        return $this->hasMany(Disciple::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }
}