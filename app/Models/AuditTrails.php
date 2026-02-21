<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class AuditTrails extends Model
{
    protected $table = 'audit_trails';

    protected $fillable = [
        'user_id',
        'action'
    ];

    public static function logActivity($userId, $action)
    {
        return self::create([
            'user_id' => $userId,
            'action' => $action
        ]);
    }
}
