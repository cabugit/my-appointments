@extends('layouts.panel')

@section('content')
    <form action="{{ url('/schedule') }}" method="post">
        @csrf
        <div class="card shadow">
            <div class="card-header border-0">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="mb-0">Gestionar horario</h3>
                    </div>
                    <div class="col text-right">
                        <button type="submit" class="btn btn-sm btn-success">
                            Guardar cambios
                        </button>
                    </div>
                </div>
            </div>
            @if (session('errors'))
                <div class="card-body">
                    <div class="alert alert-danger" role="alert">
                    Los cambios se han guardado, pero tener en cuenta que:
                        <ul>
                            @foreach(session('errors') as $error)
                            <li>
                               {{ $error }}
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            @endif
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
                            <th scope="col">Día</th>
                            <th scope="col">Activo</th>
                            <th scope="col">Turno mañana</th>
                            <th scope="col">Turno tarde</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($workDays as $key => $workDay)
                            <tr>
                                <th scope="row">
                                    {{ $days[$key] }}
                                </th>
                                <td>
                                    <label class="custom-toggle">
                                        <input type="checkbox" name="active[]" value="{{ $key }}"
                                            @if($workDay->active) checked @endif>
                                        <span class="custom-toggle-slider rounded-circle"></span>
                                    </label>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="col">
                                            <select name="morning_start[]" class="form-control">
                                                @for($i=5;$i<=11;$i++)
                                                    <option value="{{($i<10 ? '0' : '').$i}}:00"
                                                        @if($i.':00 AM'==$workDay->morning_start) selected @endif>{{$i}}:00 am</option>
                                                    <option value="{{($i<10 ? '0' : '').$i}}:00"
                                                        @if($i.':30 AM'==$workDay->morning_start) selected @endif>{{$i}}:30 am</option>
                                                @endfor
                                            </select>
                                        </div>
                                        <div class="col">
                                            <select name="morning_end[]" class="form-control">
                                                @for($i=5;$i<=11;$i++)
                                                    <option value="{{($i<10 ? '0' : '').$i}}:00"
                                                        @if($i.':00 AM'==$workDay->morning_end) selected @endif>{{$i}}:00 am</option>
                                                    <option value="{{($i<10 ? '0' : '').$i}}:30"
                                                        @if($i.':30 AM'==$workDay->morning_end) selected @endif>{{$i}}:30 am</option>
                                                @endfor
                                            </select>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="col">
                                            <select name="afternoon_start[]" class="form-control">
                                                @for($i=1;$i<=11;$i++)
                                                    <option value="{{($i<10 ? '0' : '').$i+12}}:00"
                                                        @if($i.':00 PM'==$workDay->afternoon_start) selected @endif>{{$i}}:00 pm</option>
                                                    <option value="{{($i<10 ? '0' : '').$i+12}}:30"
                                                        @if($i.':30 PM'==$workDay->afternoon_start) selected @endif>{{$i}}:30 pm</option>
                                                @endfor
                                            </select>
                                        </div>
                                        <div class="col">
                                            <select name="afternoon_end[]" class="form-control">
                                                @for($i=1;$i<=11;$i++)
                                                    <option value="{{($i<10 ? '0' : '').$i+12}}:00"
                                                        @if($i.':00 PM'==$workDay->afternoon_end) selected @endif>{{$i}}:00 pm</option>
                                                    <option value="{{($i<10 ? '0' : '').$i+12}}:30"
                                                        @if($i.':30 PM'==$workDay->afternoon_end) selected @endif>{{$i}}:30 pm</option>
                                                @endfor
                                            </select>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </form>

@endsection
