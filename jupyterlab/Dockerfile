FROM docker.io/bitnami/spark:3.5

USER root

## from https://github.com/cluster-apps-on-docker/spark-standalone-cluster-on-docker/blob/master/build/docker/jupyterlab/Dockerfile

# -- Layer: JupyterLab + Python kernel for PySpark
RUN pip3 install jupyterlab

# -- Layer: Scala kernel for Spark
RUN apt-get update && \
    apt-get install -y curl ca-certificates-java --no-install-recommends && \
    curl -Lo coursier https://git.io/coursier-cli && \
    chmod +x coursier && \
    ./coursier launch --fork almond -- --install --force --global && \
    rm -f coursier

# -- Layer: R kernel for SparkR
ENV spark_version 3.5.0
RUN apt-get install -y r-base-dev && \
    R -e "install.packages('IRkernel')" && \
    R -e "IRkernel::installspec(user = FALSE)" && \
    curl https://archive.apache.org/dist/spark/spark-${spark_version}/SparkR_${spark_version}.tar.gz -k -o sparkr.tar.gz && \
    R CMD INSTALL sparkr.tar.gz && \
    rm -f sparkr.tar.gz

# Install python deps with pip-compile-multi generated
COPY requirements/requirements.txt .
RUN pip3 install -r requirements.txt

# USER 1000

RUN mkdir /opt/spark

WORKDIR /opt/spark
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=
