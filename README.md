# Spark

## pip packages

to add pip packages

write down it to `jupyterlab/requirements/requirements.in` and run below command:

```
docker compose run --rm --entrypoint /bin/bash -w /requirements jupyter -c "pip-compile-multi" && docker compose build
```

or, just run  `make pip-compile-multi`.

## refs

- [bitnami/spark - Docker Image | Docker Hub](https://hub.docker.com/r/bitnami/spark)
  - もとにしたコンテナイメージ
- [containers/bitnami/spark/docker-compose.yml at main · bitnami/containers](https://github.com/bitnami/containers/blob/main/bitnami/spark/docker-compose.yml)
  - 同docker-compose.yml
- [Setting up a Spark standalone cluster on Docker in layman terms | by Marin Aglić | Medium](https://medium.com/@MarinAgli1/setting-up-a-spark-standalone-cluster-on-docker-in-layman-terms-8cbdc9fdd14b)
  - submitする例とかあってわかりやすい
- [pyspark-playground/Makefile at main · mrn-aglic/pyspark-playground](https://github.com/mrn-aglic/pyspark-playground/blob/main/Makefile)
  - 上の記事の実装。Makefileが参考になった。書籍に合わせて十さん
- [spark-standalone-cluster/notebooks/pyspark_test.ipynb at main · mrn-aglic/spark-standalone-cluster](https://github.com/mrn-aglic/spark-standalone-cluster/blob/main/notebooks/pyspark_test.ipynb)
  - pysparkのテスト、サンプルに
- [spark-standalone-cluster-on-docker/build/workspace/pyspark.ipynb at master · cluster-apps-on-docker/spark-standalone-cluster-on-docker](https://github.com/cluster-apps-on-docker/spark-standalone-cluster-on-docker/blob/master/build/workspace/pyspark.ipynb)
  - csv読み込みから結果の書き込みまであるサンプル
- [spark-standalone-cluster-on-docker/build/docker/jupyterlab/Dockerfile at master · cluster-apps-on-docker/spark-standalone-cluster-on-docker](https://github.com/cluster-apps-on-docker/spark-standalone-cluster-on-docker/blob/master/build/docker/jupyterlab/Dockerfile)
  - Jupyter Kernelとして Scala(Almond), R を追加する参考に
