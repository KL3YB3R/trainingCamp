<div id="users-container" style="display: none;">
    <div class="section-heading" style="margin-bottom:12px;">
        <h2>Usuarios Registrados</h2>
        <span class="decor" aria-hidden="true"></span>
    </div>

    <form id="form_search_users" class="critetios-container">
        <h2>Criterios de Búsqueda</h2>
        <hr>

        <div class="inputs-container">
            <aside class="" style="width: 100%">
                <label for="fullname_search" style="margin-top: 0 !important">Nombre y/o Apellido</label>
                <input id="fullname_search" type="text" name="fullname_search" 
                    class="form-control" placeholder="Ingrese el nombre del Usuario">
            </aside>
            <aside class="" style="width: 100%">
                <label for="username_search" style="margin-top: 0 !important">Usuario</label>
                <input id="username_search" type="text" name="username_search" 
                    class="form-control" placeholder="Ingrese el Usuario">
            </aside>
            <aside class="" style="width: 100%">
                <label for="role_search" style="margin-top: 0 !important">Rol</label>
                <select name="role_search" id="role_search" class="custom-select" style="margin-top: 5px">
                    <option value="" selected>-- SELECCIONE --</option>
                    @foreach ($roles as $rol)
                        <option value="{{$rol->id}}">{{$rol->name}}</option>                        
                    @endforeach
                </select>
            </aside>
        </div>

        <button id="search_users" type="submit" class="p-3 button button-primary mt-10 mb-2" style="background-color: #2b7a78; color: white; border: none; cursor: pointer;" data-action="search">
            <i class="fa-solid fa-magnifying-glass"></i> Buscar
        </button>
        <button id="search_users" type="submit" class="p-3 button button-secondary mt-10 mb-2" style="color: white; border: none; cursor: pointer;" data-action="reset">
            <i class="fa-solid fa-users"></i> Ver todos
        </button>
    </form>

    <button data-modal-id="newUser" type="button" class="btnModal p-3 button button-primary mt-10 mb-2" style="background-color: #2b7a78; color: white; border: none; cursor: pointer;">
        <i class="fa-solid fa-plus"></i> Nuevo Usuario
    </button>

    <div class="table-container">
        <table id="table_users" class="custom-table" >
            <thead>
                <th class="">Nombre y Apellido</th>
                <th>Usuario</th>
                <th>Correo</th>
                <th>Rol</th>
                <th>Acciones</th>
            </thead>
            <tbody id="body_users">
                <tr class="template-row" style="display: none;">
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="fullname"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="username"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="email"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="rol"></td>
                    <td class="text-center actions" data-field="rowId">
                        <button type="button" class="button-table button-cancel" onclick="deleteUser(this)">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    
</div>