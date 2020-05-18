## TO-DO
- Parsear variables de build.sbt desde submit-scala-spark.bat
- Añadir doc depurar jobs con intelliJ 
- docker exec -it spark-master spark-submit --class SparkPi --conf spark.driver.extraJavaOptions=-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=4000 --master spark://master:7077 /tmp/data/spark-pi-project_2.11-1.0.0.jar => integrar en *submit* script
