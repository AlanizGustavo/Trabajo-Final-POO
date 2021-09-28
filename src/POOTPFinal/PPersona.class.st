Class {
	#name : #PPersona,
	#superclass : #Postulante,
	#instVars : [
		'dni'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #constructor }
PPersona class >> crearPersonaColRubros: rubros nombre: unNombre dni: unDni [
|unaPersona|
unaPersona := self new.
unaPersona personaColRubros: rubros nombre: unNombre dni: unDni.
^unaPersona .
]

{ #category : #deAplicacion }
PPersona >> esEmpresaCombinada [ 
^false
]

{ #category : #deAplicacion }
PPersona >> esPersona [
^true
]

{ #category : #Inicializador }
PPersona >> personaColRubros: rubros nombre: unNombre dni:unDni [
	self postulanteColRubros: rubros nombre:unNombre.
	dni:=unDni . 
]

{ #category : #deAplicacion }
PPersona >> toString [ 
|string|
string:=super toString .
^string,'Dni: ',dni,String cr.
]
