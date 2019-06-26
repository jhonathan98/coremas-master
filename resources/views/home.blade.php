@extends('layouts.app')
@section('content')
    <div class="owl-carousel owl-theme banner" id="bannerslider">
        <div class="item" style="background-image: url(http://coremas.com.co/imagenes/slide/imagen1/materializa-tus-ideas-y-suenos1712.png);">
        <div class="txtt">
            <div class="txt">
                <h3>Materializa tus ideas y sueños</h3>
                <p>Convirtiéndolos en proyectos con futuro</p>
                <a href="http://coremas.com.co/inicia-proyecto/cod6/"  target="_self">Comienza tu proyecto</a>
            </div>
        </div>
        </div>
        <div class="item" style="background-image: url(http://coremas.com.co/imagenes/slide/imagen1/lorem-ipsum-dolor1713.png);">
            <div class="txtt">
                <div class="txt">
                    <h3>Financiación colaborativa</h3>
                    <p>para que desarrolles tus ideas o proyectos</p>
                    <a href="#"  target="_self">Aprende como</a>
                </div>
            </div>
        </div>
    </div>
    <h2 class="titles">ULTIMOS PROYECTOS</h2>
    <div class="row">
        <div class="col m12 s12 l12">
            <div class="listaproyectos" >
                @forelse ($proyecto as $item)
                    <div class="col s3 m3 l3 items">
                        <div class="cont">
                            <div class="contlike">
                                {{-- 
    
                                <img src="images/plusico.png" alt="" title="" rel=""  >
    
                                    <!--cuantos likes he recibido-->
                                    
                                ?>
                                <span>Cantidad</span>    
                                    
                                --}}
    
                            </div>
                            <div class="contimg">
                                <div class="imgcont" style="background-image: url(http://coremas.com.co/imagenes/slide/imagen1/materializa-tus-ideas-y-suenos1712.png);"></div>
                                <div class="contporc align-center">
                                    <div class="row">
                                        <div class="col s12 m12 l4 center-align">
                                            <b style="margin-top:158px !important;"class="reca">Recaudos</b>
                                            <span><b>$10000</b></span>
    
                                        </div>
                                        <div class="col s12 m12 l3 center-align">
                                            <br><br><br>
                                            <div class="c100 p40 small">
                                                <span style="line-height: 18px; padding-top: 7px;">5<br>Días</span>
                                                <div class="slice">
                                                    <div class="bar"></div>
                                                    <div class="fill"></div>
                                                </div>
                                            </div>
                                            <b class="reca">Restantes</b>
                                            <span><b>40%</b></span>
                                        </div>
                                        <div class="col s12 m12 l5 center-align">
                                            <br>
                                            <div class="c100 p30">
                                                <span>98%</span>
                                                <div class="slice">
                                                    <div class="bar"></div>
                                                    <div class="fill"></div>
                                                </div>
                                            </div>
                                            <b class="reca">Meta</b>
                                            <span><b>$10000000</b></span>
                                        </div>
                                    </div>
                                    <div class="pa">
                                        <h4><b>Proyecto</b></h4>
                                        <p><b>Por:</b> <span>Miguel</span></p>
                                        <p class="gray">Lorem ipsum dolor sit, amet consectetur adipisicing elit. In ut dicta dignissimos voluptatibus  </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @empty
                    <p class="text-center">No hay proyectos aun. :(</p>
                @endforelse
                
            </div>
        </div>
    </div>
    <h2 class="titles">Clasificados</h2>
    <div class="row">
        <div class="col m12 s12 l12">
            <div class="listaproyectos" >
                @forelse ($clasificado as $item)
                <div class="col s3 m3 l3 items">
                        <div class="cont">
                            <div class="contlike">
                                {{-- 
    
                                <img src="images/plusico.png" alt="" title="" rel=""  >
    
                                    <!--cuantos likes he recibido-->
                                    
                                ?>
                                <span>Cantidad</span>    
                                    
                                --}}
    
                            </div>
                            <div class="contimg">
                                <div class="imgcont" style="background-image: url(http://coremas.com.co/imagenes/slide/imagen1/materializa-tus-ideas-y-suenos1712.png);"></div>
                                <div class="contporc align-center" >                                    
                                    <div class="pa" style="margin-top:180px">
                                        <h4 style="text-align: center"><b>{{ $item->nombre}}</b></h4>                                        
                                        <p class="gray" style="text-align: justify">{{$item->descripcion}}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @empty
                    <p class="text-center">No hay clasificados. :(</p>
                @endforelse
                
            </div>
        </div>
    </div>



@endsection




@section('scripts')

<script>
    $(document).ready(function() {
        $('#bannerslider').owlCarousel({
          loop:true,
          margin:0,
          autoplay:true,
          autoplayTimeout:4000,
          slideSpeed: 30000,
          autoplaySpeed: 4000,
          autoplayHoverPause:true,
          dots:false,
          nav:false,
          items:1,
          navText:["<img src='/img/izq.png' width='50%' style='margin-top: 80px;' alt='Anterior' title='Anterior'>","<img src='/img/der.png'  style='margin-top: 80px;' width='50%' alt='Siguiente' title='Siguiente'>"]
        })

        $('#proyectosSlide').owlCarousel({
          loop:true,
          margin:0,
          dots:false,
          nav:true,
          items:4,
          navText:["<img src='/img/izq.png' width='50%' style='margin-top: 80px;' alt='Anterior' title='Anterior'>","<img src='/img/der.png'  style='margin-top: 80px;' width='50%' alt='Siguiente' title='Siguiente'>"]
        })
    });

</script>
@endsection


