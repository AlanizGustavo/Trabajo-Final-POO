Class {
	#name : #GenerarPropuestas,
	#superclass : #Ventana,
	#instVars : [
		'ventanaColecciones',
		'botonP'
	],
	#category : #'POOTPFinal-Visual'
}

{ #category : #deAplicacion }
GenerarPropuestas >> agregarCampos [
	ventanaColecciones := RubScrolledTextMorph new.
	ventanaColecciones
		extent: 700 @ 400;
		beReadOnly.
	self addMorph: ventanaColecciones.
	ventanaColecciones
		top: 200;
		left: 375.
	botonP := Boton nombre: 'GENERAR PROPUESTAS' tamanio: 400 @ 100.
	botonP modalBoton.
	self addMorph: botonP.
	botonP
		left: 500;
		top: ventanaColecciones bottom + 40;
		mouseAction: [ unGE generarPropuestas ].
	unGE addDependent: self
]

{ #category : #initialize }
GenerarPropuestas >> initialize [
	super initialize.
	self agregarCampos.
	self update: unGE obtenerColeccionPropuestas
]

{ #category : #deAplicacion }
GenerarPropuestas >> update: unaCol [
	unaCol
		ifEmpty: [ ventanaColecciones setText: 'LISTADO DE PROPUESTAS' ]
		ifNotEmpty: [ ventanaColecciones setText: (unGE pasaColAString: unaCol) ]
]
