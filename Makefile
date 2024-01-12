# from https://github.com/mrn-aglic/pyspark-playground/blob/main/Makefile
# merged https://github.com/mrn-aglic/spark-standalone-cluster/blob/main/Makefile

MASTER_NODE=spark
WORKER_NODE=worker
JUPYTER_NODE=jupyter
SCALE=3

build:
	docker compose build

build-nc:
	docker compose build --no-cache

build-progress:
	docker compose build --no-cache --progress=plain

clean:
	docker compose down --rmi="all" --volumes

down:
	docker compose down --volumes --remove-orphans

up:
	make down && docker compose up

up-d:
	make down && docker compose up -d

# up-generated:
# 	make down && sh ./generate-docker-compose.sh $(SCALE) && docker compose -f docker-compose.generated.yml up

# up-scaled:
# # 	make down && docker compose up --scale worker=$(SCALE)
# 	make down && for i in $(seq 1 $(SCALE)); do WORKER_ID=$i docker compose up --scale $(WORKER_NODE)=$i; done

# up-scaled-d:
# 	make down && docker compose up --scale $(WORKER_NODE)=$(SCALE) -d

stop:
	docker compose stop

# USAGE: make submit app=path/to/some-sample-code.py
submit:
	docker compose exec $(MASTER_NODE) spark-submit --master spark://$(MASTER_NODE):7077 --deploy-mode client ./apps/$(app)

submit-py-pi:
	docker compose exec $(MASTER_NODE) spark-submit --master spark://$(MASTER_NODE):7077 /opt/bitnami/spark/examples/src/main/python/pi.py

submit-yarn-cluster-test:
	docker compose exec $(MASTER_NODE) spark-submit --master yarn --deploy-mode cluster /opt/bitnami/spark/examples/src/main/python/pi.py

submit-yarn-cluster:
	docker compose exec $(MASTER_NODE) spark-submit --master yarn --deploy-mode cluster ./apps/$(app)

rm-results:
	rm -r data/results/*

pip-compile-multi:
	docker compose run --rm --entrypoint /bin/bash -w /requirements jupyter -c "pip-compile-multi" && docker compose build && docker compose up -d jupyter
