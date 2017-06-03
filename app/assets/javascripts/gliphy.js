$(function() {

	/*var editor = new EpicEditor({
	file:{
	name:"nueva-publicacion"
	}
	});
	$("#formulario_publicacion").on("submit",function(){
	$("#publicacion_mensaje").val( editor.exportFile("nueva-publicacion","html"));
	});*/

	  /*============evitar inciar sesion=====================
	  $("form button").click(function (e) {
	    e.preventDefault();
	  });
	  //====================================================
	  $(".dropdown-button").dropdown({
	    constrainWidth: false, //no abarque el ancho que quiera
	    alignment: 'right',
	  });
	  //===========btn editar==================================
	  $(".abrir-btn").click(function () {
	    $(".collapsible-header").addClass("active");
	    $("#lista-expandible").addClass("active");
	    $(".collapsible-body").slideDown();
	    $("#flecha_up_down").text("keyboard_arrow_up");
	  });
	   $(".collapsible-header").click(function () {
	    $("#flecha_up_down").text("keyboard_arrow_down");
	});*/
	$("#tabgrupos").click(function (){
		$("#everyone").prop( "checked", false );
		$("#noteveryone").prop( "checked", false );
		$("#grupoesp").prop( "checked", true );
		$("#generalfiltertab input[type=checkbox]").prop('checked', false);
		$("#generalizando").addClass("ocultado");
		$("#especificando").fadeIn();
		$("#gruposfiltertab input[type=checkbox]").prop('checked', false);
	});
	$("#tabgeneral").click(function (){
		$("#grupoesp").prop( "checked", false );
		$("#notgrupoesp").prop( "checked", false );		
		$("#noteveryone").prop( "checked", true );
		$("#gruposfiltertab input[type=checkbox]").prop('checked', false);
		$("#generalizando").addClass("ocultado");
		$("#especificando").fadeIn();
	});
	$("#everyone").click(function (){
		$("#generalfiltertab input[type=checkbox]").prop('checked', true);
	});
	$("#noteveryone").click(function (){
		$("#generalfiltertab input[type=checkbox]").prop('checked', false);
	});
	$("#notgrupoesp").click(function (){
		$("#generalizando").removeClass("ocultado");
		$("#especificando").fadeOut();
	});
	$("#grupoesp").click(function (){
		$("#generalizando").addClass("ocultado");
		$("#especificando").fadeIn();
		$("#gruposfiltertab input[type=checkbox]").prop('checked', false);
	});

	
	// =============== CONTAR CARACTERES ====================
	$('input#input_text, textarea#textarea1').characterCounter();
	 // =============== ComboBox =========================
	$('select').material_select();
	//=============== Fecha =================
	$('.datepicker').pickadate({
		selectMonths: true, // Creates a dropdown to control month
		selectYears: 15 // Creates a dropdown of 15 years to control year
	});
	//=============== Arroja Mensaje ===================
	$('.tooltipped').tooltip({delay: 50});
	//=============== Abrir modal ===============
	$('.modal').modal();
	//=============== PRUEBA =================
	$('.user-activator').sideNav({
		menuWidth: 260, // Default is 300
		edge: 'right', // Choose the horizontal origin
		closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
		draggable: true // Choose whether you can drag to open on touch screens
	});
	$('#menu-activator').sideNav({
		menuWidth: 240, // Default is 300
		edge: 'left', // Choose the horizontal origin
		closeOnClick: false, // Closes side-nav on <a> clicks, useful for Angular/Meteor
		draggable: true // Choose whether you can drag to open on touch screens
	});

	$('#notificaciones-activator').sideNav({
		menuWidth: 240, // Default is 300
		edge: 'left', // Choose the horizontal origin
		closeOnClick: false, // Closes side-nav on <a> clicks, useful for Angular/Meteor
		draggable: true // Choose whether you can drag to open on touch screens
	});
	/*//tagts
	$('.chips').material_chip();
	$('.chips-initial').material_chip({
		data: [{ tag: 'Comunicado', } , { tag: 'Aviso', }],
	});*/
	// Show sideNav
	//$('.button-collapse').sideNav('show');

	// ====== Carousel =========
  	$('.carousel.carousel-slider').carousel({fullWidth: true});
	$('.carousel').carousel();
	$('#siguiente').click(function(){
		$('.carousel').carousel('next');
	});
	$('#atras').click(function(){
		$('.carousel').carousel('prev');
	});

	//======== Ocultar o mostrar menu ========
	 var menunavegaciónLargeVisible = true;
	$('#toggleMenu').on("click", function() {
		if (menunavegaciónLargeVisible){
			$('#menu-normal').animate({width: '0px'},"fast");
			$('header, main, .botones-flotantes').animate({paddingLeft: '0px'},"fast");
			$('#location').animate({paddingLeft: '3px'});
			$('#toggleMenu i').text("view_quilt");
		}
		else{
			$('#menu-normal').animate({width: '240px'},"fast");
			$('header, main, .botones-flotantes').animate({paddingLeft: '240px'},"fast");
			$('#location').animate({paddingLeft: '0px'});
			$('#toggleMenu i').text("view_stream");
		}   
		menunavegaciónLargeVisible = !menunavegaciónLargeVisible
		$('#menu-activator').toggleClass("hide-on-large-only");   
		$('header, main, .botones-flotantes').toggleClass("navegacion-espacio");
	    	//$('#navegacion-no-oculto').toggleClass("ocultado");
	});

	 var menunavegaciónHelp = true;
	$('.helpToggleMenu').on("click", function() {
		if (menunavegaciónHelp){
			$('.helpToggleMenu i').text("view_quilt");
		}
		else{
			$('.helpToggleMenu i').text("view_stream");
		}   
		menunavegaciónHelp = !menunavegaciónHelp
	});

	//======== Cambiar vistas ========

	//Mostrar Comunicado Large => Default

	$('.comunicado-contenedor').click(function (e){
		mostrarComunicadoLarge(e);
	});
	
	function mostrarComunicadoLarge(e) {
		e.preventDefault();
		//$('#contenido-large').slideUp(1);
		//$('#contenido-large').slideDown(1000);
		$('#contenido-large .card-content').animate({opacity: '0.1'}, 1);
		$('#contenido-large').animate({bottom:'100%'}, 100);
		$('#contenido-large').animate({bottom:'15px'}, 400);
		$('#contenido-large .card-content').animate({opacity: '1'}, 1500);
	};

	/*// Cabiar tags dependiendo del tamaño del dispositivo o resizing
	var tagHrefRexponsive = "#contenido-responsivo"
	var tagHrefLarge ="#!" 

	function cambiarHrefTag () {
		// Comprueba el tamaño del dispositivo
		if ($( window ).width() <=  992 ) {
			$('.comunicado-contenedor').off("click");
			$('.comunicado-contenedor').attr("href", tagHrefRexponsive);
		}
		// comprueba si el botón Vista Simple ha sido activado previamente
		else if (vistaTres) {
			$('.comunicado-contenedor').on("click", function(e) {
				mostrarComunicadoLarge(e);
			});
			$('.comunicado-contenedor').attr("href", tagHrefLarge);
		}
	};

	$(window).resize(function() {
		cambiarHrefTag();
	});*/



	
	$(".flechita").dropdown();

	var destacado = false
	$(".destacar-btn").on("click", function() {
		if (destacado) {
			$(".destacar-btn i").text("notifications_none");
		}
		else {
			$(".destacar-btn i").text("notifications_active");
		}
		destacado = !destacado

	});	


	//========= Editar Profile ==========
	var editable = false
	$("#editarDatosProfile").on("click", function() {
		if (!editable) {
			$("#user_email").prop("disabled", false);
			$("#user_email").removeClass("grey-text");
			$("#user_password").prop("disabled", false);
			$("#user_password").removeClass("grey-text");
			$("#editar-devise").parent().removeClass("ocultado");
			$("#editarDatosProfile").addClass("ocultado");
			$("#confirmar-col").removeClass("ocultado");
			$("#user_password_confirmation").prop("disabled", false);
			$("#validarPass").removeClass("ocultado");
			$("#validarPass input").prop("disabled", false);
			$("#cancelarDatosProfile").removeClass("ocultado");
			editable = !editable
		}
	});

	$("#cancelarDatosProfile").on("click", function() {
		$("#user_email").prop("disabled", true);
		$("#user_email").addClass("grey-text");
		$("#user_password").prop("disabled", true);
		$("#user_password").addClass("grey-text");
		$("#editar-devise").parent().addClass("ocultado");
		$("#editarDatosProfile").removeClass("ocultado");
		$("#confirmar-col").addClass("ocultado");
		$("#user_password_confirmation").prop("disabled", true);
		$("#validarPass").addClass("ocultado");
		$("#validarPass input").prop("disabled", true);
		$("#cancelarDatosProfile").addClass("ocultado");
		editable = !editable;
	});

	// Toma todos los campos que contengan algún error y muestra un mensaje
	$(".input-error").after("<div class='message-error'>error</div>");
	// Si se cambia el contenido del input, se quitan los errores
	$(".input-error").focus(function(e) {
		var voID = "#" + e.target.id;
		$(voID).change(function(e) {
			$(this).siblings(".message-error").remove();
			$(this).removeClass("input-error");
		});
	});
	// Para ver comunicados
	$('.para-ver').on("click", function(e) {
		var vvv = "#" + e.target.id;
		var rrr = $(vvv).parents(".card").find('.desplegable').prop('style').height
		if (rrr == "auto") {
			$(vvv).parents(".card").find('.desplegable').css({height:'0'});
			$(vvv).parents(".card").find('.desplegable').css({display:'none'});	
		}
		else {
			$(vvv).parents(".card").find('.desplegable').css({height:'auto'});
			$(vvv).parents(".card").find('.desplegable').css({display:'inherit'});	
		}
	});
	
	// Para elegir grupos
	$('.collapsible').collapsible();
/*###################habilitar y deshabilitar materias#############*/
	var  grado_1
	grado_1=0
	for (var i=1; i<=20; i++) {
		$("#grupos_"+i).on("click", function() {
			for (var y=1 ;y<=20; y++) {
				if($("#grupos_"+y).prop('checked')){
					//console.log("habilitado")
					grado_1++
				}else{
					//console.log("deshabilitado")
					grado_1--
				}
			}

			if(grado_1==-20){
				for (var x=1; x<=10; x++) {
					$("#materias_"+ x).attr("disabled", true);
					$("#materias_"+ x).prop('checked', false);
				}

			}else{
				for (var x=1; x<=10; x++) {
					$("#materias_"+ x).attr("disabled", false);
				}
			}
			grado_1=0
		});
	}
	var  grado_2
	grado_2=0
	for (var i=21; i<=40; i++) {
		$("#grupos_"+i).on("click", function() {
			for (var y=21; y<=40; y++) {
				if($("#grupos_"+y).prop('checked')){					
					grado_2++
				}else{					
					grado_2--
				}
			}			
			if(grado_2==-20){
				for (var x=11; x<=20; x++) {
					$("#materias_"+ x).attr("disabled", true);
					$("#materias_"+ x).prop('checked', false);
				}

			}else{
				for (var x=11; x<=20; x++) {
					$("#materias_"+ x).attr("disabled", false);
				}
			}
			grado_2=0
		});
	}
	var  grado_3
	grado_3=0
	for (var i=41; i<=60; i++) {
		$("#grupos_"+i).on("click", function() {
			for (var y=41; y<=60; y++) {
				if($("#grupos_"+y).prop('checked')){					
					grado_3++
				}else{					
					grado_3--
				}
			}			
			if(grado_3==-20){
				for (var x=21; x<=30; x++) {
					$("#materias_"+ x).attr("disabled", true);
					$("#materias_"+ x).prop('checked', false);
				}

			}else{
				for (var x=21; x<=30; x++) {
					$("#materias_"+ x).attr("disabled", false);
				}
			}
			grado_3=0
		});
	}
	var  grado_4
	grado_4=0
	for (var i=61; i<=68; i++) {
		$("#grupos_"+i).on("click", function() {
			for (var y=61; y<=68; y++) {
				if($("#grupos_"+y).prop('checked')){					
					grado_4++
				}else{					
					grado_4--
				}
			}			
			if(grado_4==-8){
				for (var x=31; x<=40; x++) {
					$("#materias_"+ x).attr("disabled", true);
					$("#materias_"+ x).prop('checked', false);
				}

			}else{
				for (var x=31; x<=40; x++) {
					$("#materias_"+ x).attr("disabled", false);
				}
			}
			grado_4=0
		});
	}
	var  grado_5
	grado_5=0
	for (var i=69; i<=76; i++) {
		$("#grupos_"+i).on("click", function() {
			for (var y=69; y<=76; y++) {
				if($("#grupos_"+y).prop('checked')){					
					grado_5++
				}else{					
					grado_5--
				}
			}			
			if(grado_5==-8){
				for (var x=41; x<=50; x++) {
					$("#materias_"+ x).attr("disabled", true);
					$("#materias_"+ x).prop('checked', false);
				}

			}else{
				for (var x=41; x<=50; x++) {
					$("#materias_"+ x).attr("disabled", false);
				}
			}
			grado_5=0
		});
	}
	var  grado_6
	grado_6=0
	for (var i=77; i<=84; i++) {
		$("#grupos_"+i).on("click", function() {
			for (var y=77; y<=84; y++) {
				if($("#grupos_"+y).prop('checked')){					
					grado_6++
				}else{					
					grado_6--
				}
			}			
			if(grado_6==-8){
				for (var x=51; x<=60; x++) {
					$("#materias_"+ x).attr("disabled", true);
					$("#materias_"+ x).prop('checked', false);
				}

			}else{
				for (var x=51; x<=60; x++) {
					$("#materias_"+ x).attr("disabled", false);
				}
			}
			grado_6=0
		});
	}
	var  grado_7
	grado_7=0
	for (var i=85; i<=92; i++) {
		$("#grupos_"+i).on("click", function() {
			for (var y=85; y<=92; y++) {
				if($("#grupos_"+y).prop('checked')){					
					grado_7++
				}else{					
					grado_7--
				}
			}			
			if(grado_7==-8){
				for (var x=61; x<=70; x++) {
					$("#materias_"+ x).attr("disabled", true);
					$("#materias_"+ x).prop('checked', false);
				}

			}else{
				for (var x=61; x<=70; x++) {
					$("#materias_"+ x).attr("disabled", false);
				}
			}
			grado_7=0
		});
	}
	var  grado_8
	grado_8=0
	for (var i=93; i<=100; i++) {
		$("#grupos_"+i).on("click", function() {
			for (var y=93; y<=100; y++) {
				if($("#grupos_"+y).prop('checked')){					
					grado_8++
				}else{					
					grado_8--
				}
			}			
			if(grado_8==-8){
				for (var x=71; x<=81; x++) {
					$("#materias_"+ x).attr("disabled", true);
					$("#materias_"+ x).prop('checked', false);
				}

			}else{
				for (var x=71; x<=81; x++) {
					$("#materias_"+ x).attr("disabled", false);
				}
			}
			grado_8=0
		});
	}
	var  grado_9
	grado_9=0
	for (var i=101; i<=108; i++) {
		$("#grupos_"+i).on("click", function() {
			for (var y=101; y<=108; y++) {
				if($("#grupos_"+y).prop('checked')){					
					grado_9++
				}else{					
					grado_9--
				}
			}			
			if(grado_9==-8){
				for (var x=82; x<=89; x++) {
					$("#materias_"+ x).attr("disabled", true);
					$("#materias_"+ x).prop('checked', false);
				}

			}else{
				for (var x=82; x<=89; x++) {
					$("#materias_"+ x).attr("disabled", false);
				}
			}
			grado_9=0
		});
	}
});

