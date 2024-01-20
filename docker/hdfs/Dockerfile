ARG BASE=hadoop-base
FROM ${BASE}

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
