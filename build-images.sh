#!/bin/bash

cd docker/jupyterlab
echo juupyterlab
docker build -t jupyterlab .
cd ../hadoop-base
echo hadoop-base
docker build -t hadoop-base .
cd ../hdfs
echo hdfs
docker build -t hdfs .
# cd ../hive
# echo metastore
# docker build -t metastore -f Dockerfile.metastore .
# echo hive server
# docker build -t hive-server -f Dockerfile.server .
