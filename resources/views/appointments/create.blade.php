@extends('layouts.panel')

@section('content')
    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Registrar nueva cita</h3>
                </div>
                <div class="col text-right">
                    <a href="{{ url('/patients') }}" class="btn btn-sm btn-default">
                        Cancelar y Volver
                    </a>
                </div>
            </div>
        </div>
        <div class="card-body">
            @if ($errors->any())
                <div class="alert alert-danger" role="alert">
                    <ul class="mt-2">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            @if (session('notification'))
                <div class="alert alert-success" role="alert">
                    {{ session('notification') }}
                </div>
            @endif
            <form action="{{ url('/appointments') }}" method="POST">
                @csrf
                <div class="form-group">
                    <lavel for="description">Descripción</lavel>
                    <input type="text" name="description" class="form-control" value="{{ old('description') }}"
                        placeholder="Describe brevemente la consulta" required>
                </div>
                <div class="form-row">
                    <div class="col">
                        <div class="form-group">
                            <lavel for="specialty">Especialidad</lavel>
                            <select name="specialty_id" id="specialty" class="form-control" required>
                                <option>Seleccione una especialidad</option>
                                @foreach ($specialties as $specialty)
                                    <option value="{{ $specialty->id }}"
                                        @if (old('specialty_id') == $specialty->id) selected @endif>
                                        {{ $specialty->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <lavel for="doctor">Médico</lavel>
                            <select name="doctor_id" id="doctor" class="form-control" required>
                                @foreach ($doctors as $doctor)
                                    <option value="{{ $doctor->id }}" @if (old('doctor_id') == $doctor->id) selected @endif>
                                        {{ $doctor->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <lavel for="date">Fecha</lavel>
                    <div class="input-group input-group-alternative">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                        </div>
                        <input type="text" name="scheduled_date" id="date" class="form-control datepicker"
                            value="{{ old('scheduled_date', date('Y-m-d')) }}" data-date-format="yyyy-mm-dd"
                            data-date-start-date="{{ date('Y-m-d') }}" data-date-end-date="+30d">
                    </div>
                </div>
                <div class="form-group">
                    <lavel for="hours">Horario de atención</lavel>
                    <div id="hours">
                        @if ($intervals)
                            <div class="row justify-content-left text-muted pr-4 ml-4">
                                @if ($intervals['morning'])
                                    @foreach ($intervals['morning'] as $key => $interval)
                                        <div class="custom-control custom-radio mb-3 ml-4">
                                            <input name="scheduled_time" class="custom-control-input"
                                                id="{{ 'm' . $key }}" type="radio" value="{{ $interval['start'] }}"
                                                required>
                                            <label class="custom-control-label" for="{{ 'm' . $key }}">
                                                {{ $interval['start'] . ' - ' . $interval['end'] }}</label>
                                        </div>
                                    @endforeach
                                @endif
                                @if ($intervals['afternoon'])
                                    @foreach ($intervals['afternoon'] as $key => $interval)
                                        <div class="custom-control custom-radio mb-3 ml-4">
                                            <input name="scheduled_time" class="custom-control-input"
                                                id="{{ 'a' . $key }}" type="radio" value="{{ $interval['start'] }}"
                                                required>
                                            <label class="custom-control-label" for="{{ 'a' . $key }}">
                                                {{ $interval['start'] . ' - ' . $interval['end'] }}</label>
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                        @else
                            <div class="alert alert-secondary text-muted" role="alert"><b> Para obtener las horas
                                    disponibles! -
                                </b> Seleccione una Especialidad, un Médico y una fecha de atención.</span>
                            </div>
                        @endif
                    </div>
                </div>
                <lavel>Tipo de consulta</lavel>
                <div class="card-body alert alert-secondary text-muted">
                    <div class="row">
                        <div class="custom-control custom-radio ml-3">
                            <input name="type" class="custom-control-input" id="type1" type="radio" value="Consulta"
                                @if (old('type', 'Consulta') == 'Consulta') checked @endif>
                            <label class="custom-control-label" for="type1">Consulta</label>
                        </div>
                        <div class="custom-control custom-radio ml-3">
                            <input name="type" class="custom-control-input" id="type2" type="radio" value="Examen"
                                @if (old('type') == 'Examen') checked @endif>
                            <label class="custom-control-label" for="type2">Examen</label>
                        </div>
                        <div class="custom-control custom-radio ml-3">
                            <input name="type" class="custom-control-input" id="type3" type="radio" value="Operación"
                                @if (old('type') == 'Operación') checked @endif>
                            <label class="custom-control-label" for="type3">Operación</label>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">
                    Guardar
                </button>
            </form>
        </div>
    </div>
    </div>
@endsection

@section('scripts')
    <script src="{{ asset('/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
    <script src="{{ asset('/js/appointments/create.js') }}"></script>
@endsection
