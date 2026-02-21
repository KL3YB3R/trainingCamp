<div id="newUser" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <span>Nuevo Usuario</span>
            <span class="btnCerrar" data-modal-close="newUser" style="cursor: pointer; font-size: 24px;">&times;</span>
        </div>
        <form action="" id="formNewUser" method="POST" class="modal-body">
            @csrf

            <article class="grid grid-flow-col gap-4">
                <aside>
                    <label for="name">Nombres</label>
                    <input id="name" type="text" name="name" class="" required>
                </aside>
                <aside>
                    <label for="last_name">Apellidos</label>
                    <input id="last_name" type="text" name="last_name" class="" required>
                </aside>
            </article>
            <article class="mt-2">
                <label for="username">Usuario</label>
                <input id="username" type="text" name="username" required>
            </article>
            <article class="mt-2">
                <label for="email">Email</label>
                <input id="email" type="text" name="email" required>
            </article>
            <article class="mt-2">
                <label for="password">Contraseña</label>
                <input id="password" type="password" name="password" required>
            </article>
            <article class="mt-2">
                <label for="password_confirmation">Confirmar contraseña</label>
                <input id="password_confirmation" type="password" name="password_confirmation" required>
            </article>

            <button type="submit" style="background-color: #2b7a78; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; width: 100%; margin-top: 2rem;">
                Guardar
            </button>
        </form>
    </div>
</div>