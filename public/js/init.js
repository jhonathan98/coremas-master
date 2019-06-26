$(function(){
  $(".btonmeguta").click(function(){
      /*
    var nump = $(this).attr("rel");
    parameters = {
      "cod":"megustaPro",
      "idPro":nump
    }
    $.ajax({
    data: parameters,
          url:   dominio+'lib/ajax_hlo.php',
          type:  'POST',
          beforeSend: function () 
          {

          },
          success:  function (response) {
            console.log(response);
            if (response==1){
              // swal('Correcto!','Like enviado correctamente','success');
              location.reload();
            } else{
              swal('Error','Usted ya le dio like','error');
            }
          }
      });
  })
    
})*/

$.fn.extend({
    animateCss: function (animationName, callback) {
        var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        this.addClass('animated ' + animationName).one(animationEnd, function() {
            $(this).removeClass('animated ' + animationName);
            callback(1);
        });
    }
});
(function($){
  $(function(){
    $('.cuentacaracter').characterCounter();
    $(".button-collapse").sideNav();
    $(".modal-trigger").click(function(){
      $('.modal').closeModal();
      $(".lean-overlay").remove();
      var idmo = $(this).attr("href");
      setTimeout(function(){        
        $(idmo).openModal();
      },300)
        
    })
    /*
        $("#form-suscribir").submit(function(){
          if (!vacios("#form-suscribir")) {return false;}
          $.ajax({
            type: 'POST',
            url: dominio+"lib/task/server.php",
            data: $("#form-suscribir").serialize(),
            success: function(data){
              var respuesta = data['msg'];
              if (respuesta == '1' || respuesta == '3') {
                swal({
                  title: "proceso Exitoso",
                  text: "mensaje enviado correctamente",
                  type: "success",
                  closeOnConfirm: false
                },function(){
                  location.reload();
                });
              }else{
                swal('Error','Ocurrio un problema, intente mas tarde','error');
              }
            }
          });
          return false;
        });
*/

      $(".clvistas").click(function(){
        $(".clvistas").removeClass("active");
        $(this).addClass("active");
        var datr = $(this).attr("rel");
        if (datr=="cua"){
          $(".listeventos").addClass("row");
          $(".listeventos").addClass("cuaevento");
        }
        if (datr=="list"){
          $(".listeventos").removeClass("row");
          $(".listeventos").removeClass("cuaevento");
        }
      })
      $(".listquienes .cont").hover(function(){
        $(".contquienes").addClass("menma");
      }, function(){
        $(".contquienes").removeClass("menma");
      })
  }); // end of document ready
})(jQuery); // end of jQuery name space
  })
});

