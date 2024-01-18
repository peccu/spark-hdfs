# Use an official Ubuntu 22.04 as a base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HADOOP_VERSION 3.3.6

# Install necessary dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    openjdk-11-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Download and extract Hadoop
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz \
    && tar -xzvf hadoop-${HADOOP_VERSION}.tar.gz \
    && mv hadoop-${HADOOP_VERSION} /usr/local/hadoop \
    && rm hadoop-${HADOOP_VERSION}.tar.gz

# Set environment variables for Hadoop
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR ${HADOOP_HOME}/etc/hadoop
ENV PATH $PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
ENV HDFS_NAMENODE_USER root
ENV HDFS_DATANODE_USER root
ENV HDFS_SECONDARYNAMENODE_USER root
ENV YARN_RESOURCEMANAGER_USER root
ENV YARN_NODEMANAGER_USER root

COPY core-site.xml $HADOOP_CONF_DIR
COPY hdfs-site.xml $HADOOP_CONF_DIR

# Expose Hadoop Namenode ports
# 9870 : web ui
# 9000 : hdfs (ipc)
EXPOSE 9870
# Expose Hadoop Datanode port
# 9864 : web ui
# 9867 : ipc
EXPOSE 9864

ADD init.sh /bin/

# Start Hadoop
ENTRYPOINT ["/bin/init.sh"]
