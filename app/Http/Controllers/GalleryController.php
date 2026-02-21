<?php

namespace App\Http\Controllers;

use App\Models\AuditTrails;
use App\Models\Gallery;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GalleryController extends Controller
{
    public function index()
    {
        return view('pages.admin.gallery.index');
    }

    public function store(Request $request)
    {
        try {
            if ($request->hasFile('image_path')) {
                $path = $request->file('image_path')->store('galleries', 'public');

                $saveGallery = Gallery::saveImage($request, $path);
                AuditTrails::logActivity(Auth::user()->id, 'Eliminar Imagen');

                return response()->json(['type' => 'success', 'message' => 'Imagen guardada correctamente'], 200);
            }
        } catch (\Exception $e) {
            // Error de conexión a la base de datos
            $logController = new LogController();
            $logController->saveLog($e->getMessage(), 500, 'GalleryController/store', $e);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo obtener las imagenes, intente nuevamente'], 500);
        }
        
    }

    public function getImages(Request $request)
    {
        try {
            $gallery = Gallery::select('id', 'image', 'description', 'is_active', 'created_at')->orderBy('id', 'desc');

            if($request->from == 'home') $gallery = $gallery->where('is_active', true)->limit(3);

            $gallery = $gallery->get();

            foreach ($gallery as $key => $value) {
                $limit = 255;
                // Cortamos el texto
                $value->firstPart = mb_substr($value->description, 0, $limit);
                $value->allText = mb_substr($value->description, $limit);
                $value->limit = $limit;
                
                $value->fecha_publicacion = !is_null($value->created_at) ? 
                    Carbon::parse($value->created_at)->format('d / m / Y') : '';
            }

            return response()->json(['type' => 'success', 'data' => $gallery], 200);

        }  catch (\Exception $e) {
            // Error de conexión a la base de datos
            $logController = new LogController();
            $logController->saveLog($e->getMessage(), 500, 'GalleryController/getImages', $e);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo obtener las imagenes, intente nuevamente'], 500);
        }
    }

    public function delete(Request $request)
    {
        try {
            DB::beginTransaction();
            Gallery::deleteImage($request);
            AuditTrails::logActivity(Auth::user()->id, 'Eliminar Imagen');
            DB::commit();
            return response()->json(['type' => 'success', 'message' => 'Imagen eliminada correctamente'], 200);
            
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'GalleryController/delete', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo eliminar la imagen, intente nuevamente'], 500);
        }
    }
}
