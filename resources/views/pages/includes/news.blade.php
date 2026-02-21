<article class="news-container news">
            
</article>

<aside id="news-card" style="display: none">
    <span class="date-news" id="date-news"></span>
    {{-- <div style="display: flex; justify-content:space-between;">
        <button><i class="fa-solid fa-xmark" style="pointer-events: none;"></i></button>
    </div> --}}
    <h3 id="title-news"></h3>
    <div class="news-wrapper">
        <p class="text-content" id="text-content"></p>
        
        {{-- Solo mostramos el botón si el texto realmente supera los 255 caracteres --}}
        <button onclick="toggleTransition(this)" class="btn-read-more" style="display: none">
            Ver más
        </button>
    </div>

    @auth 
        @if (Auth::user()->rol_id == 1)
            <button type="button" id="btn-delete"><i class="fa-solid fa-trash" style="pointer-events: none"></i></button>
        @endif
    @endauth
</aside>