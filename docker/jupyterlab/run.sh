#!/bin/bash
# Copyright VMware, Inc.
# SPDX-License-Identifier: APACHE-2.0

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace

# Load libraries
. /opt/bitnami/scripts/libspark.sh
. /opt/bitnami/scripts/libos.sh

# Load Spark environment settings
. /opt/bitnami/scripts/spark-env.sh

EXEC=$(command -v start-jupyter.sh)
info "** Starting Jupyter Notebook **"

if am_i_root; then
    exec_as_user "$SPARK_DAEMON_USER" "$EXEC" "${ARGS[@]-}"
else
    exec "$EXEC" "${ARGS[@]-}"
fi
