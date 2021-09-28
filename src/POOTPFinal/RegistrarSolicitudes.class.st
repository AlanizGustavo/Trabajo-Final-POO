Class {
	#name : #RegistrarSolicitudes,
	#superclass : #Ventana,
	#instVars : [
		'botonTrabajo',
		'botonServicio',
		'botonServicioCombinado',
		'tit3',
		'checkRubro1',
		'checkRubro2',
		'checkRubro3',
		'botonT',
		'tit1',
		'unNombre',
		'tit2',
		'unNombre2',
		'tit4',
		'desplegable1',
		'tit5',
		'desplegable2',
		'tit6',
		'unNombre3',
		'tit7',
		'checkProducto1',
		'checkProducto2',
		'checkProducto3',
		'botonSC',
		'botonS',
		'ventanaColecciones',
		'botonSwitch',
		'botonSwitch2'
	],
	#category : #'POOTPFinal-Visual'
}

{ #category : #deAplicacion }
RegistrarSolicitudes >> agregarCampos [
	botonTrabajo := Boton
		nombre: 'SOLICITUD DE TRABAJO'
		tamanio: 350 @ 100.
	botonTrabajo modalBoton.
	self addMorph: botonTrabajo.
	botonTrabajo
		left: 120;
		top: 200;
		mouseAction: [ self cargarCamposTrabajo ].
	botonServicio := Boton
		nombre: 'SOLICITUD DE SERVICIO'
		tamanio: 350 @ 100.
	botonServicio modalBoton.
	self addMorph: botonServicio.
	botonServicio
		left: botonTrabajo right + 70;
		top: 200;
		mouseAction: [ self cargarCamposServicio ].
	botonServicioCombinado := Boton
		nombre: 'SOLICITUD DE SERVICIO COMBINADO'
		tamanio: 350 @ 100.
	botonServicioCombinado modalBoton.
	self addMorph: botonServicioCombinado.
	botonServicioCombinado
		left: botonServicio right + 70;
		top: 200;
		mouseAction: [ self cargarCamposServicioCombinado ].
	tit1 := TextTitle
		crearTexto: 'INGRESAR NOMBRE DE LA EMPRESA:'
		tamanio: 15.
	self addMorph: tit1.
	tit1
		top: 350;
		left: 500.
	unNombre := RubTextFieldMorph new.
	unNombre
		ghostText: 'Ingrese Empresa';
		extent: 400 @ 150.
	self addMorph: unNombre.
	unNombre
		top: tit1 bottom + 10;
		left: 500.
	tit2 := TextTitle
		crearTexto: 'SELECCIONAR DESCRIPCION EN LOS SIGUIENTES ITEMS'
		tamanio: 15.
	self addMorph: tit2.
	tit2
		top: unNombre bottom + 20;
		left: 500.
	checkRubro1 := CheckboxMorph new.
	checkRubro1
		label: 'Electricidad';
		extent: 100 @ 10.
	self addMorph: checkRubro1.
	checkRubro1
		top: tit2 bottom + 10;
		left: 500.
	checkRubro2 := CheckboxMorph new.
	checkRubro2
		label: 'Construccion';
		extent: 100 @ 10.
	self addMorph: checkRubro2.
	checkRubro2
		top: tit2 bottom + 10;
		left: checkRubro1 right + 20.
	checkRubro3 := CheckboxMorph new.
	checkRubro3
		label: 'Electronica';
		extent: 100 @ 10.
	self addMorph: checkRubro3.
	checkRubro3
		top: tit2 bottom + 10;
		left: checkRubro2 right + 20.
	tit3 := TextTitle
		crearTexto: 'INGRESAR EL VALOR DEL SERVICIO: '
		tamanio: 15.
	self addMorph: tit3.
	tit3
		top: checkRubro3 bottom + 20;
		left: 500.
	unNombre2 := RubTextFieldMorph new.
	unNombre2
		ghostText: 'Ingrese VALOR ENTERO';
		extent: 400 @ 150.
	self addMorph: unNombre2.
	unNombre2
		top: tit3 bottom + 10;
		left: 500.
	tit4 := TextTitle crearTexto: 'SELECCIONE SERVICIO' tamanio: 11.
	self addMorph: tit4.
	tit4
		top: unNombre2 bottom + 20;
		left: 500.
	botonSwitch := Switch
		crearSwitch: 'TRABAJO UNIFORME'
		tamanio: 120 @ 25.
	self addMorph: botonSwitch.
	botonSwitch
		top: tit4 bottom + 10;
		left: 500.
	botonSwitch
		mouseAction: [ botonSwitch2 isOn
				ifTrue: [ botonSwitch turnOff ].
			botonSwitch2 isOff
				ifTrue: [ unNombre3 show.
					tit6 show.
					tit5 show.
					desplegable2 show ] ].
	botonSwitch2 := Switch
		crearSwitch: 'TRABAJO PUNTUAL'
		tamanio: 120 @ 25.
	self addMorph: botonSwitch2.
	botonSwitch2
		top: botonSwitch bottom + 10;
		left: 500.
	botonSwitch2
		mouseAction: [ botonSwitch isOn
				ifTrue: [ botonSwitch2 turnOff ].
			botonSwitch isOff
				ifTrue: [ unNombre3 hide.
					tit6 hide.
					tit5 hide.
					desplegable2 hide ] ].
	tit5 := TextTitle crearTexto: 'SELECCIONE TIPO DE PAGO' tamanio: 11.
	self addMorph: tit5.
	tit5
		top: unNombre2 bottom + 20;
		left: botonSwitch right + 80.
	desplegable2 := SearchMorph new.
	desplegable2 content: 'PAGO POR DIA'.
	desplegable2 content: 'PAGO SEMANAL'.
	desplegable2 content: 'PAGO MENSUAL'.
	self addMorph: desplegable2.
	desplegable2
		top: tit5 bottom + 10;
		left: botonSwitch2 right + 80.
	tit6 := TextTitle
		crearTexto: 'INGRESAR LA DURACION DEL SERVICIO EN DIAS: '
		tamanio: 15.
	self addMorph: tit6.
	tit6
		top: botonSwitch2 bottom + 20;
		left: 500.
	unNombre3 := RubTextFieldMorph new.
	unNombre3
		ghostText: 'Ingrese VALOR ENTERO DE DIAS';
		extent: 400 @ 150.
	self addMorph: unNombre3.
	unNombre3
		top: tit6 bottom + 10;
		left: 500.
	tit7 := TextTitle crearTexto: 'SELECCIONE PRODUCTOS' tamanio: 15.
	self addMorph: tit7.
	tit7
		top: 350;
		left: unNombre right + 50.
	checkProducto1 := CheckboxMorph new.
	checkProducto1
		label: 'Lana';
		extent: 100 @ 10.
	self addMorph: checkProducto1.
	checkProducto1
		top: tit7 bottom + 10;
		left: unNombre right + 50.
	checkProducto2 := CheckboxMorph new.
	checkProducto2
		label: 'Pelotas';
		extent: 100 @ 10.
	self addMorph: checkProducto2.
	checkProducto2
		top: tit7 bottom + 10;
		left: checkProducto1 right + 20.
	checkProducto3 := CheckboxMorph new.
	checkProducto3
		label: 'Ladrillos';
		extent: 100 @ 10.
	self addMorph: checkProducto3.
	checkProducto3
		top: tit7 bottom + 10;
		left: checkProducto2 right + 20.
	ventanaColecciones := RubScrolledTextMorph new.
	ventanaColecciones
		extent: 400 @ 400;
		beReadOnly.
	self addMorph: ventanaColecciones.
	ventanaColecciones
		top: 350;
		left: 50.
	unGE addDependent: self.
	tit1 hide.
	tit2 hide.
	tit3 hide.
	tit4 hide.
	tit5 hide.
	tit6 hide.
	tit7 hide.
	checkProducto1 hide.
	checkProducto2 hide.
	checkProducto3 hide.
	checkRubro1 hide.
	checkRubro2 hide.
	checkRubro3 hide.
	unNombre hide.
	unNombre2 hide.
	unNombre3 hide.
	
	desplegable2 hide.
	botonSwitch hide.
	botonSwitch2 hide
]

{ #category : #deAplicacion }
RegistrarSolicitudes >> cargarCamposServicio [
	| colRub tipoPago duracion tipoServicio salario |
	botonS := Boton
		nombre: 'CONFIRMAR SOLICITUD DE SERVICIO'
		tamanio: 400 @ 100.
	botonS modalBoton.
	self addMorph: botonS.
	botonS
		left: 950;
		top: checkProducto3 bottom + 150;
		mouseAction: [ colRub := OrderedCollection new.
			checkRubro1 buttonMorph selected
				ifTrue: [ colRub add: checkRubro1 label ].
			checkRubro2 buttonMorph selected
				ifTrue: [ colRub add: checkRubro2 label ].
			checkRubro3 buttonMorph selected
				ifTrue: [ colRub add: checkRubro3 label ].
			botonSwitch2 isOn
				ifTrue: [ tipoPago := 'POR TRABAJO' ].
			botonSwitch isOn
				ifTrue: [ tipoPago := desplegable2 selectedItem ].
			botonSwitch2 isOn
				ifTrue: [ duracion := 0 ].
			botonSwitch isOn
				ifTrue: [ duracion := unNombre3 text asString asInteger ].
			botonSwitch2 isOn
				ifTrue: [ tipoServicio := 'SERVICIO PUNTUAL' ].
			botonSwitch isOn
				ifTrue: [ tipoServicio := 'SERVICIO UNIFORME' ].
				unNombre2 text asString asInteger
				ifNil: [ salario := 0 ]
				ifNotNil: [ salario := unNombre2 text asString asInteger ].
			unGE
				registrarSolicitudServicioDescripcion: colRub
				nombreEmpresa: unNombre text asString
				valorServicio: salario
				tipoPago: tipoPago
				duracion: duracion
				tipoServicio: tipoServicio ].
	botonT isNotNil
		ifTrue: [ botonT hide ].
	botonSC isNotNil
		ifTrue: [ botonSC hide ].
	botonSwitch turnOff.
	botonSwitch2 turnOff.
	tit1 show.
	tit2 show.
	tit3 show.
	tit4 show.
	tit5 hide.
	tit6 hide.
	tit7 hide.
	checkProducto1 hide.
	checkProducto2 hide.
	checkProducto3 hide.
	checkRubro1 show.
	checkRubro2 show.
	checkRubro3 show.
	unNombre show.
	unNombre2 show.
	unNombre3 hide.
	"desplegable1 show."
	desplegable2 hide.
	botonSwitch show.
	botonSwitch2 show
]

{ #category : #deAplicacion }
RegistrarSolicitudes >> cargarCamposServicioCombinado [
	| colRub colProd tipoPago duracion tipoServicio salario |
	botonSC := Boton
		nombre: 'CONFIRMAR SOLICITUD DE SERVICIO COMBINADO'
		tamanio: 450 @ 100.
	botonSC modalBoton.
	self addMorph: botonSC.
	botonSC
		left: 950;
		top: checkProducto3 bottom + 150;
		mouseAction: [ colRub := OrderedCollection new.
			colProd := OrderedCollection new.
			checkProducto1 buttonMorph selected
				ifTrue: [ colProd add: checkProducto1 label ].
			checkProducto2 buttonMorph selected
				ifTrue: [ colProd add: checkProducto2 label ].
			checkProducto3 buttonMorph selected
				ifTrue: [ colProd add: checkProducto3 label ].
			checkRubro1 buttonMorph selected
				ifTrue: [ colRub add: checkRubro1 label ].
			checkRubro2 buttonMorph selected
				ifTrue: [ colRub add: checkRubro2 label ].
			checkRubro3 buttonMorph selected
				ifTrue: [ colRub add: checkRubro3 label ].
			botonSwitch2 isOn
				ifTrue: [ tipoPago := 'POR TRABAJO' ].
			botonSwitch isOn
				ifTrue: [ tipoPago := desplegable2 selectedItem ].
			botonSwitch2 isOn
				ifTrue: [ duracion := 0 ].
			botonSwitch isOn
				ifTrue: [ duracion := unNombre3 text asString asInteger ].
			botonSwitch2 isOn
				ifTrue: [ tipoServicio := 'SERVICIO PUNTUAL' ].
			botonSwitch isOn
				ifTrue: [ tipoServicio := 'SERVICIO UNIFORME' ].
			
			unNombre2 text asString asInteger
				ifNil: [ salario := 0 ]
				ifNotNil: [ salario := unNombre2 text asString asInteger ].
			
			unGE
				registrarSolicitudConProductoDescripcion: colRub
				nombreEmpresa: unNombre text asString
				valorServicio: salario
				tipoPago: tipoPago
				duracion: duracion
				tipoServicio: tipoServicio
				nomProductos: colProd ].
	botonT isNotNil
		ifTrue: [ botonT hide ].
	botonS isNotNil
		ifTrue: [ botonS hide ].
	botonSwitch turnOff.
	botonSwitch2 turnOff.
	tit1 show.
	tit2 show.
	tit3 show.
	tit4 show.
	tit5 hide.
	tit6 hide.
	tit7 show.
	checkProducto1 show.
	checkProducto2 show.
	checkProducto3 show.
	checkRubro1 show.
	checkRubro2 show.
	checkRubro3 show.
	unNombre show.
	unNombre2 show.
	unNombre3 hide.
	desplegable2 hide.
	botonSwitch show.
	botonSwitch2 show
]

{ #category : #deAplicacion }
RegistrarSolicitudes >> cargarCamposTrabajo [
	| colRub |
	botonT := Boton
		nombre: 'CONFIRMAR SOLICITUD DE TRABAJO'
		tamanio: 400 @ 100.
	botonT modalBoton.
	self addMorph: botonT.
	botonT
		left: 950;
		top: checkProducto3 bottom + 150;
		mouseAction: [ colRub := OrderedCollection new.
			checkRubro1 buttonMorph selected
				ifTrue: [ colRub add: checkRubro1 label ].
			checkRubro2 buttonMorph selected
				ifTrue: [ colRub add: checkRubro2 label ].
			checkRubro3 buttonMorph selected
				ifTrue: [ colRub add: checkRubro3 label ].
			unGE
				registrarSolicitudTrabajoDescripcion: colRub
				nombreEmpresa: unNombre text asString ].
	botonS isNotNil
		ifTrue: [ botonS hide ].
	botonSC isNotNil
		ifTrue: [ botonSC hide ].
	tit1 show.
	unNombre show.
	tit2 show.
	checkRubro1 show.
	checkRubro2 show.
	checkRubro3 show.
	tit3 hide.
	tit4 hide.
	tit5 hide.
	tit6 hide.
	tit7 hide.
	checkProducto1 hide.
	checkProducto2 hide.
	checkProducto3 hide.
	unNombre2 hide.
	unNombre3 hide.
	"desplegable1 hide."
	desplegable2 hide.
	botonSwitch hide.
	botonSwitch2 hide
]

{ #category : #Inicializador }
RegistrarSolicitudes >> initialize [
	super initialize.
	self agregarCampos.
	self update: unGE obtenerColeccionSolPen 
]

{ #category : #deAplicacion }
RegistrarSolicitudes >> update: unaCol [
	unaCol
		ifEmpty: [ ventanaColecciones setText: 'LISTADO DE SOLICITUDES PENDIENTES' ]
		ifNotEmpty: [ ventanaColecciones setText: (unGE pasaColAString: unaCol) ]
]
