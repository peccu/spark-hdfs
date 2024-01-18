#!/bin/bash

nodetype=$1
if [ -z $nodetype ]
then
    echo "Please specify namenode or datanode or single"
    exit 1
fi

# コンテナの再作成によるデータ不整合(クラスタIDが異なる)を防ぐためにフォーマット時に明示する
clusterID=hdfs-cluster-123

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
HADOOP_HOME=/usr/local/hadoop
HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

# 初回の起動かどうかを確認
if [ ! -e $HADOOP_CONF_DIR/has_run_before ]; then
    echo "First time running Hadoop. Formatting HDFS..."

    # HDFSをフォーマット
    if [ "$nodetype" == "single" ]
    then
        hdfs namenode -format -force -clusterID $clusterID
        hdfs datanode -format -force -clusterID $clusterID
    else
        hdfs $nodetype -format -force -clusterID $clusterID
    fi

    # ファイルを作成して初回実行済みであることをマーク
    touch $HADOOP_CONF_DIR/has_run_before
else
    echo "Hadoop has been run before. Skipping HDFS formatting."
fi

# Hadoopを起動
# JAVA_HOME is not set...
# $HADOOP_HOME/sbin/start-all.sh
if [ "$nodetype" == "single" ]
then
    $HADOOP_HOME/sbin/start-dfs.sh
else
    $HADOOP_HOME/bin/hdfs $nodetype
fi
