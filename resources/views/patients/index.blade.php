@extends('layouts.panel')

@section('content')
    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Pacientes</h3>
                </div>
                <div class="col text-right">
                    <a href="{{ url('/patients/create') }}" class="btn btn-sm btn-success">
                        Nuevo Paciente
                    </a>
                </div>
            </div>
        </div>
        @if (session('notification'))
            <div class="card-body">
                    <div class="alert alert-success" role="alert">
                        {{ session('notification') }}
                    </div>
            </div>
        @endif
        <div class="table-responsive">
            <table class="table align-items-center table-flush">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">E-mail</th>
                        <th scope="col">DNI</th>
                        <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($patients as $patient)
                        <tr>
                            <th scope="row">
                                {{ $patient->name }}
                            </th>
                            <td>
                                {{ $patient->email }}
                            </td>
                            <td>
                                {{ $patient->dni }}
                            </td>
                            <td>
                                <form action="{{ url('patients/' . $patient->id) }}" method="POST">
                                    @csrf
                                    @method('DELETE')
                                    <a href="{{ url('patients/' . $patient->id . '/edit') }}"
                                        class="btn btn-sm btn-primary">Editar</a>
                                    <button class="btn btn-sm btn-danger" type="submit">
                                        Eliminar
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-body text-center">
        @if ($patients->hasPages())
            <div class="py-3 d-flex justify-content-center">

                <ul class="pagination">

                    <li class="page-item<?php if($patients->onFirstPage()) echo ' disabled'; ?>">
                        <a class="page-link" href="{{ $patients->url(1) }}">
                            <i class="fas fa-fast-backward"></i>
                        </a>
                    <li class="page-item<?php if($patients->onFirstPage()) echo ' disabled'; ?>">
                        <a class="page-link" href="{{$patients->previousPageUrl()}}">
                            <i class="fas fa-backward"></i>
                        </a>
                    </li>
                    {{--'first_page', 'current_page', 'last_page' --}}
                    @for ($page = $first_page; $page <= $last_page; $page++)
                        @if ($page == $current_page)
                            <li class="page-item disabled">
                                <a class="px-3 py-2 page-link bg-light fw-bold"
                                    href="#">
                                    {{ $page }}</a>
                            </li>
                        @else
                            <li class="page-item">
                                <a class="px-3 py-2 page-link"
                                    href="{{ $patients->url($page) }}">
                                    {{ $page }}</a>
                            </li>
                        @endif
                    @endfor

                    <li class="page-item<?php if(!$patients->hasMorePages()) echo ' disabled'; ?>">
                        <a class="page-link" href="{{ $patients->nextPageUrl() }}">
                            <i class="fas fa-forward"></i>
                        </a>
                    </li>
                    <li class="page-item<?php if(!$patients->hasMorePages()) echo ' disabled'; ?>">
                        <a class="page-link" href="{{ $patients->url($patients->lastPage()) }}">
                            <i class="fas fa-fast-forward"></i>
                        </a>
                    </li>

                </ul>

            </div>
        @endif
    </div>
@endsection
