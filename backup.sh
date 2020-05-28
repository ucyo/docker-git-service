#!/usr/bin/env bash

set -o noclobber  # Avoid overlay files (echo "hi" > foo)
set -o errexit    # Used to exit upon error, avoiding cascading errors
set -o pipefail   # Unveils hidden failures
set -o nounset    # Exposes unset variables
#set -o xtrace     # For debugging of errors with trace

BACKUP_FOLDER="/tmp"   					  # Container internal backup folder
HOST_BACKUP_FOLDER="/mnt/md0/gitea/backups"		  # Host backup folder
BACKUP_FILENAME="gitea-$(date +%F-%H-%M-%S%z).zip"        # Filename of backup
GITEA_CONTAINER=$(docker ps -qf "name=gitea_server_1")    # Container of Gitea

CMD="/app/gitea/gitea dump --config /data/gitea/conf/app.ini --file ${BACKUP_FILENAME}"
docker exec -u git -it -w ${BACKUP_FOLDER} ${GITEA_CONTAINER} bash -c "${CMD}"
docker cp "${GITEA_CONTAINER}:${BACKUP_FOLDER}/${BACKUP_FILENAME}" "${HOST_BACKUP_FOLDER}/${BACKUP_FILENAME}"
