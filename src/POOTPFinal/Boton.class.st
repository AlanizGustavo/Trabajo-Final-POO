Class {
	#name : #Boton,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'aBlock'
	],
	#category : #'POOTPFinal-Componentes'
}

{ #category : #constructor }
Boton class >> nombre: unNombre tamanio: unTamanio [
	| temp |
	temp := self new.
	temp initializeButton: unNombre tamanio: unTamanio.
	^ temp
]

{ #category : #accessing }
Boton >> centerText [
label center: self center.
]

{ #category : #deAplicacion }
Boton >> changeColor: unColor [
  label center: self center.
	label color: unColor.
]

{ #category : #accessing }
Boton >> font: aFont [

    label font: aFont
]

{ #category : #inicializador }
Boton >> initializeButton: aName tamanio: unTamanio [
	self
		label: aName;
		color: Color black;
		useGradientFill;
		borderWidth: 2;
		useRoundedCorners;
		changeColor: Color black;
		setBorderStyle: #complexRaised;
		addDropShadow;
		shadowColor: Color lightBlue ;
		extent: unTamanio
]

{ #category : #inicializador }
Boton >> modalBoton [

    label
        font: (LogicalFont
                 familyName: StandardFonts defaultFont familyName
                 pointSize: 15);
        center: self center
]

{ #category : #deAplicacion }
Boton >> mouseAction: aEvent [
	aBlock := aEvent
]

{ #category : #'event handling' }
Boton >> mouseUp: aEvent [

    super mouseUp: aEvent.
    aBlock value
]
