up:
	docker-compose up -d

submit-python-counter-job:
	cp projects/python/word-count/counter.py docker/volumes/spark-master/data && docker exec -it spark spark-submit /tmp/data/counter.py

down:
	docker-compose down -v