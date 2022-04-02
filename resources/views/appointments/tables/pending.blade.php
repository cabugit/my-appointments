@if (count($pendingAppointments) > 0)
    <div class="table-responsive">
        <table class="table align-items-center table-flush">
            <thead class="thead-light">
                <tr>
                    <th scope="col">Descripción</th>
                    <th scope="col">Especialidad</th>
                    @if ($role == 'admin')
                        <th scope="col">Médico</th>
                        <th scope="col">Paciente</th>
                    @elseif($role == 'doctor')
                        <th scope="col">Paciente</th>
                    @elseif($role == 'patient')
                        <th scope="col">Médico</th>
                    @endif
                    <th scope="col">Fecha</th>
                    <th scope="col">Hora</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Opciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($pendingAppointments as $appointment)
                    <tr>
                        <td>
                            {{ $appointment->description }}
                        </td>
                        <td>
                            {{ $appointment->specialty->name }}
                        </td>
                        @if ($role == 'admin')
                            <td>
                                {{ $appointment->doctor->name }}
                            </td>
                            <td>
                                {{ $appointment->patient->name }}
                            </td>
                        @elseif($role == 'doctor')
                            <td>
                                {{ $appointment->patient->name }}
                            </td>
                        @elseif($role == 'patient')
                            <td>
                                {{ $appointment->doctor->name }}
                            </td>
                        @endif
                        <td>
                            {{ $appointment->scheduled_date }}
                        </td>
                        <td>
                            {{ $appointment->scheduled_time_12 }}
                        </td>
                        <td>
                            {{ $appointment->type }}
                        </td>
                        <td>
                            @if ($role == 'admin')
                            <a href="{{ url('appointments/' . $appointment->id . '?tab=pending&confirmed='.$confirmed.'&pending='.$pending.'&old='.$old) }}"
                                class="btn btn-sm btn-info d-inline-block" title="Consultar cita" data-toggle="tooltip">
                                ver
                            </a>
                            @endif
                            @if ($role == 'doctor' || $role == 'admin')
                                <form action="{{ url('appointments/' . $appointment->id . '/confirm') }}" method="POST"
                                    class="d-inline-block">
                                    @csrf
                                    <input type="hidden" name="tab" value="pending">
                                    <input type="hidden" name="confirmed" value="{{$confirmed}}">
                                    <input type="hidden" name="pending" value="{{$pending}}">
                                    <input type="hidden" name="old" value="{{$old}}">
                                    <button class="btn btn-sm btn-success" type="submit" data-toggle="tooltip"
                                        title="Confirmar cita">
                                        <i class="ni ni-check-bold"></i>
                                    </button>
                                </form>
                            @endif
                            @if ($role == 'patient')
                                <form action="{{ url('appointments/' . $appointment->id . '/cancel') }}"
                                    method="POST" class="d-inline-block">
                                    @csrf
                                    <input type="hidden" name="tab" value="pending">
                                    <input type="hidden" name="confirmed" value="{{$confirmed}}">
                                    <input type="hidden" name="pending" value="{{$pending}}">
                                    <input type="hidden" name="old" value="{{$old}}">
                                    <button class="btn btn-sm btn-danger" type="submit" data-toggle="tooltip"
                                        title="Cancelar cita">
                                        Cancelar
                                    </button>
                                </form>
                            @else
                                <a href="{{ url('appointments/' . $appointment->id . '/cancel?tab=pending&confirmed='.$confirmed.'&pending='.$pending.'&old='.$old) }}"
                                    class="btn btn-sm btn-danger d-inline-block" title="Cancelar cita" data-toggle="tooltip">
                                    Cancelar
                                </a>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    @if ($pendingAppointments->hasPages())
        <div class="card-body text-center">
            <div class="py-3 d-flex justify-content-center">

                <ul class="pagination">

                    <li class="page-item<?php if ($pendingAppointments->onFirstPage()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $pendingAppointments->url(1).'&confirmed='.$confirmed.'&old='.$old.'&tab=pending' }}">
                            <i class="fas fa-fast-backward"></i>
                        </a>
                    <li class="page-item<?php if ($pendingAppointments->onFirstPage()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $pendingAppointments->previousPageUrl().'&confirmed='.$confirmed.'&old='.$old.'&tab=pending' }}">
                            <i class="fas fa-backward"></i>
                        </a>
                    </li>
                    {{-- 'first_page', 'current_page', 'last_page' --}}
                    @for ($page = $pages_pending['first_page']; $page <= $pages_pending['last_page']; $page++)
                        @if ($page == $pages_pending['current_page'])
                            <li class="page-item disabled">
                                <a class="px-3 py-2 page-link bg-light fw-bold" href="#">
                                    {{ $page }}</a>
                            </li>
                        @else
                            <li class="page-item">
                                <a class="px-3 py-2 page-link" href="{{ $pendingAppointments->url($page).'&confirmed='.$confirmed.'&old='.$old.'&tab=pending' }}">
                                    {{ $page }}</a>
                            </li>
                        @endif
                    @endfor

                    <li class="page-item<?php if (!$pendingAppointments->hasMorePages()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $pendingAppointments->nextPageUrl().'&confirmed='.$confirmed.'&old='.$old.'&tab=pending' }}">
                            <i class="fas fa-forward"></i>
                        </a>
                    </li>
                    <li class="page-item<?php if (!$pendingAppointments->hasMorePages()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $pendingAppointments->url($pendingAppointments->lastPage()).'&confirmed='.$confirmed.'&old='.$old.'&tab=pending' }}">
                            <i class="fas fa-fast-forward"></i>
                        </a>
                    </li>

                </ul>

            </div>
        </div>
    @endif

@endif
