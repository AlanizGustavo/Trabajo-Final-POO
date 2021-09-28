Class {
	#name : #TextTitle,
	#superclass : #StringMorph,
	#category : #'POOTPFinal-Componentes'
}

{ #category : #constructor }
TextTitle class >> crearTexto: unTexto tamanio: unTamanio [
	| temp |
	temp := self new.
	temp
		inicializarTexto: unTexto tamanio:unTamanio.
	^ temp
]

{ #category : #Inicializador }
TextTitle >> inicializarTexto: unTexto tamanio: unTamanio [
	self
		contents: unTexto;
		color: Color black;
		font:
			(LogicalFont
				familyName: StandardFonts defaultFont familyName
				pointSize: unTamanio).
		
]
