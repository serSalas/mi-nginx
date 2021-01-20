# Recomendaciones generales

Este repositorio tiene las respuestas a las tres pruebas de la PRUEBA TÉCNICA, en este directorio se encuentra:

 *  La carpeta Prueba_1 contiene la respuesta de la prueba 1
 * La carpeta Prueba_2 contiene la respuesta de la prueba 2
 * En este directorio los siguientes archivos corresponden a la respuesta de la prueba 3
   * Dockerfile
   * index.html
   * .github/workflows/action.yml

## Especificaciones de la respuesta de la Prueba 3

El archivo index.html al ser modificado y al ser subido al repositorio desencadena una serie de acciones que constituyen un pipeline de CI/CD.

Se describe a continuación las distintas etapas del pipeline:

 1. Realiza un Setup del GCloud CLI

 2. Configura docker para usar la herramienta de linea de comandos de gcloud como una credencial de ayuda para la autenticación.

 3. Construye imagen de Docker (Build).

 4. Publica imagen de Docker en repositorio (gcr.io).

 5. Despliega imagen en una instancia de Google Cloud Run de GCP permitiendo el acceso público del despliegue.

Para este caso, se puede revisar el deployment desde https://careful-ensign-302119-sqkamrdv4a-uc.a.run.app/ .


Observaciones: las variables de entorno se define una parte dentro del archivo action.yml y otra desde los secrets de github.

 
