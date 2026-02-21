<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Gallery extends Model
{
    protected $table = 'gallery';

    protected $fillable = [
        'image',
        'description',
        'is_active'
    ];

    public static function saveImage($request, $path)
    {
        return self::create([
            'image' => $path,
            'description' => $request->text_image,
            'is_active' => true,
        ]);
    }

    public static function deleteImage($request)
    {
        return self::where('id', $request->imageId)->delete();
    }
}
