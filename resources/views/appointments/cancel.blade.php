@extends('layouts.panel')

@section('content')
    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Cancelar cita</h3>
                </div>
                <div class="col text-right">
                    <a href="{{ url('/appointments?tab='.$tab.'&confirmed='.$confirmed.'&pending='.$pending.'&old='.$old) }}"
                        class="btn btn-sm btn-default">
                        Volver al listado de citas sin cancelar
                    </a>
                </div>
            </div>
        </div>
        <div class="card-body">
            @if($errors->any())
                <div class="alert alert-danger" role="alert">
                    <ul>
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                    </ul>
                </div>
            @endif

            @if($role == 'pacient')
                <p style="color:red">Estas a punto de cancelar tu cita <strong>
                {{$appointment->status}}</strong> para la Fecha:
                {{$appointment->scheduled_date}}, Hora: {{$time->format('g:i A')}},
                con el médico {{$appointment->doctor->name}} (Especialidad:
                {{$appointment->specialty->name}}).</p>
            @elseif($role == 'doctor')
                <p style="color:red">Estas a punto de cancelar tu cita de la especialidad
                {{$appointment->specialty->name}}, <strong>
                {{$appointment->status}}</strong> para la Fecha:
                {{$appointment->scheduled_date}}, Hora: {{$time->format('g:i A')}},
                con el paciente {{$appointment->patient->name}}.</p>
            @elseif($role == 'admin')
                <p style="color:red">Estas a punto de cancelar la cita de la especialidad
                {{$appointment->specialty->name}}, <strong>
                {{$appointment->status}}</strong> para la Fecha:
                {{$appointment->scheduled_date}}, Hora: {{$time->format('g:i A')}},
                del paciente {{$appointment->patient->name}} con el Médico
                {{$appointment->doctor->name}}.</p>
            @endif
            <form action="{{ url('/appointments/'.$appointment->id.'/cancel') }}" method="POST">
                @csrf
                <input type="hidden" name="tab" value="{{$tab}}">
                <input type="hidden" name="confirmed" value="{{$confirmed}}">
                <input type="hidden" name="pending" value="{{$pending}}">
                <input type="hidden" name="old" value="{{$old}}">
                <div class="form-group">
                    <lavel for="justification">Por favor cuéntanos el motivo de la cancelación</lavel>
                    <textarea type="text" name="justification" id="justification"
                    class="form-control" autofocus value="" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">
                    Cancelar cita
                </button>
            </form>
        </div>
    </div>
@endsection
