Class {
	#name : #Postulante,
	#superclass : #Object,
	#instVars : [
		'colRubros',
		'nombre'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #'de aplicacion' }
Postulante >> getNombre [
	
	^ nombre
]

{ #category : #'as yet unclassified' }
Postulante >> pasaColAString: unaCol [
	^ String
		streamContents: [ :s | unaCol do: [ :each | s nextPutAll: each asString ] ]
]

{ #category : #Inicializador }
Postulante >> postulanteColRubros: rubros nombre: unNombre [
colRubros :=rubros .
nombre :=unNombre .

]

{ #category : #'de aplicacion' }
Postulante >> toString [
	^ 'Nombre: ' , nombre , String cr , 'Rubros: '
		, (self pasaColAString: colRubros) .
]

{ #category : #'de aplicacion' }
Postulante >> verificarRubro: unaDescripcion [
	^ unaDescripcion
		allSatisfy: [ :cadaDescripcion | 
			colRubros
				anySatisfy: [ :cadaRubro | cadaDescripcion = cadaRubro ] ]
]
