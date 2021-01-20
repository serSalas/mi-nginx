### Prueba 2 - Despliegue de una aplicación Django y React.js

#### Instrucciones de compilación y despliegue PC local:

1. clonar repositorio con:  *git clone https://github.com/serSalas/mi-nginx.git*
2. acceder a directorio que contenga docker-compose.yml con:  *cd Prueba_2/*
3. ejecutar el archivo de docker compose y despegarse de esta ejecución:  *docker-compose up -d*
4. al finalizar el punto anterior acceder a un navegador y acceder a *localhost:3000* para **frontend** y *localhost:8000* para **backend**.

#### Instrucciones de compilación y despliegue GCP:

1. Crear una nueva instancia de Compute Engine usando la imagen estable de Container-Optimized OS:

  a. Abrir Consola Cloud de GCP.

  b. Crear una nueva instancia de Compute Engine.

  c. Seleccionar la Zone (zona) deseada, por ejemplo us-central1-c.

  d. Seleccionar el tipo de máquina (Machine type) deseada, por ejemplo e2-medium.

  e. Cambiar el Boot disk a "Container-Optimized OS stable".

  f. Verificar que la sección de Firewall la opción de "HTTP traffic" tildada.

  g. Hacer clic en el botón "Create" para crear la instancia.

2. Habilitar los puertos necesarios para visualizar tanto Backend como Frontend:
 
  a. En la lista de MV que se encuentra en "Compute Engine > VM instances" seleccionar los detalles de la MV creada haciendo clic sobre el nombre de la instancia.
 
  b. Dirigirse a sección "Network interfaces" y hacer clic en el botón "View details". Nos dirigirá al producto VPC network.
 
  c. Dirigirse a sección Firewall and route details, seleccionar pestaña "Firewall Rules".
 
  d. Seleccionar la regla correspondiente a HTTP para nuestra instancia y editarla para que permita la conexión al puerto 3000 y 8000.

3. Descargar el código a compilar y desplegar en la instancia recién creada:
  
  a. En la lista de MV que se encuentra en "Compute Engine > VM instances" seleccionar el botón SSH para abrir una terminal conectada a la MV.
  
  b. En la terminal descargar el código con los archivos dockerfile y el docker-compose correspondiente con:  *git clone https://github.com/serSalas/mi-nginx.git*

4. Ejecutar Docker Compose:
  
  a. Descargar y ejecutar imagen de Docker Compose:  docker run docker/compose:1.24.0 version
  
  b. Asegurarse que tu ubicación sea un directorio con permisos de escritura.
  
  c. Ejeutar Docker compose del código anteriormente descargado con: 

								    *docker run --rm \\
                                                                     -v /var/run/docker.sock:/var/run/docker.sock \\
								     -v "$PWD:$PWD" \\
          							     -w= "$PWD" \\
								     docker/compose:1.24.0 up*
  
  d. Con el comando ejecutandose abrir en navegador la página *http://<IP-externa>:8000* para backend y http://<IP-externa>:3000 para frontend.

