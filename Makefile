up:
	cd docker && docker-compose up -d

submit-python-counter-job:
	cp projects/python/word-count/counter.py docker/volumes/spark-master/data && docker exec -it spark spark-submit /tmp/data/counter.py

define install_dbt = 

docker inspect mozilla/sbt:latest 2> nul 1> nul || docker pull mozilla/sbt:latest 1> nul

endef

install_dbt:
	$(value install_dbt)

sbt-clean: install_dbt
	docker run -it --rm -v $(PWD):/app -w /app/projects/scala/sparkpi mozilla/sbt:latest sbt clean

sbt-package: install_dbt
	docker run -it --rm -v $(PWD):/app -w /app/projects/scala/sparkpi mozilla/sbt:latest sbt package

submit-scala-pi-job: sbt-clean sbt-package
	cp projects/scala/sparkpi/target/scala-2.12/spark-pi-project_2.12-1.0.0.jar docker/volumes/spark-master/data && docker exec -it spark spark-submit --class SparkPi --master spark://spark:7077 /tmp/data/spark-pi-project_2.12-1.0.0.jar

down:
	cd docker && docker-compose down -v