Class {
	#name : #VentanaGeneral,
	#superclass : #Ventana,
	#instVars : [
		'unNombre',
		'checkProducto1',
		'checkProducto2',
		'checkProducto3',
		'checkRubro1',
		'checkRubro2',
		'checkRubro3',
		'desplegable1',
		'desplegable2',
		'ventanaColecciones'
	],
	#category : #'POOTPFinal-Visual'
}

{ #category : #deAplicacion }
VentanaGeneral >> agregarCampos [
	| tit1 tit2 tit3 tit4 tit5 |
	tit1 := TextTitle
		crearTexto: 'INGRESAR NOMBRE DE LA EMPRESA:'
		tamanio: 15.
	self addMorph: tit1.
	tit1
		top: 200;
		left: 100.
	unNombre := RubTextFieldMorph new.
	unNombre
		ghostText: 'Ingrese Empresa';
		extent: 400 @ 150.
	self addMorph: unNombre.
	unNombre
		top: tit1 bottom + 10;
		left: 100.
	tit2 := TextTitle crearTexto: 'SELECCIONE PRODUCTOS' tamanio: 15.
	self addMorph: tit2.
	tit2
		top: unNombre bottom + 20;
		left: 100.
	checkProducto1 := CheckboxMorph new.
	checkProducto1
		label: 'Lana';
		extent: 100 @ 10.
	self addMorph: checkProducto1.
	checkProducto1
		top: tit2 bottom + 10;
		left: 100.
	checkProducto2 := CheckboxMorph new.
	checkProducto2
		label: 'Pelotas';
		extent: 100 @ 10.
	self addMorph: checkProducto2.
	checkProducto2
		top: tit2 bottom + 10;
		left: checkProducto1 right + 20.
	checkProducto3 := CheckboxMorph new.
	checkProducto3
		label: 'Ladrillos';
		extent: 100 @ 10.
	self addMorph: checkProducto3.
	checkProducto3
		top: tit2 bottom + 10;
		left: checkProducto2 right + 20.
	tit3 := TextTitle crearTexto: 'A QUE RUBRO PERTENECE' tamanio: 15.
	self addMorph: tit3.
	tit3
		top: checkProducto3 bottom + 20;
		left: 100.
	checkRubro1 := CheckboxMorph new.
	checkRubro1
		label: 'Electricidad';
		extent: 100 @ 10.
	self addMorph: checkRubro1.
	checkRubro1
		top: tit3 bottom + 10;
		left: 100.
	checkRubro2 := CheckboxMorph new.
	checkRubro2
		label: 'Construccion';
		extent: 100 @ 10.
	self addMorph: checkRubro2.
	checkRubro2
		top: tit3 bottom + 10;
		left: checkRubro1 right + 20.
	checkRubro3 := CheckboxMorph new.
	checkRubro3
		label: 'Electronica';
		extent: 100 @ 10.
	self addMorph: checkRubro3.
	checkRubro3
		top: tit3 bottom + 10;
		left: checkRubro2 right + 20.
	tit4 := TextTitle
		crearTexto: 'SELECCIONE TIPO DE EMPRESA'
		tamanio: 15.
	self addMorph: tit4.
	tit4
		top: checkRubro1 bottom + 20;
		left: 100.
	desplegable1 := SearchMorph new.
	desplegable1 content: 'SERVICIO PUNTUAL'.
	desplegable1 content: 'SERVICIO UNIFORME'.
	self addMorph: desplegable1.
	desplegable1
		top: tit4 bottom + 10;
		left: 100.
	tit5 := TextTitle
		crearTexto: 'SELECCIONE RANGO DE LA EMPRESA'
		tamanio: 15.
	self addMorph: tit5.
	tit5
		top: desplegable1 bottom + 20;
		left: 100.
	desplegable2 := SearchMorph new.
	desplegable2 content: '1'.
	desplegable2 content: '2'.
	desplegable2 content: '3'.
	desplegable2 content: '4'.
	desplegable2 content: '5'.
	self addMorph: desplegable2.
	desplegable2
		top: tit5 bottom + 10;
		left: 100.
		ventanaColecciones := RubScrolledTextMorph new.
	ventanaColecciones
		extent: 500 @ 500;
		beReadOnly.
	self addMorph: ventanaColecciones.
	ventanaColecciones
		top: 200;
		left: checkProducto3 right + 400
]

{ #category : #deAplicacion }
VentanaGeneral >> initialize [
	super initialize.
	self agregarCampos
]
