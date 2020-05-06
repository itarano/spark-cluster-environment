@echo off
call sbt.bat sbt clean
call sbt.bat sbt package
rem Same values as in build.sbt
set project=spark-pi-project
set class=SparkPi
set version=1.0.0
set scala_version=2.11
copy target\scala-%scala_version%\%project%_%scala_version%-%version%.jar "..\..\..\docker\volumes\spark-master\data" && docker exec -it spark-master spark-submit --class %class% --master spark://master:7077 /tmp/data/%project%_%scala_version%-%version%.jar