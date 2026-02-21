<article class="flex flex-col justify-start align-baseline">
    <button data-modal-id="newReserve" type="button" class="btnModal p-3 button button-primary mt-10 mb-2" style="color: white; border: none; cursor: pointer;" onclick="cleanInput(this)">
        <i class="fa-solid fa-plus"></i> Nueva Reserva
    </button>
    <table id="table_reservations" class="custom-table">
        <thead>
            <th class="">Fecha de Ingreso</th>
            <th>Fecha de Salida</th>
            <th>Cantidad de Huespedes</th>
            <th>Nombre de Grupo</th>
            <th>Monto (Bs.)</th>
            <th>Estatus</th>
            <th>Acciones</th>
        </thead>
        <tbody id="body_reservations">
            @foreach ($reservations as $reservation)
                <tr>
                    <td class="text-center align-middle" style="border-right: 1px solid #c1c1c1">
                        {{ 
                            !is_null($reservation->start_date) ? 
                            Carbon\Carbon::parse($reservation->start_date)->format('d / m / Y') : '' 
                        }}
                    </td>

                    <td class="text-center align-middle" style="border-right: 1px solid #c1c1c1">
                        {{ 
                            !is_null($reservation->end_date) ? 
                            Carbon\Carbon::parse($reservation->end_date)->format('d / m / Y') : '' 
                        }}
                    </td>

                    <td class="text-center align-middle" style="border-right: 1px solid #c1c1c1">
                        {{ $reservation->n_guest }}
                    </td>

                    <td class="text-center align-middle" style="border-right: 1px solid #c1c1c1">
                        {{ $reservation->group_name }}
                    </td>

                    <td class="text-center align-middle" style="border-right: 1px solid #c1c1c1">
                        {{ $reservation->total_amount }}
                    </td>

                    <td class="text-center align-middle" style="border-right: 1px solid #c1c1c1">
                        {{ $reservation->status->name }}
                    </td>

                    <td class="text-center align-middle">
                        <button type="button" class="button-table button-primary mb-1" title="Pagar Reserva" onclick="toggleModal('flex', 'payReservation', {{$reservation->id}})">
                            <i class="fa-solid fa-hand-holding-dollar" style="pointer-events: none;"></i>
                        </button>

                        @if ($reservation->status_id == 1)
                            <button type="button" class="button-table button-blue ms-1 mb-1" title="Editar Reservación"  onclick="getInformationReservation({{$reservation->id}})">
                                    <i class="fa-solid fa-edit"></i>
                            </button>
                            <button type="button" class="button-table button-cancel ms-1 mb-1" title="Cancelar Reservación"  onclick="deleteReservation({{$reservation->id}})">
                                    <i class="fa-solid fa-ban"></i>
                            </button>
                        @endif

                        <button type="button" class="button-table button-muted ms-1 mb-1" title="Ver Información" onclick="showInformationReservation({{$reservation->id}})">
                            <i class="fa-solid fa-list" style="pointer-events: none;"></i>
                        </button>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</article>