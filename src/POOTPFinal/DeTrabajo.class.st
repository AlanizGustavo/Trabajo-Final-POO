Class {
	#name : #DeTrabajo,
	#superclass : #Solicitud,
	#category : #'POOTPFinal-Logica'
}

{ #category : #constructor }
DeTrabajo class >> crearSolicitudTrabajoDescripcion: unaDescripcion [
|unaSolTrabajo|
unaSolTrabajo := self new.
unaSolTrabajo solicitudTrabajoDescripcion: unaDescripcion.
^unaSolTrabajo 
]

{ #category : #Inicializador }
DeTrabajo >> solicitudTrabajoDescripcion: unaDescripcion [
self solicitudDescripcion: unaDescripcion.
]

{ #category : #deAplicacion }
DeTrabajo >> verificarIdoneidad: unPostul unGestor: unGE [
	| verificarPersona |
	verificarPersona:=false.
	(super verificarIdoneidad: unPostul unGestor: unGE)
		ifTrue: [ verificarPersona := unPostul esPersona ].
	^ verificarPersona
]
