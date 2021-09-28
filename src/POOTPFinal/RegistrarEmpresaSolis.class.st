Class {
	#name : #RegistrarEmpresaSolis,
	#superclass : #VentanaGeneral,
	#instVars : [
		'botonConfirmar'
	],
	#category : #'POOTPFinal-Visual'
}

{ #category : #deAplicacion }
RegistrarEmpresaSolis >> agregarCampos [
	| colProd colRub coleccion |
	coleccion := unGE obtenerColeccion.
	super agregarCampos.
	botonConfirmar := Boton
		nombre: 'CONFIRMAR EMPRESA SOLICITANTE'
		tamanio: 350 @ 100.
	botonConfirmar modalBoton.
	self addMorph: botonConfirmar.
	unGE addDependent: self.
	botonConfirmar
		left: 120;
		top: desplegable2 bottom + 40;
		mouseAction: [ colProd := OrderedCollection new.
			colRub := OrderedCollection new.
			checkRubro1 buttonMorph selected
				ifTrue: [ colRub add: checkRubro1 label ].
			checkRubro2 buttonMorph selected
				ifTrue: [ colRub add: checkRubro2 label ].
			checkRubro3 buttonMorph selected
				ifTrue: [ colRub add: checkRubro3 label ].
			checkProducto1 buttonMorph selected
				ifTrue: [ colProd add: checkProducto1 label ].
			checkProducto2 buttonMorph selected
				ifTrue: [ colProd add: checkProducto2 label ].
			checkProducto3 buttonMorph selected
				ifTrue: [ colProd add: checkProducto3 label ].
			unGE
				registrarEmpresaSolicitante: colRub
				nombre: unNombre text asString
				rango: desplegable2 selectedItem asInteger
				colProductos: colProd
				tipoEmpresa: desplegable1 selectedItem ]
]

{ #category : #deAplicacion }
RegistrarEmpresaSolis >> initialize [
	super initialize.
	self agregarCampos.
	self update: unGE obtenerColeccion.
]

{ #category : #updating }
RegistrarEmpresaSolis >> update: unaCol [
	unaCol
		ifEmpty: [ ventanaColecciones setText: 'LISTADO DE EMPRESAS SOLICITANTES' ]
		ifNotEmpty: [ ventanaColecciones setText: (unGE pasaColAString: unaCol) ]
]
