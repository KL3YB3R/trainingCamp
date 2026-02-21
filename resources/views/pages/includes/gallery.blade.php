<article class="gallery-container gallery"></article>

<aside id="image-card" class="gallery-item" style="display: none">
    <figure>
        <img class="gallery-img" id="image" src="" alt="Galería Quiripical">
    </figure>
    
    <div class="image-info">
        <p class="text-description" id="text-image"></p>
    </div>

    @auth 
        @if (Auth::user()->rol_id == 1)
            <button type="button" class="btn-delete-gallery" id="btn-delete">
                <i class="fa-solid fa-trash"></i> Eliminar Foto
            </button>
        @endif
    @endauth
</aside>