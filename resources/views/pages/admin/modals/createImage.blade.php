<div id="newImage" class="modal-overlay">
    <div class="modal-content width-xl">
        <div class="modal-header">
            <span>Nueva Noticia</span>
            <span class="btnCerrar" data-modal-close="newImage" style="cursor: pointer; font-size: 24px;">&times;</span>
        </div>
        <form action="" id="formNewImage" method="POST" class="modal-body" enctype="multipart/form-data">
            @csrf

            <article class="mt-2">
                <label for="image_upload" style="display: block; color: #2b7a78; font-weight: bold; margin-bottom: 8px;">
                    <i class="fa-solid fa-image"></i> Seleccionar Imagen
                </label>
                <input id="image_upload" 
                    type="file" 
                    name="image_path" 
                    accept="image/*" 
                    required 
                    class="custom-file-input">
                <small style="color: #718096; display: block; mt-1">Formatos permitidos: JPG, PNG. Máx 2MB.</small>
            </article>

            <article class="mt-4">
                <label for="news_title">Descripción de la Imagen (Sea breve, no exceda los 255 caracteres)</label>
                <textarea name="text_image" id="text_image" rows="4" maxlength="255"></textarea>
            </article>

            <button type="submit" style="background-color: #2b7a78; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; width: 100%; margin-top: 2rem;">
                Guardar
            </button>
        </form>
    </div>
</div>