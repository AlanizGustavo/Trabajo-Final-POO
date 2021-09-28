Class {
	#name : #Switch,
	#superclass : #SimpleSwitchMorph,
	#instVars : [
		'aBlock'
	],
	#category : #'POOTPFinal-Componentes'
}

{ #category : #constructor }
Switch class >> crearSwitch: aName tamanio:unTamanio [
	| switch |
	switch := self new.
	switch inicializar: aName tamanio: unTamanio.
	^ switch
]

{ #category : #Inicializador }
Switch >> changeColor: unColor [
	label center: self center.
	label color: unColor
]

{ #category : #Inicializador }
Switch >> inicializar: aName tamanio: unTamanio [
	self
		label: aName;
		borderWidth: 2;
		useRoundedCorners;
		setBorderStyle: #complexRaised;
		addDropShadow;
		shadowColor: Color lightBlue;
		onColor: Color yellow;
		changeColor:Color black;
		extent: unTamanio
]

{ #category : #Inicializador }
Switch >> isOff [
^ color = offColor
]

{ #category : #Inicializador }
Switch >> mouseAction: aEvent [
	aBlock := aEvent
]

{ #category : #Inicializador }
Switch >> mouseUp: aEvent [
	super mouseUp: aEvent.
	aBlock value 
]
