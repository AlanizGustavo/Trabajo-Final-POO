Class {
	#name : #Listados,
	#superclass : #Ventana,
	#instVars : [
		'botonListado1',
		'botonListado2',
		'botonListado3',
		'ventanaColecciones',
		'tit1',
		'unNombre',
		'botonListadoEmp',
		'botonListadoDate'
	],
	#category : #'POOTPFinal-Visual'
}

{ #category : #initalize }
Listados >> agregarCampos [
	| fechaSeleccionada calendario |
	botonListado1 := Boton
		nombre: 'SOLICITUDES PENDENTES DE EMPRESA'
		tamanio: 350 @ 100.
	botonListado1 modalBoton.
	self addMorph: botonListado1.
	botonListado1
		left: 120;
		top: 200;
		mouseAction: [ botonListadoEmp show.
			unNombre show.
			tit1 show.
			calendario hide.
			botonListadoDate hide ].
	botonListado2 := Boton
		nombre: 'SOLICITUDES PENDIENTES EN UNA FECHA'
		tamanio: 370 @ 100.
	botonListado2 modalBoton.
	self addMorph: botonListado2.
	botonListado2
		left: botonListado1 right + 70;
		top: 200;
		mouseAction: [ unNombre hide.
			tit1 hide.
			botonListadoEmp hide.
			botonListadoDate hide.
			calendario show.
			botonListadoDate show ].
	calendario := CalendarMorph openOn: Date today.
	self addMorph: calendario.
	calendario extent: 300 @ 250.
	calendario top: 340.
	calendario left: 1000.
	botonListado3 := Boton
		nombre: 'SOLICITUDES RESUELTAS'
		tamanio: 350 @ 100.
	botonListado3 modalBoton.
	self addMorph: botonListado3.
	botonListado3
		left: botonListado2 right + 70;
		top: 200;
		mouseAction: [ unNombre hide.
			tit1 hide.
			botonListadoEmp hide.
			calendario hide.
			botonListadoDate hide.
			unGE generarListadoPropuestasAceptadas ].
	ventanaColecciones := RubScrolledTextMorph new.
	ventanaColecciones
		extent: 700 @ 400;
		beReadOnly.
	self addMorph: ventanaColecciones.
	ventanaColecciones
		top: 340;
		left: 120.
		tit1:=TextTitle crearTexto:'INGRESAR NOMBRE DE LA EMPRESA:'  tamanio: 15.
	
	self addMorph: tit1.
	tit1
		top: botonListado1 bottom + 50;
		left: ventanaColecciones right + 100.
	unNombre := RubTextFieldMorph new.
	unNombre
		ghostText: 'Ingrese Empresa';
		extent: 400 @ 150.
	self addMorph: unNombre.
	unNombre
		top: tit1 bottom + 10;
		left: ventanaColecciones right + 100.
	botonListadoEmp := Boton
		nombre: 'GENERAR LISTADO POR EMPRESA'
		tamanio: 350 @ 100.
	botonListadoEmp modalBoton.
	self addMorph: botonListadoEmp.
	botonListadoEmp
		left: ventanaColecciones right + 100;
		top: unNombre bottom + 20;
		mouseAction: [ unGE filtrarListadoEmpresa: unNombre text asString ].
	botonListadoDate := Boton
		nombre: 'GENERAR LISTADO POR FECHA'
		tamanio: 350 @ 100.
	botonListadoDate modalBoton.
	self addMorph: botonListadoDate.
	botonListadoDate
		left: ventanaColecciones right + 150;
		top: calendario bottom + 30;
		mouseAction: [ fechaSeleccionada := calendario date.
			unGE filtrarPorFecha: fechaSeleccionada ].
	botonListadoDate hide.
	calendario hide.
	botonListadoEmp hide.
	unNombre hide.
	tit1 hide.
	unGE addDependent: self
]

{ #category : #initalize }
Listados >> initialize [
	super initialize.
	self agregarCampos.
	
]

{ #category : #deAplicacion }
Listados >> update: unaCol [
	unaCol
		ifEmpty: [ ventanaColecciones setText: 'LISTADOS' ]
		ifNotEmpty: [ ventanaColecciones setText: (unGE pasaColAString: unaCol) ]
]
