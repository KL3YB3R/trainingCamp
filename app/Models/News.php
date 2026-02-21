<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $table = 'news';

    protected $fillable = [
        'title',
        'description',
        'is_active',
    ];

    public static function saveNews($request){
        return self::create([
            'title' => $request->news_title,
            'description' => $request->text_news,
            'is_active' => true,
        ]);
    }

    public static function deleteImage($request)
    {
        return self::where('id', $request->newsId)->delete();
    }
}
