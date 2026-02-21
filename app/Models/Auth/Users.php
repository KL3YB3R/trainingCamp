<?php

namespace App\Models\Auth;

use App\Models\Rols;
use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    protected $table = 'users';

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $fillable = [
        'username',
        'name',
        'last_name',
        'document',
        'position',
        'email',
        'password',
        'rol_id',
    ];

    public function setPasswordAttribute($value){
        $this->attributes['password'] = bcrypt($value);
    }

    public function rol() {
        return $this->belongsTo(Rols::class);
    }

    public static function getUsers($request){
        $users = self::with('rol')->orderBy('id', 'desc');

        if($request->fullname_search <> '') 
            $users = $users->where('name', 'like', '%'.$request->fullname_search.'%')
                ->orWhere('last_name', 'like', '%'.$request->fullname_search.'%');

        if($request->username_search <> '') 
            $users = $users->where('username', 'like', '%'.$request->username_search.'%');

        if($request->role_search <> '') 
            $users = $users->where('rol_id', $request->role_search);

        return $users->orderBy('created_at', 'desc')->get();
    }

}
