@if (count($oldAppointments) > 0)
    <div class="table-responsive">
        <table class="table align-items-center table-flush">
            <thead class="thead-light">
                <tr>
                    <th scope="col">Especialidad</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Hora</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Opciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($oldAppointments as $appointment)
                    <tr>
                        <td>
                            {{ $appointment->specialty->name }}
                        </td>
                        <td>
                            {{ $appointment->scheduled_date }}
                        </td>
                        <td>
                            {{ $appointment->scheduled_time_12 }}
                        </td>
                        <td style="color: {{($appointment->status == 'Atendida') ? 'green' : 'red'}}">
                            {{ $appointment->status }}
                        </td>
                        <td>
                            <a href="{{ url('appointments/' . $appointment->id . '?tab=old&confirmed='.$confirmed.'&pending='.$pending.'&old='.$old) }}"
                                class="btn btn-sm btn-info d-inline-block" title="Consultar cita" data-toggle="tooltip">
                                ver
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    @if ($oldAppointments->hasPages())
        <div class="card-body text-center">
            <div class="py-3 d-flex justify-content-center">

                <ul class="pagination">

                    <li class="page-item<?php if ($oldAppointments->onFirstPage()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $oldAppointments->url(1).'&confirmed='.$confirmed.'&pending='.$pending.'&tab=old' }}">
                            <i class="fas fa-fast-backward"></i>
                        </a>
                    <li class="page-item<?php if ($oldAppointments->onFirstPage()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $oldAppointments->previousPageUrl().'&confirmed='.$confirmed.'&pending='.$pending.'&tab=old' }}">
                            <i class="fas fa-backward"></i>
                        </a>
                    </li>
                    {{-- 'first_page', 'current_page', 'last_page' --}}
                    @for ($page = $pages_old['first_page']; $page <= $pages_old['last_page']; $page++)
                        @if ($page == $pages_old['current_page'])
                            <li class="page-item disabled">
                                <a class="px-3 py-2 page-link bg-light fw-bold" href="#">
                                    {{ $page }}</a>
                            </li>
                        @else
                            <li class="page-item">
                                <a class="px-3 py-2 page-link" href="{{ $oldAppointments->url($page).'&confirmed='.$confirmed.'&pending='.$pending.'&tab=old'}}">
                                    {{ $page }}</a>
                            </li>
                        @endif
                    @endfor

                    <li class="page-item<?php if (!$oldAppointments->hasMorePages()) {
    echo ' disabled';
} ?>">
                        <a class="page-link" href="{{ $oldAppointments->nextPageUrl().'&confirmed='.$confirmed.'&pending='.$pending.'&tab=old' }}">
                            <i class="fas fa-forward"></i>
                        </a>
                    </li>
                    <li class="page-item<?php if (!$oldAppointments->hasMorePages()) {
    echo ' disabled';
} ?>">
                        <a class="page-link"
                            href="{{ $oldAppointments->url($oldAppointments->lastPage()).'&confirmed='.$confirmed.'&pending='.$pending.'&tab=old' }}">
                            <i class="fas fa-fast-forward"></i>
                        </a>
                    </li>

                </ul>

            </div>
        </div>
    @endif

@endif
