# Trabajo-Final-POO

Enunciado

Se desea mantener la información correspondiente a una Empresa de generación de empleos y
servicios “TrabajoAr”.



TrabajoAr quiere unir a las personas/empresas que se postulan para algún trabajo o servicio, con las
empresas que están solicitando dicha postulación. Por ejemplo, “Jorge” se postula como Electricista,
y una empresa está solicitando que alguien le haga trabajos eléctricos; TrabajoAr hará la propuesta
de que “Jorge” aplique para dicha solicitud.
Para lograr lo anteriormente mencionado, se tienen los datos de las personas y empresas que se
postulan para posibles empleos o para prestar servicios.
Las personas tienen “aptitudes” (una o varias) que las definen (ej. Programación, electricidad y gas,
etc). Las empresas tienen un rubro en el que se especializan (ej. Construcción, mensajeria,
publicidad, etc).
Respecto a la prestación de servicios hay que considerar que existen 3 tipos de empresas
prestadores de servicios:

● empresas de actividades uniformes: las que ofrecen el servicio de forma continuada, por
ejemplo una empresa que realiza reparación y mantenimiento de ascensores, y es
contratada por xx años para el cliente CC.
● empresas de actividades puntuales: las que ofrecen el servicio para un momento particular
en el tiempo, por ejemplo una empresa que ofrece servicio de plomería y es contratada para
un trabajo en particular para el cliente CC.
● empresas combinadas: las que ofrecen servicios y venden productos, por ejemplo una
empresa que vende equipos de cómputo y ofrece el servicio de mantenimiento.

Además, se tiene una lista de empresas que presentan solicitudes a TrabajoAr. Esta solicitud puede
ser para encontrar un empleado o recibir la prestación de un servicio.
Las solicitudes de puestos de trabajo tienen un número identificatorio, la fecha en que se realizó y
una descripción del puesto de trabajo. Por ejemplo, hay una solicitud de “plomero” para realizar ...,
con fecha 15/08/2021 .
Para las solicitudes de servicio también se registra un número identificatorio y la fecha en que se
registro la solicitud, además de las características del servicio solicitado.
Para las solicitudes de servicios se debe saber si se requiere un servicio que se prolongue en el
tiempo o se solicita un servicio puntual. Por ejemplo:
1.- La empresa “Administración 2021” necesita contratar un servicio de “reparación y mantenimiento
de ascensores” por 3 años, que se pagará de forma mensual.
2.- La empresa “Administración 2021” necesita contratar un servicio de pintura para alguno de los
edificios que administra.
En el caso de tratarse de solicitudes para servicios prolongados, el monto indicado en la solicitud se
refiere a cada pago a realizar (mensual, anual, por vez, ...)
También es posible hacer una solicitud de producto y servicio asociado al mismo, por ejemplo la
empresa “Nuevos Tiempos” hace una solicitud que incluye una publicidad y el servicio de instalación
de carteles.
Los postulantes pueden ser empresas o personas. Por razones obvias, solo las personas pueden
postularse para las solicitudes de trabajo. Sin embargo tanto las personas como las empresas
pueden postularse para cubrir una solicitud de servicios.
Para que una postulación a una solicitud sea considerada válida debe verificarse que las aptitudes o
incumbencias del postulante sean idóneas para la tarea solicitada. En el caso de las empresas
combinadas deberá considerarse tanto el servicio como el producto que ofrecen (en el ejemplo el
producto seria “la publicidad” y el servicio “la instalación de carteles”)

Por otro lado, las empresas tienen un rango. El rango es una manera de medir si la empresa es
suficientemente grande para prestar un servicio dado y se mide en “puntos de trabajo”. Por cada
“punto de trabajo” la empresa puede comprometerse con solicitudes de MAXIMO pesos. Es decir
que si tiene 2 puntos puede tomar un trabajo de hasta 2 * MAXIMO pesos, etc. Los puntos son
enteros y el valor de cada punto es el mismo para cualquier empresa.
Las personas pueden tomar trabajos de servicios solo hasta MAXIMOINDIVIDUAL pesos, ya que si
son valores mayores se considera que el trabajo es demasiado grande para que lo haga una sola
persona.

La empresa TrabajoAr mantiene la información de las solicitudes ya resueltas por cuestiones
estadísticas. Estas solicitudes se mantienen por separado de las solicitudes pendientes, de forma de
poder trabajar sobre ellas de forma independiente.
Se pide desarrollar un sistema para la Empresa TrabajoAr. El sistema debe tener una interfaz gráfica
que permita al usuario realizar las siguientes acciones:
1. Registrar Empresas solicitantes.
2. Registrar Solicitudes.
3. Registrar Postulantes.
4. Generar propuestas para las solicitudes pendientes. El sistema deberá contemplar las
solicitudes más viejas primero y verificar que la propuesta sea válida.
5. Aceptar propuestas. Recién en este momento debe considerarse la solicitud como resuelta.
6. Realizar el control de fraude. Para evitar fraudes al fisco la empresa TrabajoAr necesita un
mecanismo para controlar que una empresa no se postule para una solicitud propia.
7. Generar listados de
a. Solicitudes pendientes realizadas por una Empresa
b. Solicitudes pendientes registradas en una fecha dada
c. Solicitudes que han sido atendidas, con toda la información correspondiente

Se debe presentar:
1) Un informe con:
a) el diagrama de clases completo utilizado y la justificación. Completar/Modificar el
diagrama de clases dado para considerar lo planteado, en caso de ser necesario.
b) diagramas de secuencia para las acciones indicadas
c) consideraciones realizadas
d) manual de usuario
2) Implementación en Pharo:
