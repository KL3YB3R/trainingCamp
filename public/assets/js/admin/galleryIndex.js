function toggleTransition(button) {
    const wrapper = button.closest('.news-wrapper');
    wrapper.classList.toggle('show-more');

    if (wrapper.classList.contains('show-more')) {
        button.textContent = "Ver menos";
    } else {
        button.textContent = "Ver más";
    }
}

async function saveImage(form) {
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

    const saveRequest = await fetch('gallery/store', DATA);
    const {type, message} = await saveRequest.json();
    
    swalMessage(message, type);

    if(type == 'success') {
        setTimeout(() => {
            W.location.reload();
        }, 2500);
    }
}

async function getImages() {
    let from = "index";
    const formData = new FormData();
    const parentNews = D.querySelector('#parent-gallery');
    if(parentNews.classList.contains('parent-gallery-home')) {
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

    const response = await fetch('gallery/getImages', DATA);
    const {data, type} = await response.json();

    if(type == 'success') showGallery(data, from);
}

function showGallery(image, from) {
    
    const parentTemplate = D.querySelector('.gallery-container');
    parentTemplate.innerHTML = '';

    if (!image || image.length === 0) {
        parentTemplate.classList.remove('gallery');
        parentTemplate.classList.add('empty_gallery');
        parentTemplate.innerHTML = `
            <div style="text-align: center; padding: 20px; color: #718096;">
                <i class="fa-solid fa-inbox" style="display: block; font-size: 1.5rem; margin-bottom: 8px;"></i>
                No se encontraron noticias para mostrar
            </div>
        `;
        return; // Finaliza la ejecución aquí
    }

    parentTemplate.classList.remove('empty_gallery');
    parentTemplate.classList.add('gallery');

    image.forEach(item => {
        console.log(item);
        
        const clone = D.querySelector('#parent-gallery #image-card').cloneNode(true);
        clone.style.display = '';

        clone.querySelector('#image').src = `${window.storagePath}/${item.image}`;
        clone.querySelector('#text-image').textContent = item.description;

        if(clone.querySelector('#btn-delete')) {
            if(from == 'home') clone.querySelector('#btn-delete').style.display = 'none';
            else clone.querySelector('#btn-delete').dataset.id = item.id;
        }
        
        parentTemplate.appendChild(clone);
    });
}

async function deleteImage(button) {
    let isSure = await swalMessageWithQuestion('Se eliminará la imagen', 'warning');

    if(isSure.isConfirmed) {
        const imageId = button.dataset.id;

        const formData = new FormData();
        formData.set('imageId', imageId);

        const DATA = {
            method: 'POST',
            body: formData,
            headers: {
                'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
                'Accept': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
        };

        const saveRequest = await fetch('gallery/delete', DATA);
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
    getImages();
});

D.addEventListener('click', (e) => {
    if (e.target.matches('#btn-delete')) {
        e.preventDefault();
        deleteImage(e.target);
    }
});

D.addEventListener('submit', (e) => {
    if (e.target.matches('#formNewImage')) {
        e.preventDefault();
        saveImage(e.target);
    }
});