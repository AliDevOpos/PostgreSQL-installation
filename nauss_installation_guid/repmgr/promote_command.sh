#!/bin/bash
set -e -u -x
repmgr standby promote -f /etc/repmgr/repmgr.conf --siblings-follow  --log-to-file
ssh 10.40.4.59 "sed -e 's,host=[^ ]*,host=10.40.4.6,' -i /etc/pgbouncer/databases.ini && pkill -HUP -x pgbouncer"
