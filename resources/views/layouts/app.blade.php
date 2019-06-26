<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Coremas') }}</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">

    <script type="text/javascript">
        var dominio = 'http://coremas.com.co/';
    </script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.5/angular.min.js"></script>
    <script type="text/javascript" src="{{ asset('js/materialize.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/lightslider.js') }}" ></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/3.0.4/fullpage.js" ></script>
    <script type="text/javascript" src="{{ asset('js/jquery.popupoverlay.js') }}" ></script>
    <script type="text/javascript" src="{{ asset('slider/js/image-slider.js') }}"></script>
    <script src="{{ asset('js/init.js') }}"></script>
    <!-- Fonts -->

    <!-- Styles -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" 
    href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" 
    integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" \
    crossorigin="anonymous">
    
    <link rel="stylesheet" href="{{ asset('css/font-awesome-4.6.3/css/font-awesome.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset ('slider/css/image-slider.css') }}">
    <link href="{{ asset('css/materialize.css') }}" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    <link rel="stylesheet" type="text/css" href="{{asset ('css/animate.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset ('css/default.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{asset ('css/component.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset ('css/lightslider.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset ('css/circle.css') }}">



    <link href="{{ asset('css/style.css') }}" type="text/css" rel="stylesheet" media="screen,projection">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

</head>
<body>   
    <div class="navbar-fixed">
        <nav>
            <div class="nav-wrapper" style="padding-left: 100px">
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                <a class="brand-logo" href="{{ url('/') }}">
                    <img src="{{ asset('img/logo.png') }}" alt="Core+" title="Core+">
                </a>
                <ul id="nav-mobile" class="center hide-on-med-and-down">
                        <li><a href="#modalsesion" class="modal-trigger">Iniciar un proyecto</a></li>
                        <li><a href="https://coremas.com.co/proyectos/cod21/">Explorar Proyectos</a></li>
                        <li>
                            <a class="dropdown-button" href="#!" data-activates="dropdown1">Corporativo</a>
                            <ul id="dropdown1" class="dropdown-content submenu">
                                <li><a href="https://coremas.com.co/quienes-somos/cod8/">Quienes somos</a></li>
                                <li><a href="https://coremas.com.co/como-funciona/cod30/">Cómo funciona</a></li>
                                <!--<li><a href="https://coremas.com.co/clasificados/cod10/">Clasificados</a></li>
                                <li><a href="https://coremas.com.co/blog/cod2/">Blog</a></li>
                                <li><a href="https://coremas.com.co/eventos/cod7/">Eventos</a></li>
                                <li><a href="https://coremas.com.co/contacto/cod5/">Contáctenos</a></li>-->
                            </ul>
                        </li>
    
                        <li class="user"><a class="dropdown-button" href="#!" data-activates="menservic">Servicios</a></li>
                        <ul id="menservic" class="dropdown-content">
                            <li ><a href="https://coremas.com.co/clasificados/cod10/">Clasificados</a></li>
                            <li ><a href="https://coremas.com.co/blog/cod2/">Blog</a></li>
                            <li ><a href="https://coremas.com.co/eventos/cod7/">Eventos</a></li>
                        </ul>
    
    
                        <li ><a href="https://coremas.com.co/contacto/cod5/">Contáctenos</a></li>
                        <!-- proyectos -->
    
                        <!-- fin proyectos -->
                        @guest
                        <li class="user"><a class="dropdown-button" href="#!" data-activates="dropdown2"><i class="fa fa-user"></i></a></li>
                        <ul id="dropdown2" class="dropdown-content">
                            <li><a href="{{ route('login') }}">Acceso</a></li>
                            <li><a href="{{ route('register') }}">Registro</a></li>
                        </ul>
                        @else
                        <li class="user">
                            <a class="dropdown-button" href="#!" data-activates="dropdownperfil"><img src="https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=2209471662401019&height=50&width=50&ext=1549990660&hash=AeQEF6TaJ2omX9UY" alt="Core+" title="Core+" id="imgper" >
                            {{ Auth::user()->name }} </a>
                            <ul id="dropdownperfil" class="dropdown-content">
                                <li>
                                    <a class="dropdown-item" href="#">
                                        {{ __('Perfil') }}
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                        document.getElementById('logout-form').submit();">
                                        {{ __('Salir') }}
                                    </a>  
                                </li>
                                

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                            </ul>
                        </li>
                        @endguest
                    </ul>
            </div>
        </nav>
    </div>
    @yield('content')
    @yield('scripts')

</body>
</html>
