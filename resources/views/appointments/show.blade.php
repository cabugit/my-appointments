@extends('layouts.panel')

@section('content')
    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Cita # {{ $appointment->id }}</h3>
                </div>
            </div>
        </div>
        <div class="card-body">
            <ul>
                <li>
                    <strong>Fecha:</strong> {{ $appointment->scheduled_date }}
                </li>
                <li>
                    <strong>Hora:</strong> {{ $time->format('g:i A') }}
                </li>
                @if($role == 'admin')
                    <li>
                        <strong>
                            Médico:
                        </strong>
                        {{ $appointment->doctor->name }}
                    </li>
                    <li>
                        <strong>
                            Paciente:
                        </strong>
                        {{ $appointment->patient->name }}
                    </li>

                @elseif($role == 'doctor')
                    <li>
                        <strong>
                            Paciente:
                        </strong>
                        {{ $appointment->patient->name }}
                    </li>
                @elseif($role == 'patient')
                <li>
                    <strong>
                        Médico:
                    </strong>
                    {{ $appointment->doctor->name }}
                </li>
                @endif
                <li>
                    <strong>Especialidad:</strong> {{ $appointment->specialty->name }}
                </li>
                <li>
                    <strong>Tipo:</strong> {{ $appointment->type }}
                </li>
                <li>
                    <strong>Estado:</strong>
                    @if ($appointment->status == 'Cancelada')
                        <span class="badge badge-danger">CANCELADA</span>
                    @else
                        <span class="badge badge-success">{{ $appointment->status }}</span>
                    @endif
                </li>
            </ul>

            @if ($appointment->status == 'Cancelada' &&
                 isset($appointment->cancellation->justification))
                <div class="alert alert-warning">
                    <p>Acerca de la cancelación</p>
                    <ul>
                        @if ($appointment->cancellation())
                            <li>
                                <strong>Motivo de la cancelación:</strong>
                                {{ $appointment->cancellation->justification }}
                            </li>
                            <li>
                                <strong>¿Quién canceló la cita?</strong>
                                {{ ($appointment->cancellation->cancelled_by_id
                                    == Auth()->id()) ? 'Tú' :
                                    $appointment->cancellation->cancelled_by->name }}
                            </li>
                            <li>
                                <strong>Fecha de la cancelación:</strong>
                                {{ $appointment->cancellation->created_at }}
                            </li>
                        @else
                            <li>
                                Esta cita fué cancelada antes de su confirmación.
                            </li>
                        @endif
                    </ul>
                </div>
            @endif
            <a href="{{ url('appointments?tab='.$tab.'&confirmed='.$confirmed.'&pending='.$pending.'&old='.$old) }}"
                class="btn btn-default">
            Regresar
            </a>
        </div>
    </div>
@endsection
