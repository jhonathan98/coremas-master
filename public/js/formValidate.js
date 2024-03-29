function vacios(form)
{
	var ne =0;
	$(form+" .required").each(function(data){
		
		txt = $(this).val();
		tipo = $(this).attr("rel");
		if (txt=="") 
		{
			ne++;
			$(this).focus().after("<span class='error-site'>"+FIELD_REQUIRED+"</span>");
			setTimeout(function(){
				$(form+" .error-site").hide();
			},3000);
			return false;
		}

		else if(tipo=="email")
		{
			if (!compro_email(txt)) 
			{
				ne++;
				$(this).focus().after("<span class='error-site'>"+INVALID_EMAIL_ADDRESS+"</span>");
				setTimeout(function(){
					$(form+" .error-site").hide();$(this).hide();
				},3000);
				return false;
			}
		}

		else if(tipo=="phone")
		{
			if (!compro_phone(txt)) 
			{
				ne++;
				$(this).focus().after("<span class='error-site'>"+INVALID_PHONE_NUMBER+"</span>");
				setTimeout(function(){
					$(form+" .error-site").hide();$(this).hide();
				},3000);
				return false;
			}
		}

		else if(tipo=="password")
		{
			if (!contrasegura(txt)) 
			{
				ne++;
				$(this).focus().after("<span class='error-site'>"+VALID_PSW+"</span>");
				setTimeout(function(){
					$(form+" .error-site").hide();
				},3000);
				return false;
			}
		}

		else if(tipo=="textarea")
		{
			if (txt.length<20)
			{
				ne++;
				$(this).focus().after("<span class='error-site'>"+CHARACTERS_MIN+"</span>");
				setTimeout(function(){
					$(form+" .error-site").hide();
				},3000);
				return false;
			}
		}

		else if(tipo=="url")
		{
			if (!compro_url(txt)){
			ne++;
			$(this).focus().after("<span class='error-site'>"+INVALID_URL+"</span>");
			setTimeout(function(){
				$(form+" .error-site").hide();
			},3000);
			return false;
		}
		}

		else if(tipo=="documento")
		{
			if(!comprobar_doc(txt))
			{
				ne++;
				$(this).focus().after("<span class='error-site'>"+GIF_JPG_PNG_FORMAT+"</span>");
				setTimeout(function(){
					$(form+" .error-site").hide();
				},3000);
				return false;
			}
		}
	});

	if (ne==0)
	{
		return true;
	}
	else
	{
		return false;
	}

}

function compro_email(dato)
{
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!expr.test(dato))
    {
       return false;
    }
    else {  return true; }

}

function compro_phone(dato)
{
    expr = /^([\+][0-9]{1,3}([ \.\-])?)?([\(][0-9]{1,6}[\)])?([0-9 \.\-]{1,32})(([A-Za-z \:]{1,11})?[0-9]{1,4}?)$/;
    if (!expr.test(dato))
    {
       return false;
    }
    else {  return true; }

}

function compro_url(dato)
{
	expr = /^(http|https|)\:\/\/[a-z0-9\.-]+\.[a-z]{2,4}/gi;
	if (!expr.test(dato))
    {
       return false;
    }
    else {  return true; }	
}


function contrasegura(dato)
{
		// set password variable
        var pswd = dato;
        //validate the length
        if ( pswd.length < 8 ) {
            return false;
        }
        //validate letter
        if (pswd.match(/[A-z]/) ) {        	

        } else {

            return false;

        }



        //validate capital letter

        if (pswd.match(/[A-Z]/) ) {



        } else {

           return false;

        }



        //validate number

        if ( pswd.match(/\d/) ) {

            return true;

        } else {

           return false;

        }

}

function isNumberKey(evt)

{

	var charCode = (evt.which) ? evt.which : evt.keyCode;
console.log(charCode);
	// Added to allow decimal, period, or delete

	if (charCode == 110 || charCode == 190 || charCode == 46) 

		return true;

	if (charCode > 31 && (charCode < 48 || charCode > 57)){
		return false;
	}
}

function otronumber(evt){
	var txt = evt;
 
	if (!/^([0-9])*$/.test(txt)) {
		console.log(txt);
		return false;
	}
}

function comprobar_doc(val)
{
	switch(val.substring(val.lastIndexOf('.')+1).toLowerCase()) 
	{ case 'gif': case 'jpg': case 'png': 
	return true; 
	break; 
	default: 
	return false; 
	break; 
	} 
}
