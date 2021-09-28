Class {
	#name : #DeServicio,
	#superclass : #Solicitud,
	#instVars : [
		'valorServicio',
		'tipoServicio',
		'tipoPago',
		'duracion'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #constructor }
DeServicio class >> crearSolicitudServicioDescripcion: unaDescripcion valorServicio: unMonto tipoServicio: unTipoServicio tipoPago: unTipoPago duracion: unTiempo [
|unaSolServ|
unaSolServ :=self new.
unaSolServ solicitudServicioDescripcion: unaDescripcion valorServicio: unMonto tipoServicio: unTipoServicio tipoPago: unTipoPago duracion: unTiempo.
^unaSolServ 
]

{ #category : #Inicializador }
DeServicio >> solicitudServicioDescripcion: unaDescripcion valorServicio: unMonto tipoServicio: unTipoServicio tipoPago: unTipoPago duracion: unTiempo [
self solicitudDescripcion: unaDescripcion .
valorServicio :=unMonto .
tipoServicio :=unTipoServicio .
tipoPago :=unTipoPago.
duracion :=unTiempo .
]

{ #category : #deAplicacion }
DeServicio >> toString [
	| string |
	string := super toString.
	^ string , 'Valor Servicio: ' , valorServicio asString , String cr
		, 'Tipo Servicio: ' , tipoServicio , String cr , 'Tipo de Pago: '
		, tipoPago , String cr , 'Duracion: ' , duracion asString , String cr
]

{ #category : #deAplicacion }
DeServicio >> verificarControlEmpresa: unPostul gestor: unGE [
	| validada unRango |
	validada:=false.
	(unPostul verificarCompetenciaEmpresa: tipoServicio)
		ifTrue: [ unRango := unPostul obtenerRango.
			validada := unGE verificarRango: unRango servicio: valorServicio ].
	^ validada
]

{ #category : #deAplicacion }
DeServicio >> verificarIdoneidad: unPostul unGestor: unGE [
	| validada |
	validada := false.
	(super verificarIdoneidad: unPostul unGestor: unGE)
		ifTrue: [ unPostul esPersona
				ifTrue: [ validada := unGE verificarDimensionTrabajo: valorServicio ]
				ifFalse: [ unPostul esEmpresaCombinada
						
						ifFalse: [ validada := self verificarControlEmpresa: unPostul gestor: unGE ] ] ].
	^ validada
]
