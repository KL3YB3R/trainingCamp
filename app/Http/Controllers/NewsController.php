<?php

namespace App\Http\Controllers;

use App\Http\Requests\NewsRequest;
use App\Models\AuditTrails;
use App\Models\News;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class NewsController extends Controller
{
    public function index()
    {
        return view('pages.admin.news.index');
    }

    public function store(NewsRequest $request){
        try {
            DB::beginTransaction();

            $saveNews = News::saveNews($request);
            AuditTrails::logActivity(Auth::user()->id, 'Eliminar Imagen');

            DB::commit();
            return response()->json(['type' => 'success', 'message' => 'Noticia guardada correctamente'], 200);
            
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'register/saveUser', $th);
            return response()->json(['type' => 'warning', 'message' => 'Error al registrar el usuario'], 500);
        }
    }

    public function getNews(Request $request){
        $news = News::select('id', 'title', 'description', 'created_at')->orderBy('id', 'desc');

        if($request->from == 'home') $news = $news->where('is_active', true)->limit(3);

        $news = $news->get();

        foreach ($news as $key => $value) {
            $limit = 255;
            // Cortamos el texto
            $value->firstPart = mb_substr($value->description, 0, $limit);
            $value->allText = mb_substr($value->description, $limit);
            $value->limit = $limit;
            
            $value->fecha_publicacion = !is_null($value->created_at) ? 
                Carbon::parse($value->created_at)->format('d / m / Y') : '';
        }

        return response()->json(['news' => $news], 200);
    }

    public function delete(Request $request)
    {
        try {
            DB::beginTransaction();
            News::deleteImage($request);
            AuditTrails::logActivity(Auth::user()->id, 'Eliminar Noticia');
            DB::commit();
            return response()->json(['type' => 'success', 'message' => 'Noticia eliminada correctamente'], 200);
            
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'GalleryController/delete', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo eliminar la Noticia, intente nuevamente'], 500);
        }
    }
}
