@extends('layouts.panel')

@section('content')
    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Mis citas</h3>
                </div>
            </div>
        </div>
        <div class="card-body">
            @if (session('notification'))
                <div class="alert alert-success" role="alert">
                    {{ session('notification') }}
                </div>
            @endif

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link{{session('tab')=='confirmed' ? ' active': ($tab == 'confirmed' ? ' active': '')}}"
                        data-toggle="pill" href="#confirmed-appointments" role="tab"
                        aria-selected=
                        "{{session('tab')=='confirmed' ? true : ($tab == 'confirmed' ? true: false)}}">
                        Mis próximas citas
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link{{session('tab')=='pending' ? ' active': ($tab == 'pending' ? ' active': '')}}"
                        data-toggle="pill" href="#pending-appointments" role="tab"
                        aria-selected=
                        "{{session('tab')=='pending' ? true : ($tab == 'pending' ? true: false)}}">
                        Citas por confirmar
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link{{session('tab')=='old' ? ' active': ($tab == 'old' ? ' active': '')}}"
                        data-toggle="pill" href="#old-appointments" role="tab"
                        aria-selected = "{{session('tab')=='old' ? true : ($tab == 'old' ? true: false)}}">
                        Historial de citas
                    </a>
                </li>
            </ul>
        </div>

        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade{{session('tab')=='confirmed' ? ' show active': ($tab == 'confirmed' ? ' show active': '')}}" id="confirmed-appointments" role="tabpanel">
                @include('appointments.tables.confirmed')
            </div>
            <div class="tab-pane fade{{session('tab')=='pending' ? ' show active': ($tab == 'pending' ? ' show active': '')}}" id="pending-appointments" role="tabpanel">
                @include('appointments.tables.pending')
            </div>
            <div class="tab-pane fade{{session('tab')=='old' ? ' show active': ($tab == 'old' ? ' show active': '')}}" id="old-appointments" role="tabpanel">
                @include('appointments.tables.old')
            </div>
        </div>
    </div>

@endsection
