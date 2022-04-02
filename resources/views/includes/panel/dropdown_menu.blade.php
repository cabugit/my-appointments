<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
    <div class=" dropdown-header noti-title">
        <h6 class="text-overflow m-0">Bienvenido(a)!</h6>
    </div>
    <a href="#" class="dropdown-item">
        <i class="ni ni-single-02"></i>
        <span>Mi perfil</span>
    </a>
    <a href="#" class="dropdown-item">
        <i class="ni ni-settings-gear-65"></i>
        <span>Configuración</span>
    </a>
    <a href="/appointments" class="dropdown-item">
        <i class="ni ni-calendar-grid-58"></i>
        <span>
            @if(Auth()->user()->role == 'admin')
                Citas médicas
            @else
                Mis citas
            @endif
        </span>
    </a>
    <a href="#" class="dropdown-item">
        <i class="ni ni-support-16"></i>
        <span>Ayuda</span>
    </a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="{{ route('logout') }}"
        onclick="event.preventDefault(); document.getElementById('formLogout').submit();">
        <i class="ni ni-key-25"></i> Cerrar sesión
    </a>
    <form action="{{ route('logout') }}" method="POST"
        style="display: none;" id="formLogout">
        @csrf
    </form>
</div>
