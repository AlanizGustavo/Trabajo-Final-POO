Class {
	#name : #Ventana,
	#superclass : #FullscreenMorph,
	#classVars : [
		'unGE'
	],
	#category : #'POOTPFinal-Visual'
}

{ #category : #constructor }
Ventana class >> titulo [
	| temp |
	temp := self new.
	temp
		initialize;
		agregarTitulo: 'GESTOR DE EMPLEO'.
	^ temp
]

{ #category : #constructor }
Ventana class >> titulo: unTitulo [
	| temp |
	temp := self new.
	temp
		initialize;
		agregarTitulo: unTitulo.
	^ temp
]

{ #category : #fondo }
Ventana >> agregarFondo [ 
| fondo |
    fondo := (Form fromFileNamed: '/Users/alanizgustavo/Desktop/POO/fondo.jpg')
                 asMorph.
    fondo basicExtent: self extent.
    self addMorphBack: fondo
]

{ #category : #Titulos }
Ventana >> agregarTitulo: unTitulo [
	| titulo |
	titulo := StringMorph new.
	titulo
		contents: unTitulo;
		color: Color black;
		font:
			(LogicalFont
				familyName: StandardFonts defaultFont familyName
				pointSize: 45);
		addDropShadow;
		shadowColor: Color lightBlue.
	self addMorphCentered: titulo.
	titulo top: 100
]

{ #category : #'as yet unclassified' }
Ventana >> cerrar [
	| botonX |
	botonX := Boton nombre: 'X' tamanio: 30 @ 30.
	self addMorph: botonX.
	botonX
		left: 20;
		top: 20;
		mouseAction: [ self delete ]
]

{ #category : #Titulos }
Ventana >> editarTexto: aText tamanio: tamanio [

aText color: Color black.

aText font:(LogicalFont familyName: StandardFonts defaultFont familyName pointSize: tamanio).
]

{ #category : #Inicializador }
Ventana >> initialize [
	super initialize.
	self agregarFondo.
	self cerrar
]
