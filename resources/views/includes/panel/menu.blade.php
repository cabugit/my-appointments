<!-- Navigation -->
<h6 class="navbar-heading text-muted">
    @if(Auth()->User()->role == 'admin')
        Gestionar
    @else
        Menú
    @endif
</h6>
<ul class="navbar-nav">
    @include('includes.panel.menu.'.
        Auth()->User()->role
    )
<li class="nav-item">
    <a class="nav-link" href="{{ route('logout') }}"
    onclick="event.preventDefault(); document.getElementById('formLogout').submit();">
        <i class="ni ni-key-25"></i> Cerrar sesión
    </a>
    <form action="{{ route('logout') }}" method="POST"
        style="display: none;" id="formLogout">
        @csrf
    </form>
</li>
</ul>

@if(Auth()->User()->role == 'admin')
    <!-- Divider -->
    <hr class="my-3">
    <!-- Heading -->
    <h6 class="navbar-heading text-muted">Reportes</h6>

    <!-- Navigation -->
    <ul class="navbar-nav mb-md-3">
        <li class="nav-item">
            <a class="nav-link"
                href="/charts/appointments/line">
                <i class="ni ni-collection text-yellow"></i> Frecuencia de citas
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/charts/doctors/column">
                <i class="ni ni-briefcase-24 text-orange"></i> Médicos más activos
            </a>
        </li>
    </ul>
@endif

