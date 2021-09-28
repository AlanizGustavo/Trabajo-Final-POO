Class {
	#name : #Propuesta,
	#superclass : #Object,
	#instVars : [
		'unaSolicitud',
		'unPostulante',
		'estado'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #constructor }
Propuesta class >> crearPropuestaUnaSolicitud: unaSol unPostulante: unPostul estado: unEstado [
|unaPropuesta|
unaPropuesta :=self new.
unaPropuesta propuestaUnaSolicitud: unaSol unPostulante: unPostul estado: unEstado.
^unaPropuesta 
]

{ #category : #deAplicacion }
Propuesta >> getEstado [
^estado 
]

{ #category : #deAplicacion }
Propuesta >> getNombreEmpresa [
^unPostulante getNombre 
]

{ #category : #deAplicacion }
Propuesta >> obtenerSolicitud [
^unaSolicitud 
]

{ #category : #Inicializador }
Propuesta >> propuestaUnaSolicitud: unaSol unPostulante: unPostul estado: unEstado [
unaSolicitud :=unaSol .
unPostulante :=unPostul .
estado:=unEstado.
]

{ #category : #deAplicacion }
Propuesta >> setEstadoCompletado [
estado :='Completado'
]

{ #category : #deAplicacion }
Propuesta >> toString [
	^ unaSolicitud toString , String cr , unPostulante toString
		, String cr , estado asString,String cr.
]

{ #category : #deAplicacion }
Propuesta >> verificarEstadoCompletado [
^estado='Completado'
]

{ #category : #deAplicacion }
Propuesta >> verificarId:unId [
^unId=unaSolicitud getId.
]

{ #category : #deAplicacion }
Propuesta >> verificarPropuestaAceptada: postulanteElegido id: unId [
	^ unaSolicitud getId = unId
		& (unPostulante getNombre ~= postulanteElegido)
]
