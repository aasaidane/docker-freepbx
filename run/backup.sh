#!/bin/bash -x
while /bin/true; do
  sleep 86400
  php /var/www/html/admin/modules/backup/bin/backup.php --id=1
  mkdir -p /data/backup/
  rm /data/backup/old.tgz
  mv /data/backup/new.tgz /data/backup/old.tgz
  mv /var/spool/asterisk/backup/Default_backup/"$(ls -t /var/spool/asterisk/backup/Default_backup | head -1)" /data/backup/new.tgz
done
