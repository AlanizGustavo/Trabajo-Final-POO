Class {
	#name : #PEmpresaCombinada,
	#superclass : #PEmpresa,
	#instVars : [
		'colProductos'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #constructor }
PEmpresaCombinada class >> crearEmpresaCombinadaColRubros: rubros nombre: unNombre rango: unRango tipoEmpresa: unTipoEmpresa colProductos: productos [
|unaEmpresaCombinada|
unaEmpresaCombinada :=self new.
unaEmpresaCombinada empresaCombinadaColRubros: rubros nombre: unNombre rango: unRango tipoEmpresa: unTipoEmpresa colProductos: productos.
^unaEmpresaCombinada 
]

{ #category : #Inicializador }
PEmpresaCombinada >> empresaCombinadaColRubros: rubros nombre: unNombre rango: unRango tipoEmpresa: unTipoEmpresa colProductos: productos [.
self empresaColRubros: rubros nombre: unNombre   rango: unRango  tipoEmpresa: unTipoEmpresa.
colProductos :=productos.  
]

{ #category : #deAplicacion }
PEmpresaCombinada >> esEmpresaCombinada [
^true
]

{ #category : #deAplicacion }
PEmpresaCombinada >> toString [
	| toString |
	toString := super toString.
	^ toString , 'Productos: ' , (self pasaColAString: colProductos)
		
]

{ #category : #deAplicacion }
PEmpresaCombinada >> verificarProductos:unaColProductosSol [
^(colProductos anySatisfy: [ :cadaProductoEmpresa | unaColProductosSol anySatisfy: [ :cadaProductoSol | cadaProductoSol = cadaProductoEmpresa] ])
]
