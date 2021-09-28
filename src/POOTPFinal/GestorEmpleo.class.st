Class {
	#name : #GestorEmpleo,
	#superclass : #Object,
	#instVars : [
		'colPropuestas',
		'colPostulantes',
		'colEmpresasSolicitantes',
		'valorServicioMaximoPersona',
		'valorServicioPorPunto',
		'colSolicitudesResueltas',
		'colSolicitudesPendientes'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #constructor }
GestorEmpleo class >> crearGEValorServicioMaximoPersona: unValorServicioPersona valorServicioPorPunto: unValorPorPuntos [
	| unGestor |
	unGestor := self new.
	unGestor
		GEValorServicioMaximoPersona: unValorServicioPersona
		valorServicioPorPunto: unValorPorPuntos.
	^ unGestor
]

{ #category : #Inicializador }
GestorEmpleo >> GEValorServicioMaximoPersona: unValorServicioPersona valorServicioPorPunto: unValorPorPuntos [
	valorServicioMaximoPersona := unValorServicioPersona.
	valorServicioPorPunto := unValorPorPuntos.
	colEmpresasSolicitantes := OrderedCollection new.
	colPostulantes := OrderedCollection new.
	colPropuestas := OrderedCollection new.
	colSolicitudesPendientes := SortedCollection
		sortUsing:
			[ :solicitud1 :solicitud2 | solicitud1 getFecha isOnOrBefore: solicitud2 getFecha ].
	colSolicitudesResueltas := OrderedCollection new.
	Solicitud setId: 1.
]

{ #category : #propuesta }
GestorEmpleo >> aceptarPropuestas: unId [
	| propuestasFiltradas propuestasFiltradasPorPostulante |
	propuestasFiltradas := colPropuestas
		select: [ :cadaPropuesta | cadaPropuesta verificarId: unId ].
	propuestasFiltradasPorPostulante := propuestasFiltradas
		collect: [ :cadaPropuesta | cadaPropuesta getNombreEmpresa ].
	^ propuestasFiltradasPorPostulante
]

{ #category : #propuesta }
GestorEmpleo >> actualizarColeccionesPostulanteSeleccionado: postulanteElegido id: unId [
	| propuestaAceptada unaSolicitud pos |
	colPropuestas
		removeAllSuchThat:
			[ :cadaPropuesta | cadaPropuesta verificarPropuestaAceptada: postulanteElegido id: unId ].
	propuestaAceptada := colPropuestas
		detect: [ :cadaPropuesta | cadaPropuesta verificarId: unId ].
	propuestaAceptada setEstadoCompletado.
	unaSolicitud := propuestaAceptada obtenerSolicitud.
	unaSolicitud setEstadoCompletado.
	pos := colSolicitudesPendientes indexOf: unaSolicitud.
	colSolicitudesPendientes removeAt: pos.
	colSolicitudesResueltas add: unaSolicitud.
	self changed: colPropuestas
]

{ #category : #propuesta }
GestorEmpleo >> buscarPostulante: cadaSolicitud [
	| idoneo |
	idoneo := colPostulantes
		select:
			[ :cadaPostulante | cadaSolicitud verificarIdoneidad: cadaPostulante unGestor: self ].
		
	^ idoneo
]

{ #category : #'empresa Solicitante' }
GestorEmpleo >> crearEmpresaSolicitante: unaColRubros Nombre: unNombre rango: unRango producto: unProducto tipoEmpresa: unTipoEmpresa [
	| unaEmpresaParaSolicitante unaEmpresaSolicitante |
	unProducto
		ifEmpty: [ unaEmpresaParaSolicitante := PEmpresa
				crearEmpresaColRubros: unaColRubros
				nombre: unNombre
				rango: unRango
				tipoEmpresa: unTipoEmpresa ]
		ifNotEmpty: [ unaEmpresaParaSolicitante := PEmpresaCombinada
				crearEmpresaCombinadaColRubros: unaColRubros
				nombre: unNombre
				rango: unRango
				tipoEmpresa: unTipoEmpresa
				colProductos: unProducto ].
	unaEmpresaSolicitante := EmpresaSolicitante
		crearSolicitanteUnaEmpresa: unaEmpresaParaSolicitante.
	colPostulantes add: unaEmpresaParaSolicitante.
	colEmpresasSolicitantes add: unaEmpresaSolicitante.
	colEmpresasSolicitantes changed.
	^ nil
]

{ #category : #'empresa Solicitante' }
GestorEmpleo >> filtrarListadoEmpresa: unNombre [
	| empresaSolicitante solicitudesFiltradas |
	empresaSolicitante := colEmpresasSolicitantes
		detect:
			[ :cadaEmpresaSolicitante | cadaEmpresaSolicitante verificarNombre: unNombre ]
		ifNone: [ nil ].
	empresaSolicitante
		ifNotNil: [ solicitudesFiltradas := empresaSolicitante filtrarSolicitudes ].
	self changed: solicitudesFiltradas
]

{ #category : #Solicitudes }
GestorEmpleo >> filtrarPorFecha: unaFecha [ 
    | colFiltrada |
    colFiltrada := colSolicitudesPendientes select: [ :cadaSolicitud | 
               cadaSolicitud getFecha equals: unaFecha ].
    
    self changed: colFiltrada .

]

{ #category : #deAplicacion }
GestorEmpleo >> generarListadoPropuestasAceptadas [
	| colPropuestasCompletadas |
	colPropuestasCompletadas := colPropuestas
		select: [ :cadaPropuesta | cadaPropuesta verificarEstadoCompletado ].
	self changed: colPropuestasCompletadas
]

{ #category : #propuesta }
GestorEmpleo >> generarPropuestas [
	| postul unaPropuesta |
	colSolicitudesPendientes
		do: [ :cadaSolicitud | 
			postul := self buscarPostulante: cadaSolicitud.
			postul
				ifNotEmpty: [ postul
						do: [ :cadaPostul | 
							unaPropuesta := Propuesta
								crearPropuestaUnaSolicitud: cadaSolicitud
								unPostulante: cadaPostul
								estado: 'Pendiente'.
							(self hayFraude: cadaSolicitud postulante: cadaPostul)
								ifFalse: [ colPropuestas add: unaPropuesta ] ] ] ].
	self changed: colPropuestas
]

{ #category : #propuesta }
GestorEmpleo >> hayFraude: unaSolicitud postulante: postul [
	^ colEmpresasSolicitantes
		anySatisfy: [ :cadaEmpresaSolicitante | 
			cadaEmpresaSolicitante
				verificarPostulante: postul
				solicitud: unaSolicitud ]
]

{ #category : #deAplicacion }
GestorEmpleo >> listadoSolicitudesResueltas [
self changed: colSolicitudesResueltas 
]

{ #category : #'empresa Solicitante' }
GestorEmpleo >> nuevaEmpresaSolicitanteRubros: unaColRubros nombre: unNombre rango: unRango producto: unProducto tipoEmpresa: unTipoEmpresa [
	| postul unaEmpresaSolicitante |
	postul := colPostulantes
		detect: [ :cadaPostulante | cadaPostulante getNombre = unNombre ]
		ifNone: [ self
				crearEmpresaSolicitante: unaColRubros
				Nombre: unNombre
				rango: unRango
				producto: unProducto
				tipoEmpresa: unTipoEmpresa ].
	postul
		ifNotNil: [ unaEmpresaSolicitante := EmpresaSolicitante
				crearSolicitanteUnaEmpresa: postul.
			colEmpresasSolicitantes add: unaEmpresaSolicitante.
			colEmpresasSolicitantes changed ]
]

{ #category : #'empresa Solicitante' }
GestorEmpleo >> obtenerColeccion [
^colEmpresasSolicitantes 
]

{ #category : #Postulantes }
GestorEmpleo >> obtenerColeccionPostulantes [
^colPostulantes 
]

{ #category : #propuesta }
GestorEmpleo >> obtenerColeccionPropuestas [
^colPropuestas 
]

{ #category : #Solicitudes }
GestorEmpleo >> obtenerColeccionSolPen [
^colSolicitudesPendientes 
]

{ #category : #deAplicacion }
GestorEmpleo >> pasaColAString: unaCol [
	^ String
		streamContents: [ :s | unaCol do: [ :each | s nextPutAll: each toString ] ]
]

{ #category : #'empresa Solicitante' }
GestorEmpleo >> registrarEmpresaSolicitante: unaColRubros nombre: unNombre rango: unRango colProductos: unProducto tipoEmpresa: unTipoEmpresa [
	(colEmpresasSolicitantes
		anySatisfy: [ :cadaEmpresa | cadaEmpresa verificarEmpresa: unNombre ])
		
		ifFalse: [ self
				nuevaEmpresaSolicitanteRubros: unaColRubros
				nombre: unNombre
				rango: unRango
				producto: unProducto
				tipoEmpresa: unTipoEmpresa ].
	self changed: colEmpresasSolicitantes
]

{ #category : #Postulantes }
GestorEmpleo >> registrarPostulanteEmpresaCombinadaRubro: unRubro nombre: unNombre rango: unRango tipoEmpresa: unTipoEmpresa Producto: unosProductos [
	|  unaEmpresaCombinada |
	
	(colPostulantes anySatisfy: [ :postul | postul getNombre = unNombre ])
		
		ifFalse: [ unaEmpresaCombinada := PEmpresaCombinada
				crearEmpresaCombinadaColRubros: unRubro
				nombre: unNombre
				rango: unRango
				tipoEmpresa: unTipoEmpresa
				colProductos: unosProductos.
			colPostulantes add: unaEmpresaCombinada ].
	self changed: colPostulantes.
	
]

{ #category : #Postulantes }
GestorEmpleo >> registrarPostulanteEmpresaRubro: unRubro nombre: unNombre rango: unRango tipoEmpresa: unTipoEmpresa [
	|  unaEmpresa |
	
	(colPostulantes anySatisfy: [ :postul | postul getNombre = unNombre ])
		
		ifFalse: [ unaEmpresa := PEmpresa
				crearEmpresaColRubros: unRubro
				nombre: unNombre
				rango: unRango
				tipoEmpresa: unTipoEmpresa.
			colPostulantes add: unaEmpresa ].
	self changed: colPostulantes.
	
]

{ #category : #Postulantes }
GestorEmpleo >> registrarPostulantePersonaRubro: unRubro nombre: unNombre dni: unDni [
	|unaPersona |
	
	(colPostulantes anySatisfy: [ :postul | postul getNombre = unNombre ])
		
		ifFalse: [ unaPersona := PPersona
				crearPersonaColRubros: unRubro
				nombre: unNombre
				dni: unDni.
			colPostulantes add: unaPersona ].
	self changed: colPostulantes.
	
]

{ #category : #Solicitudes }
GestorEmpleo >> registrarSolicitudConProductoDescripcion: unaDescripcion nombreEmpresa: unNombre valorServicio: unValorServicio tipoPago: unTipoPago duracion: unTiempo tipoServicio: unTipoServicio nomProductos: unaColProductos [
	| unaSolicitud unaEmp |
	unaEmp := colEmpresasSolicitantes
		detect: [ :unaEmpresa | unaEmpresa getNombre = unNombre ]
		ifNone: [ nil ].
	unaEmp
		ifNotNil: [ unaSolicitud := unaEmp
				crearSolicitudDescripcion: unaDescripcion
				valorServicio: unValorServicio
				tipoPago: unTipoPago
				duracion: unTiempo
				tipoServicio: unTipoServicio
				nomProductos: unaColProductos.
			colSolicitudesPendientes add: unaSolicitud ].
	self changed: colSolicitudesPendientes
]

{ #category : #Solicitudes }
GestorEmpleo >> registrarSolicitudServicioDescripcion: unaDescripcion nombreEmpresa: unNombre valorServicio: unValorServicio tipoPago: unTipoPago duracion: unTiempo tipoServicio: unTipoServicio [
	| unaSolicitud unaEmp |
	unaEmp := colEmpresasSolicitantes
		detect: [ :unaEmpresa | unaEmpresa getNombre = unNombre ]
		ifNone: [ nil ].
	unaEmp
		ifNotNil: [ unaSolicitud := unaEmp
				crearSolicitudDescripcion: unaDescripcion
				valorServicio: unValorServicio
				tipoPago: unTipoPago
				duracion: unTiempo
				tipoServicio: unTipoServicio.
			colSolicitudesPendientes add: unaSolicitud ].
	self changed: colSolicitudesPendientes
]

{ #category : #Solicitudes }
GestorEmpleo >> registrarSolicitudTrabajoDescripcion: unaDescripcion nombreEmpresa: unNombre [
	| unaSolicitud unaEmp |
	unaEmp := colEmpresasSolicitantes
		detect: [ :unaEmpresa | unaEmpresa verificarEmpresa: unNombre ]
		ifNone: [ nil ].
	unaEmp
		ifNotNil: [ unaSolicitud := unaEmp crearSolicitudDescripcion: unaDescripcion.
			colSolicitudesPendientes add: unaSolicitud ].
	self changed: colSolicitudesPendientes
]

{ #category : #deAplicacion }
GestorEmpleo >> verificarDimensionTrabajo: valorServicio [
	^ valorServicio <= valorServicioMaximoPersona
]

{ #category : #deAplicacion }
GestorEmpleo >> verificarRango: unRango servicio: valorServicio [
^(valorServicio <(unRango * valorServicioPorPunto)) 
]
