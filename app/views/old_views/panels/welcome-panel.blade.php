@php

    $levelAmount = 'level';

    if (Auth::User()->level() >= 2) {
        $levelAmount = 'levels';

    }

@endphp

<div class="card">
    <div class="card-header @role('admin', true) bg-secondary text-white @endrole">

        Bem vinda(o) {{ Auth::user()->name }}

        @role('admin', true)
            <span class="pull-right badge badge-light" style="margin-top:4px">
                Administrador
            </span>
        @else
            <span class="pull-right badge badge-light" style="margin-top:4px">
                Usuário comum
            </span>
        @endrole

    </div>
    <div class="card-body">
        <h2 class="lead">Healhouse - Paz Interior </h2>




    </div>
</div>
