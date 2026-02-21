<div id="newNews" class="modal-overlay">
    <div class="modal-content width-xl">
        <div class="modal-header">
            <span>Nueva Noticia</span>
            <span class="btnCerrar" data-modal-close="newNews" style="cursor: pointer; font-size: 24px;">&times;</span>
        </div>
        <form action="" id="formNewNews" method="POST" class="modal-body">
            @csrf

            <article class="mt-2">
                <label for="news_title">Titulo de la Noticia</label>
                <input id="news_title" type="text" name="news_title" required>
            </article>

            <article class="mt-4">
                <label for="news_title">Descripción de la Noticia</label>
                <textarea name="text_news" id="text_news" rows="4"></textarea>
            </article>

            <button type="submit" style="background-color: #2b7a78; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; width: 100%; margin-top: 2rem;">
                Guardar
            </button>
        </form>
    </div>
</div>