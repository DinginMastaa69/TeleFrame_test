#!/usr/bin/env bash

command="$1"
backupfile="$2"
current_time=$(date "+%Y%m%d-%H%M%S")

cd ~/TeleFrame
case "$command" in
    full)
      tar -czf ./backup/backup-$current_time-full.tar.gz addons/ audiofiles/ config/ css/ fonts/ images/ js/ sounds/ splashscreen/ tools/
      exit 0;;
    lite)
      tar -czf ./backup/backup-$current_time-lite.tar.gz addons/ audiofiles/ config/ images/
      exit 0;;
    restore)
      if [ -z $backupfile ]; then
        echo "backup file missing"
        exit 1
      else
        tar -xzf $backupfile
        echo "restored $backupfile"
        exit 0
      fi;;
    *)
      echo "command missing (full/lite/restore)"
      exit 1;;
esac