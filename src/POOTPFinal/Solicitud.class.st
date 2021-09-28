Class {
	#name : #Solicitud,
	#superclass : #Object,
	#instVars : [
		'id',
		'descripcion',
		'fechaEmision',
		'estado'
	],
	#classVars : [
		'contId'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #setter }
Solicitud class >> setId: unValor [ 
contId :=unValor 
]

{ #category : #deAplicacion }
Solicitud >> estaPendiente [
	^ estado = 'Pendiente'
]

{ #category : #deAplicacion }
Solicitud >> getEstado [
^estado 
]

{ #category : #deAplicacion }
Solicitud >> getFecha [
^fechaEmision 
]

{ #category : #deAplicacion }
Solicitud >> getId [
^id
]

{ #category : #deAplicacion }
Solicitud >> pasaColAString: unaCol [
	^ String
		streamContents: [ :s | unaCol do: [ :each | s nextPutAll: each asString ] ]
]

{ #category : #deAplicacion }
Solicitud >> setEstadoCompletado [
	estado := 'Completado'
	
]

{ #category : #Inicializador }
Solicitud >> solicitudDescripcion: unaDescripcion [
	descripcion := unaDescripcion.
	id := contId.
	estado := 'Pendiente'.
	contId := contId + 1.
	fechaEmision := Date today
]

{ #category : #deAplicacion }
Solicitud >> toString [
	^ 'Id: ' , id asString , String cr , 'Descripcion: '
		, (self pasaColAString: descripcion) , String cr,'Fecha de Emision: '
		, fechaEmision asString , String cr , 'Estado: ' , estado asString
		, String cr
]

{ #category : #deAplicacion }
Solicitud >> verificarEstado [
^estado='Pendiente'
]

{ #category : #deAplicacion }
Solicitud >> verificarIdoneidad: cadaPostulante unGestor: unGE [
^cadaPostulante verificarRubro: descripcion.
	
]
