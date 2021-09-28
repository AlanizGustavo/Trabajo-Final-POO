Class {
	#name : #RegistrarPostulante,
	#superclass : #Ventana,
	#instVars : [
		'botonPersona',
		'botonEmpresa',
		'botonEmpresaCombinada',
		'tit1',
		'unNombre',
		'tit2',
		'checkRubro1',
		'checkRubro2',
		'checkRubro3',
		'tit3',
		'unNombre2',
		'tit4',
		'desplegable1',
		'tit7',
		'checkProducto1',
		'checkProducto2',
		'checkProducto3',
		'unNombre3',
		'botonT',
		'botonSC',
		'botonS',
		'tit5',
		'desplegable2',
		'ventanaColecciones'
	],
	#category : #'POOTPFinal-Visual'
}

{ #category : #deAplicacion }
RegistrarPostulante >> agregarCampos [
	| colRub1 colRub2 colProd2 colRub3 |
	botonPersona := Boton nombre: 'POSTULANTE PERSONA' tamanio: 350 @ 100.
	botonPersona modalBoton.
	self addMorph: botonPersona.
	botonPersona
		left: 120;
		top: 200;
		mouseAction: [ self cargarCamposPersona ].
	botonEmpresa := Boton nombre: 'POSTULANTE EMPRESA' tamanio: 350 @ 100.
	botonEmpresa modalBoton.
	self addMorph: botonEmpresa.
	botonEmpresa
		left: botonPersona right + 70;
		top: 200;
		mouseAction: [ self cargarCamposEmpresa ].
	botonEmpresaCombinada := Boton
		nombre: 'POSTULANTE EMPRESA COMBINADA'
		tamanio: 350 @ 100.
	botonEmpresaCombinada modalBoton.
	self addMorph: botonEmpresaCombinada.
	botonEmpresaCombinada
		left: botonEmpresa right + 70;
		top: 200;
		mouseAction: [ self cargarCamposEmpresaCombinado ].
		tit1:= TextTitle crearTexto: 'INGRESAR NOMBRE DE LA EMPRESA/PERSONA:' tamanio: 15.
	
	self addMorph: tit1.
	tit1
		top: 350;
		left: 500.
	unNombre := RubTextFieldMorph new.
	unNombre
		ghostText: 'Ingrese NOMBRE';
		extent: 400 @ 150.
	self addMorph: unNombre.
	unNombre
		top: tit1 bottom + 10;
		left: 500.
		tit2:=TextTitle crearTexto: 'SELECCIONAR RUBROS' tamanio: 15.
	
	self addMorph: tit2.
	tit2
		top: unNombre bottom + 20;
		left: 500.
	checkRubro1 := CheckboxMorph new.
	checkRubro1
		label: 'Electricidad';
		extent: 100 @ 10.
	self addMorph: checkRubro1.
	checkRubro1
		top: tit2 bottom + 10;
		left: 500.
	checkRubro2 := CheckboxMorph new.
	checkRubro2
		label: 'Construccion';
		extent: 100 @ 10.
	self addMorph: checkRubro2.
	checkRubro2
		top: tit2 bottom + 10;
		left: checkRubro1 right + 20.
	checkRubro3 := CheckboxMorph new.
	checkRubro3
		label: 'Electronica';
		extent: 100 @ 10.
	self addMorph: checkRubro3.
	checkRubro3
		top: tit2 bottom + 10;
		left: checkRubro2 right + 20.
		tit3:=TextTitle crearTexto: 'INGRESE DNI: ' tamanio: 15.
	
	self addMorph: tit3.
	tit3
		top: checkRubro3 bottom + 20;
		left: 500.
	unNombre2 := RubTextFieldMorph new.
	unNombre2
		ghostText: 'Ingrese identificacion';
		extent: 400 @ 150.
	self addMorph: unNombre2.
	unNombre2
		top: tit3 bottom + 10;
		left: 500.
		tit4:=TextTitle crearTexto: 'SELECCIONE TIPO DE EMPRESA' tamanio: 15.
	
	self addMorph: tit4.
	tit4
		top: unNombre2 bottom + 20;
		left: 500.
	desplegable1 := SearchMorph new.
	desplegable1 content: 'SERVICIO PUNTUAL'.
	desplegable1 content: 'SERVICIO UNIFORME'.
	self addMorph: desplegable1.
	desplegable1
		top: tit4 bottom + 10;
		left: 500.
		tit5:=TextTitle crearTexto: 'SELECCIONE RANGO DE LA EMPRESA' tamanio: 15.
	
	self addMorph: tit5.
	tit5
		top: desplegable1 bottom + 20;
		left: 500.
	desplegable2 := SearchMorph new.
	desplegable2 content: '1'.
	desplegable2 content: '2'.
	desplegable2 content: '3'.
	desplegable2 content: '4'.
	desplegable2 content: '5'.
	self addMorph: desplegable2.
	desplegable2
		top: tit5 bottom + 10;
		left: 500.
		tit7:=TextTitle crearTexto: 'SELECCIONE PRODUCTOS' tamanio: 15.
	
	self addMorph: tit7.
	tit7
		top: 350;
		left: unNombre right + 50.
	checkProducto1 := CheckboxMorph new.
	checkProducto1
		label: 'Lana';
		extent: 100 @ 10.
	self addMorph: checkProducto1.
	checkProducto1
		top: tit7 bottom + 10;
		left: unNombre right + 50.
	checkProducto2 := CheckboxMorph new.
	checkProducto2
		label: 'Pelotas';
		extent: 100 @ 10.
	self addMorph: checkProducto2.
	checkProducto2
		top: tit7 bottom + 10;
		left: checkProducto1 right + 20.
	checkProducto3 := CheckboxMorph new.
	checkProducto3
		label: 'Ladrillos';
		extent: 100 @ 10.
	self addMorph: checkProducto3.
	checkProducto3
		top: tit7 bottom + 10;
		left: checkProducto2 right + 20.
	ventanaColecciones := RubScrolledTextMorph new.
	ventanaColecciones
		extent: 400 @ 400;
		beReadOnly.
	self addMorph: ventanaColecciones.
	ventanaColecciones
		top: 350;
		left: 50.
	botonS := Boton
		nombre: 'CONFIRMAR POSTULANTE EMPRESA'
		tamanio: 400 @ 100.
	botonS modalBoton.
	self addMorph: botonS.
	botonS
		left: 920;
		top: checkProducto3 bottom + 200;
		mouseAction: [ colRub1 := OrderedCollection new.
			checkRubro1 buttonMorph selected
				ifTrue: [ colRub1 add: checkRubro1 label ].
			checkRubro2 buttonMorph selected
				ifTrue: [ colRub1 add: checkRubro2 label ].
			checkRubro3 buttonMorph selected
				ifTrue: [ colRub1 add: checkRubro3 label ].
			unGE
				registrarPostulanteEmpresaRubro: colRub1
				nombre: unNombre text asString
				rango: desplegable2 selectedItem asInteger
				tipoEmpresa: desplegable1 selectedItem ].
	botonSC := Boton
		nombre: 'CONFIRMAR EMPRESA COMBINADA'
		tamanio: 450 @ 100.
	botonSC modalBoton.
	self addMorph: botonSC.
	botonSC
		left: 920;
		top: checkProducto3 bottom + 200;
		mouseAction: [ colRub2 := OrderedCollection new.
			colProd2 := OrderedCollection new.
			checkProducto1 buttonMorph selected
				ifTrue: [ colProd2 add: checkProducto1 label ].
			checkProducto2 buttonMorph selected
				ifTrue: [ colProd2 add: checkProducto2 label ].
			checkProducto3 buttonMorph selected
				ifTrue: [ colProd2 add: checkProducto3 label ].
			checkRubro1 buttonMorph selected
				ifTrue: [ colRub2 add: checkRubro1 label ].
			checkRubro2 buttonMorph selected
				ifTrue: [ colRub2 add: checkRubro2 label ].
			checkRubro3 buttonMorph selected
				ifTrue: [ colRub2 add: checkRubro3 label ].
			unGE
				registrarPostulanteEmpresaCombinadaRubro: colRub2
				nombre: unNombre text asString
				rango: desplegable2 selectedItem asInteger
				tipoEmpresa: desplegable1 selectedItem
				Producto: colProd2 ].
	botonT := Boton
		nombre: 'CONFIRMAR POSTULANTE PERSONA'
		tamanio: 400 @ 100.
	botonT modalBoton.
	self addMorph: botonT.
	botonT
		left: 920;
		top: checkProducto3 bottom + 200;
		mouseAction: [ colRub3 := OrderedCollection new.
			checkRubro1 buttonMorph selected
				ifTrue: [ colRub3 add: checkRubro1 label ].
			checkRubro2 buttonMorph selected
				ifTrue: [ colRub3 add: checkRubro2 label ].
			checkRubro3 buttonMorph selected
				ifTrue: [ colRub3 add: checkRubro3 label ].
			unGE
				registrarPostulantePersonaRubro: colRub3
				nombre: unNombre text asString
				dni: unNombre2 text asString ].
	unGE addDependent: self.
	tit1 hide.
	tit2 hide.
	tit3 hide.
	tit4 hide.
	tit5 hide.
	tit7 hide.
	checkProducto1 hide.
	checkProducto2 hide.
	checkProducto3 hide.
	checkRubro1 hide.
	checkRubro2 hide.
	checkRubro3 hide.
	unNombre hide.
	unNombre2 hide.
	desplegable1 hide.
	desplegable2 hide.
	botonS hide.
	botonSC hide.
	botonT hide
]

{ #category : #deAplicacion }
RegistrarPostulante >> cargarCamposEmpresa [
	botonS show.
	botonT hide.
	botonSC hide.
	tit1 show.
	tit2 show.
	tit3 hide.
	tit4 show.
	tit5 show.
	tit7 hide.
	checkProducto1 hide.
	checkProducto2 hide.
	checkProducto3 hide.
	checkRubro1 show.
	checkRubro2 show.
	checkRubro3 show.
	unNombre show.
	unNombre2 hide.
	desplegable1 show.
	desplegable2 show
]

{ #category : #deAplicacion }
RegistrarPostulante >> cargarCamposEmpresaCombinado [
	botonSC show.
	botonT hide.
	botonS hide.
	tit1 show.
	tit2 show.
	tit3 hide.
	tit4 show.
	tit5 show.
	tit7 show.
	checkProducto1 show.
	checkProducto2 show.
	checkProducto3 show.
	checkRubro1 show.
	checkRubro2 show.
	checkRubro3 show.
	unNombre show.
	unNombre2 hide.
	desplegable1 show.
	desplegable2 show
]

{ #category : #deAplicacion }
RegistrarPostulante >> cargarCamposPersona [
	botonT show.
	botonS hide.
	botonSC hide.
	tit1 show.
	tit2 show.
	tit3 show.
	tit4 hide.
	tit5 hide.
	tit7 hide.
	checkRubro1 show.
	checkRubro2 show.
	checkRubro3 show.
	checkProducto1 hide.
	checkProducto2 hide.
	checkProducto3 hide.
	unNombre show.
	unNombre2 show.
	desplegable1 hide.
	desplegable2 hide
]

{ #category : #deAplicacion }
RegistrarPostulante >> initialize [
	super initialize.
	self agregarCampos.
	self update: unGE obtenerColeccionPostulantes
]

{ #category : #deAplicacion }
RegistrarPostulante >> update: unaCol [
	unaCol
		ifEmpty: [ ventanaColecciones setText: 'LISTADO DE POSTULANTES' ]
		ifNotEmpty: [ ventanaColecciones setText: (unGE pasaColAString: unaCol) ]
]
