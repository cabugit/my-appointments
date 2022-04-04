@extends('layouts.panel')

@section('content')
    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Modificar datos de usuario</h3>
                </div>
                {{-- <div class="col text-right">
                    <a href="{{ url('/patients') }}" class="btn btn-sm btn-default">
                        Cancelar y Volver
                    </a>
                </div> --}}
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
            <form action="{{ url('/profile') }}" method="POST">
            @csrf

            <div class="form-group">
                <lavel for="name">Nombre completo</lavel>
                <input type="text" name="name" class="form-control"
                    id="name" value="{{ old('name', $user->name) }}" required>
            </div>

            <div class="form-group">
                <lavel for="phone">Número de teléfono</lavel>
                <input type="text" name="phone" class="form-control"
                    id="phone" value="{{ old('phone', $user->phone) }}" required>
            </div>

            <div class="form-group">
                <lavel for="address">Dirección</lavel>
                <input type="text" name="address" class="form-control"
                    id="address" value="{{ old('address', $user->address) }}">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary">
                    Guardar cambios
                </button>
                </form>
            </div>
        </div>
    </div>
@endsection
