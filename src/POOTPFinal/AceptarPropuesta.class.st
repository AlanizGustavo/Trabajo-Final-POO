Class {
	#name : #AceptarPropuesta,
	#superclass : #Ventana,
	#instVars : [
		'ventanaColecciones',
		'botonP',
		'tit1',
		'unNombre'
	],
	#category : #'POOTPFinal-Visual'
}

{ #category : #initialize }
AceptarPropuesta >> agregarCampos [
	| propuestasFiltradasPorPostulante postulanteElegido |
	ventanaColecciones := RubScrolledTextMorph new.
	ventanaColecciones
		extent: 500 @ 500;
		beReadOnly.
	self addMorph: ventanaColecciones.
	ventanaColecciones
		top: 200;
		left: 100.
	tit1 := TextTitle
		crearTexto: 'INGRESAR EL NUMERO DE ID DE LA SOLICITUD:'
		tamanio: 15.
	self addMorph: tit1.
	tit1
		top: 200;
		left: ventanaColecciones right + 30.
	unNombre := RubTextFieldMorph new.
	unNombre
		ghostText: 'Ingrese Id';
		extent: 400 @ 150.
	self addMorph: unNombre.
	unNombre
		top: tit1 bottom + 10;
		left: ventanaColecciones right + 30.
	botonP := Boton nombre: 'VER/ACEPTAR PROPUESTA' tamanio: 300 @ 100.
	botonP modalBoton.
	self addMorph: botonP.
	botonP
		left: ventanaColecciones right + 70;
		top: unNombre bottom + 50;
		mouseAction: [ propuestasFiltradasPorPostulante:=unGE aceptarPropuestas: unNombre text asString asInteger.propuestasFiltradasPorPostulante 
		ifNotEmpty: [ postulanteElegido := UIManager default
				chooseFrom: propuestasFiltradasPorPostulante
				values: propuestasFiltradasPorPostulante.unGE actualizarColeccionesPostulanteSeleccionado:postulanteElegido id: unNombre text asString asInteger]].
	unGE addDependent: self
]

{ #category : #initialize }
AceptarPropuesta >> initialize [
	super initialize.
	self agregarCampos.
	self update: unGE obtenerColeccionPropuestas
]

{ #category : #deAplicacion }
AceptarPropuesta >> update: unaCol [
	unaCol
		ifEmpty: [ ventanaColecciones setText: 'LISTADO DE PROPUESTAS' ]
		ifNotEmpty: [ ventanaColecciones setText: (unGE pasaColAString: unaCol) ]
]
