Class {
	#name : #PEmpresa,
	#superclass : #Postulante,
	#instVars : [
		'rango',
		'tipoEmpresa'
	],
	#category : #'POOTPFinal-Logica'
}

{ #category : #constructor }
PEmpresa class >> crearEmpresaColRubros: rubros nombre: unNombre rango: unRango tipoEmpresa: unTipoEmpresa [
|unaEmpresa|
unaEmpresa := self new.
unaEmpresa empresaColRubros: rubros nombre: unNombre rango: unRango tipoEmpresa: unTipoEmpresa.
^unaEmpresa .
]

{ #category : #inicializador }
PEmpresa >> empresaColRubros: rubros nombre: unNombre rango: unRango tipoEmpresa: unTipoEmpresa [
self postulanteColRubros: rubros nombre: unNombre.
colRubros :=rubros .
tipoEmpresa :=unTipoEmpresa .
rango :=unRango  
]

{ #category : #deAplicacion }
PEmpresa >> esEmpresaCombinada [
^false
]

{ #category : #deAplicacion }
PEmpresa >> esPersona [
	^ false
]

{ #category : #deAplicacion }
PEmpresa >> obtenerRango [
^rango 
]

{ #category : #deAplicacion }
PEmpresa >> toString [
	| toString |
	toString := super toString.
	^ toString , 'Rango: ' , rango asString , String cr , 'Tipo Empresa: '
		, tipoEmpresa , String cr
]

{ #category : #deAplicacion }
PEmpresa >> verificarCompetenciaEmpresa: tipoServicio [

	^ tipoServicio = tipoEmpresa
]
