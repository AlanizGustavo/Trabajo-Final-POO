Class {
	#name : #DeProductoIncluido,
	#superclass : #DeServicio,
	#instVars : [
		'colProductos'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #constructor }
DeProductoIncluido class >> crearSolicitudProductoDescripcion: unaDescripcion valorServicio: unMonto tipoServicio: unTipoServicio tipoPago: unTipoPago duracion: unTiempo nombreProducto: unosProducto [
|unaSolProducto|
unaSolProducto := self new.
unaSolProducto solicitudProductoDescripcion: unaDescripcion valorServicio: unMonto tipoServicio: unTipoServicio tipoPago: unTipoPago duracion: unTiempo nombreProducto: unosProducto.
^unaSolProducto 
]

{ #category : #Inicializador }
DeProductoIncluido >> solicitudProductoDescripcion: unaDescripcion valorServicio: unMonto tipoServicio: unTipoServicio tipoPago: unTipoPago duracion: unTiempo nombreProducto: unosProducto [
self solicitudServicioDescripcion: unaDescripcion  valorServicio: unMonto   tipoServicio: unTipoServicio  tipoPago: unTipoPago  duracion: unTiempo.
colProductos :=unosProducto  
]

{ #category : #deAplicacion }
DeProductoIncluido >> toString [ 
|string|
string:=super toString .
^string,'Productos: ',(self pasaColAString: colProductos)
]

{ #category : #deAplicacion }
DeProductoIncluido >> verificarIdoneidad: unPostul unGestor: unGE [
	| validada |
	validada := false.
	
	unPostul esEmpresaCombinada
		ifTrue: [ (unPostul verificarRubro: descripcion)
				ifTrue: [ (unPostul verificarProductos: colProductos)
						ifTrue: [ validada := self verificarControlEmpresa: unPostul gestor: unGE ] ] ].
	^ validada
]
