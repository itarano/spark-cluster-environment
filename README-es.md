# spark-cluster-environment

[English](./README.md) | Español

### Introducción
El objetivo de este proyecto es desplegar un entorno de desarrollo local utilizando contenedores (docker-compose) para crear un cluster de Apache Spark y desplegar y testear los desarrollos en el mismo.

### Despliegue del entorno
Como viene siendo habitual en este tipo de entornos, sencillamente hacemos *make up* o *docker-compose up*, que se encarga de crear y desplegar los contenedores en una red local.

### Ejemplo
En la carpeta **projects** tenemos un ejemplo típico para contar palabras de un texto (PySpark) y un ejemplo típico de cálculo de *pi* con scala. 

Para ejecutar el proyecto **python/word-count**, hacemos *make submit-python-counter-job*. Ejecutando dicho script, por un lado se despliega el job de python asociado *counter.py* en el contenedor master de spark y por otro, se ejecuta el mismo, de tal forma que podemos ver los resultados del conteo de palabras en un cmd o en la propia consola proporcionada por spyder o visual studio code, por ejemplo.

Dentro del proyecto **scala/sparkpi**, tenemos la típica estrucutra de proyecto de scala. Para desplegarlo podemos hacer uso de *make submit-scala-pi-job*, que por un lado hace clean y package del proyecto (haciendo uso de un contenedor auxiliar con *sbt* instalado, de forma que **no necesitamos *sbt* localmente**) y por otro despliega el *.jar* en el nodo master de spark.Además, tenemos dos script *.bat*: *sbt.bat* y *submit-scala-spark.bat*.
 
Una vez terminado el trabajo, *make down* se encarga de eliminar la red y los contenedores asociados, quedando en nuestro local únicamente la imagen utilizada *gettyimages/spark*, que corresponde con la última versión de spark publicada (*docker rmi IMAGE_ID* para eliminarla del repositorio local de imágenes). En caso de querer utilizar una versión particular de spark o scala, modificar el fichero de configuración *docker-compose.yml* y el fichero *build.sbt* (también *submit-scala-spark.bat*).