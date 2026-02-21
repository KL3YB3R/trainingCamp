function toggleTransition(button) {
    const wrapper = button.closest('.news-wrapper');
    wrapper.classList.toggle('show-more');

    if (wrapper.classList.contains('show-more')) {
        button.textContent = "Ver menos";
    } else {
        button.textContent = "Ver más";
    }
}

async function saveNews(form) {
    const formData = new FormData(form);
    const DATA = {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        }
    };

    const saveRequest = await fetch('news/store', DATA);
    const {type, message} = await saveRequest.json();
    
    swalMessage(message, type);

    if(type == 'success') {
        setTimeout(() => {
            W.location.reload();
        }, 2500);
    }
}

async function getNews() {
    let from = 'index';
    const parentNews = D.querySelector('#parent-news');
    const formData = new FormData();
    if(parentNews.classList.contains('parent-news-home')) {
        from = 'home';
        formData.set('from', 'home');
    }

    const DATA = {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        },
        body: formData
    }

    const response = await fetch('news/getNews', DATA);
    const data = await response.json();

    showNews(data, from);
}

function showNews({news}, from) {
    const parentTemplate = D.querySelector('.news-container');
    parentTemplate.innerHTML = '';

    if (!news || news.length === 0) {
        parentTemplate.classList.remove('news');
        parentTemplate.classList.add('empty_news');
        parentTemplate.innerHTML = `
            <div style="text-align: center; padding: 20px; color: #718096;">
                <i class="fa-solid fa-inbox" style="display: block; font-size: 1.5rem; margin-bottom: 8px;"></i>
                No se encontraron noticias para mostrar
            </div>
        `;
        return; // Finaliza la ejecución aquí
    }

    parentTemplate.classList.remove('empty_news');
    parentTemplate.classList.add('news');

    news.forEach(item => {
        const clone = D.querySelector('#parent-news #news-card').cloneNode(true);
        clone.style.display = '';

        clone.querySelector('#date-news').textContent = item.fecha_publicacion;
        clone.querySelector('#title-news').textContent = item.title;
        clone.querySelector('#text-content').innerHTML = `
            ${item.firstPart}
            ${
                item.allText.length > item.limit
                ? `<span class="dots">...</span>
                <span class="more-text">${item.allText}</span>`
                : ''
            }
        `;

        if(item.allText.length > item.limit) {
            clone.querySelector('.btn-read-more').style.display = '';
        }

        if(clone.querySelector('#btn-delete')) {
            if(from == 'home') clone.querySelector('#btn-delete').style.display = 'none';
            else clone.querySelector('#btn-delete').dataset.id = item.id;
        }

        /* @if(mb_strlen($textoCompleto) > $limit)
            <button onclick="toggleTransition(this)" class="btn-read-more">
                Ver más
            </button>
        @endif */

        parentTemplate.appendChild(clone);
    });
}

async function deleteNews(button) {
    let isSure = await swalMessageWithQuestion('Se eliminará la Noticia', 'warning');

    if(isSure.isConfirmed) {
        const newsId = button.dataset.id;

        const formData = new FormData();
        formData.set('newsId', newsId);

        const DATA = {
            method: 'POST',
            body: formData,
            headers: {
                'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
                'Accept': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
        };

        const saveRequest = await fetch('news/delete', DATA);
        const response = await saveRequest.json();

        swalMessage(response.message, response.type);
        
        if(response.type == 'success') {
            setTimeout(() => {
                W.location.reload();
            }, 2500);
        }
    }
    
}

D.addEventListener('DOMContentLoaded', (e) => {
    getNews();
});

D.addEventListener('click', (e) => {
    if (e.target.matches('#btn-delete')) {
        e.preventDefault();
        deleteNews(e.target);
    }
});

D.addEventListener('submit', (e) => {
    if (e.target.matches('#formNewNews')) {
        e.preventDefault();
        saveNews(e.target);
    }
});