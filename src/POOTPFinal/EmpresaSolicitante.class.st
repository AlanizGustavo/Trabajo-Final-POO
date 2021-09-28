Class {
	#name : #EmpresaSolicitante,
	#superclass : #Object,
	#instVars : [
		'colSolicitudes',
		'unaEmpresa'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #constructor }
EmpresaSolicitante class >> crearSolicitanteUnaEmpresa: empresa [
	| unaEmpresaSolicitante |
	unaEmpresaSolicitante := self new.
	unaEmpresaSolicitante empresaSolicitanteUnaEmpresa: empresa.
	^ unaEmpresaSolicitante
]

{ #category : #deAplicacion }
EmpresaSolicitante >> asString [
	unaEmpresa toString 
]

{ #category : #Solicitudes }
EmpresaSolicitante >> crearSolicitudDescripcion: unaDescripcion [
	| unaSolicitudTrabajo |
	unaSolicitudTrabajo := DeTrabajo
		crearSolicitudTrabajoDescripcion: unaDescripcion.
		colSolicitudes add: unaSolicitudTrabajo. 
	^ unaSolicitudTrabajo
]

{ #category : #Solicitudes }
EmpresaSolicitante >> crearSolicitudDescripcion: unaDescripcion valorServicio: unValorServicio 
tipoPago: unTipoPago duracion: unTiempo tipoServicio: unTipoServicio [ 
| unaSolicitudTrabajo |
	unaSolicitudTrabajo := DeServicio crearSolicitudServicioDescripcion: unaDescripcion  valorServicio: unValorServicio  tipoServicio: unTipoServicio tipoPago:unTipoPago   duracion: unTiempo.  
	colSolicitudes add: unaSolicitudTrabajo.
	^ unaSolicitudTrabajo
]

{ #category : #Solicitudes }
EmpresaSolicitante >> crearSolicitudDescripcion: unaDescripcion valorServicio: unValorServicio tipoPago: unTipoPago duracion: unTiempo tipoServicio: unTipoServicio nomProductos: unaColProductos [ 
| unaSolicitudTrabajo |
	unaSolicitudTrabajo := DeProductoIncluido crearSolicitudProductoDescripcion: unaDescripcion  valorServicio: unValorServicio  tipoServicio: unTipoServicio tipoPago: unTipoPago  duracion: unTiempo  nombreProducto: unaColProductos. 
	colSolicitudes add: unaSolicitudTrabajo.
	^ unaSolicitudTrabajo
]

{ #category : #Inicializador }
EmpresaSolicitante >> empresaSolicitanteUnaEmpresa: empresa [
	unaEmpresa := empresa.
	colSolicitudes := SortedCollection
		sortUsing:
			[ :solicitud1 :solicitud2 | solicitud1 getFecha isOnOrBefore: solicitud2 getFecha ]
]

{ #category : #deAplicacion }
EmpresaSolicitante >> escribir [
	^ unaEmpresa toString
]

{ #category : #deAplicacion }
EmpresaSolicitante >> filtrarSolicitudes [
	| colFiltrada |
	colFiltrada := colSolicitudes
		select: [ :cadaSolicitud | cadaSolicitud verificarEstado ].
	^ colFiltrada
]

{ #category : #deAplicacion }
EmpresaSolicitante >> getNombre [
^unaEmpresa getNombre
]

{ #category : #deAplicacion }
EmpresaSolicitante >> obtenerSolicitud [ 
^colSolicitudes 
]

{ #category : #deAplicacion }
EmpresaSolicitante >> toString [
	^ unaEmpresa toString
]

{ #category : #deAplicacion }
EmpresaSolicitante >> verificarEmpresa: unNombre [
	
	^ unaEmpresa getNombre = unNombre
]

{ #category : #deAplicacion }
EmpresaSolicitante >> verificarNombre:unNombre [
^unaEmpresa getNombre = unNombre.
]

{ #category : #deAplicacion }
EmpresaSolicitante >> verificarPostulante: postul solicitud: unaSolicitud [
	| resultado |
	resultado :=false.
	unaEmpresa getNombre = postul getNombre
		ifTrue: [ resultado := colSolicitudes
				anySatisfy: [ :cadaSolicitud | cadaSolicitud getId = unaSolicitud getId ] ].
	^ resultado
]
