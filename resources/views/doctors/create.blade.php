@extends('layouts.panel')

@section('styles')
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
@endsection

@section('content')
    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Nuevo Médico</h3>
                </div>
                <div class="col text-right">
                    <a href="{{ url('/doctors') }}" class="btn btn-sm btn-default">
                        Cancelar y Volver
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

            <form action="{{ url('doctors') }}" method="POST">
                @csrf
                <div class="form-group">
                    <lavel for="name">Nombre del médico</lavel>
                    <input type="text" name="name" class="form-control"
                        value="{{ old('name') }}" required>
                </div>
                <div class="form-group">
                    <lavel for="email">E-mail</lavel>
                    <input type="text" name="email" class="form-control"
                        value="{{ old('email') }}">
                </div>
                <div class="form-group">
                    <lavel for="dni">DNI</lavel>
                    <input type="text" name="dni" class="form-control"
                        value="{{ old('dni') }}">
                </div>
                <div class="form-group">
                    <lavel for="address">Dirección</lavel>
                    <input type="text" name="address" class="form-control"
                        value="{{ old('address') }}">
                </div>
                <div class="form-group">
                    <lavel for="phone">Teléfono/móvil</lavel>
                    <input type="text" name="phone" class="form-control"
                        value="{{ old('phone') }}">
                </div>
                <div class="form-group">
                    <lavel for="phone">Contraseña</lavel>
                    <input type="text" name="new_password" class="form-control"
                        value="{{ old('new_password', $suggested_password) }}">
                </div>
                <div class="form-group">
                    <lavel for="name">Especialidades</lavel>
                    <select name="specialties[]" id="specialties"
                        class="form-control selectpicker"
                        data-style="btn-default" multiple
                        title="Seleccione una o varias.">
                        @foreach($specialties as $specialty)
                            <option value="{{$specialty->id}}">
                                {{$specialty->name}}
                            </option>
                        @endforeach
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">
                    Guardar
                </button>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
@endsection
