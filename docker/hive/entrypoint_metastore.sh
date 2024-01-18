#!/bin/bash
service postgresql start
/opt/hive/scripts/init_metastore.sh
/opt/hive/bin/hive --service metastore
