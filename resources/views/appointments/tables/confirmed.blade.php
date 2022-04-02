@if (count($confirmedAppointments) > 0)
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
                @foreach ($confirmedAppointments as $appointment)
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
                            <a href="{{ url('appointments/' . $appointment->id . '?tab='.$tab.'&confirmed='.$confirmed.'&pending='.$pending.'&old='.$old) }}"
                                class="btn btn-sm btn-info d-inline-block" title="Consultar cita" data-toggle="tooltip">
                                ver
                            </a>
                            @endif
                            <a href="{{ url('appointments/' . $appointment->id . '/cancel?confirmed='.$confirmed.'&pending='.$pending.'&old='.$old) }}"
                                class="btn btn-sm btn-danger d-inline-block" title="Cancelar cita" data-toggle="tooltip">
                                Cancelar
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    @if ($confirmedAppointments->hasPages())
        <div class="card-body text-center">
            <div class="py-3 d-flex justify-content-center">

                <ul class="pagination">

                    <li class="page-item<?php if ($confirmedAppointments->onFirstPage()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $pendingAppointments->url(1).'&pending='.$pending.'&old='.$old.'&tab=confirmed' }}">
                            <i class="fas fa-fast-backward"></i>
                        </a>
                    <li class="page-item<?php if ($confirmedAppointments->onFirstPage()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $confirmedAppointments->previousPageUrl().'&pending='.$pending.'&old='.$old.'&tab=confirmed' }}">
                            <i class="fas fa-backward"></i>
                        </a>
                    </li>
                    {{-- 'first_page', 'current_page', 'last_page' --}}
                    @for ($page = $pages_confirmed['first_page']; $page <= $pages_confirmed['last_page']; $page++)
                        @if ($page == $pages_confirmed['current_page'])
                            <li class="page-item disabled">
                                <a class="px-3 py-2 page-link bg-light fw-bold" href="#">
                                    {{ $page }}</a>
                            </li>
                        @else
                            <li class="page-item">
                                <a class="px-3 py-2 page-link" href="{{ $confirmedAppointments->url($page).'&pending='.$pending.'&old='.$old.'&tab=confirmed' }}">
                                    {{ $page }}</a>
                            </li>
                        @endif
                    @endfor

                    <li class="page-item<?php if (!$confirmedAppointments->hasMorePages()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $confirmedAppointments->nextPageUrl().'&pending='.$pending.'&old='.$old.'&tab=confirmed' }}">
                            <i class="fas fa-forward"></i>
                        </a>
                    </li>
                    <li class="page-item<?php if (!$confirmedAppointments->hasMorePages()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $confirmedAppointments->url($confirmedAppointments->lastPage()).'&pending='.$pending.'&old='.$old.'&tab=confirmed' }}">
                            <i class="fas fa-fast-forward"></i>
                        </a>
                    </li>

                </ul>

            </div>
        </div>
    @endif

@endif
