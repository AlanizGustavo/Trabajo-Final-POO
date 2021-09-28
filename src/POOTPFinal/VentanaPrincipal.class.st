Class {
	#name : #VentanaPrincipal,
	#superclass : #Ventana,
	#instVars : [
		'botonSolicitante',
		'botonPostulante',
		'botonPropuesta',
		'botonSolicitud',
		'botonListados',
		'botonAceptarProp',
		'ventanaPostulante'
	],
	#category : #'POOTPFinal-Visual'
}

{ #category : #constructor }
VentanaPrincipal class >> crearVentanaPrincipal: maximoPersona valorPorPunto: valorPorRango [
	| temp |
	temp := self new.
	temp initialize: maximoPersona valorPorPuntos: valorPorRango.
	^ temp
]

{ #category : #deAplicacion }
VentanaPrincipal >> agregarCampos [
	| ventanaSolicitante ventanaSolicitudes |
	botonSolicitante := Boton
		nombre: 'AGREGAR EMPRESA SOLICITANTE'
		tamanio: 300 @ 100.
	botonSolicitante modalBoton.
	self addMorph: botonSolicitante.
	botonSolicitante
		left: 200;
		top: 300;
		mouseAction: [ ventanaSolicitante := RegistrarEmpresaSolis
				titulo: 'REGISTRAR EMPRESA SOLICITANTE'.
			self addMorphCentered: ventanaSolicitante ].
	botonPostulante := Boton
		nombre: 'AGREGAR POSTULANTE'
		tamanio: 300 @ 100.
	botonPostulante modalBoton.
	self addMorph: botonPostulante.
	botonPostulante
		left: botonSolicitante right + 70;
		top: 300;
		mouseAction: [ ventanaPostulante := RegistrarPostulante
				titulo: 'REGISTRAR POSTULANTE'.
			self addMorphCentered: ventanaPostulante ].
	botonPropuesta := Boton
		nombre: 'GENERAR PROPUESTA'
		tamanio: 300 @ 100.
	botonPropuesta modalBoton.
	self addMorph: botonPropuesta.
	botonPropuesta
		left: botonPostulante right + 70;
		top: 300;
		mouseAction: [ ventanaPostulante := GenerarPropuestas titulo: 'GENERAR PROPUESTAS'.
			self addMorphCentered: ventanaPostulante ].
	botonSolicitud := Boton
		nombre: 'GENERAR SOLICITUD'
		tamanio: 300 @ 100.
	botonSolicitud modalBoton.
	self addMorph: botonSolicitud.
	botonSolicitud
		left: 200;
		top: botonSolicitante bottom + 60;
		mouseAction: [ ventanaSolicitudes := RegistrarSolicitudes
				titulo: 'REGISTRAR SOLICITUDES'.
			self addMorphCentered: ventanaSolicitudes ].
	botonAceptarProp := Boton
		nombre: 'ACEPTAR PROPUESTA'
		tamanio: 300 @ 100.
	botonAceptarProp modalBoton.
	self addMorph: botonAceptarProp.
	botonAceptarProp
		left: botonSolicitud right + 70;
		top: botonSolicitante bottom + 60;
		mouseAction: [ ventanaSolicitudes := AceptarPropuesta titulo: 'ACEPTAR PROPUESTAS'.
			self addMorphCentered: ventanaSolicitudes ].
	botonListados := Boton nombre: 'LISTADOS' tamanio: 300 @ 100.
	botonListados modalBoton.
	self addMorph: botonListados.
	botonListados
		left: botonAceptarProp right + 70;
		top: botonSolicitante bottom + 60;
		mouseAction: [ ventanaSolicitudes := Listados titulo: 'GENERAR LISTADOS'.
			self addMorphCentered: ventanaSolicitudes  ]
]

{ #category : #Inicializador }
VentanaPrincipal >> initialize:valorMaximoPersona valorPorPuntos:valorPorRango [
	super initialize.
	self agregarCampos.
	self agregarTitulo: 'GESTOR DE EMPLEO'.
	unGE := GestorEmpleo
		crearGEValorServicioMaximoPersona: valorMaximoPersona 
		valorServicioPorPunto: valorPorRango 
]
