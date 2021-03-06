### Prueba 1 Diagrama de Red:

En el diagrama se verifica que los usuarios se conectan a Internet y mediante la puerta de enlace se conectan a los servicios de la **aplicació en JS**. Para conectarse a la aplicación se coloca primeramente **Amazon Route 53** para mapear el DNS del **ELB (Elastic Load Balancer)** a una IP pública que los usuarios puedan usar como alias para navegar a la aplicación. Luego se coloca el **ELB** que debe crearse con una regla que indique  que cualquier tráfico de internet en el puerto *80/443* debe redireccionarlo al *grupo de Autoescalado* que debe estar escuchando solo en esos puertos.

Para el proceso de **autoescalado** se requiere tener un snapshot de la instancia requerida que contenga la *aplicación de JS*. Se crea una **Amazon Machine Image (AMI)** a partir del snapshot. Se crea una configuración de lanzamiento en la AMI para asegurarse de que el *grupo de autoescalado* siempre tomará esta configuración para generar una instancia.

Se crea un **grupo de autoescalado** basado en la configuración de lanzamiento mencionada. En esto lo importante son las zonas de disponibilidad en las que se lanzan las instancias y la **VPC (Virtual Private Cloud)**. Se crea este grupo de manera que habrá una *VPC* que tendrá dos subredes y cada instancia que se lance lo hará *alternativamente* en las **zonas de disponibilidad** generando asi el cumplimiento de *HA*.

Los *grupos de seguridad* de cada una de estas instancias de AWS deben asegurarse de que acepten solicitudes del *ELB* y tambien a **las bases de datos** que consumen, tanto la **Relacional** y la **No Relacional**.

En cuanto a **los microservicios externos** a AWS de la Base de Datos Relacional y No Relacional deben configurarse para que consuman los servicios internos de AWS. Es decir, que debe asegurarse que cada uno de estos microservicios *a nivel de redes* puede tener habilitado el **tráfico saliente y no solo el entrante**.

Por otro lado se usa **SNS (Servicio de Notificación Simple)** que debe estar subscripto de tal modo que cree alarmas de manera que si la utilización colectiva de CPU de las instancias es superior al 75%, se lanzan una o más instancias para manejar la carga de manera efectiva. Y será necesario tambié que exista una política de reducción de escala que dice que si la utilización colectiva de la CPU es inferior al 10%, se eliminarán una o más instancias del entorno de producción hasta que esta condición falle o alcance el límite deseado.
