#!/bin/bash

# Faz um pre-warm de disco ebs apresentando a barra de progresso
#

if [ -z "$1" ]; then
  echo "Usage: sudo $0 /dev/sdh1"
  exit 1;
fi

dd if=$1 of=/dev/null & pid=$!
while true; do
  ps -p$pid --no-heading || break;
  echo "-- $(date) ------------------";
  kill -USR1 $pid;
  sleep 60s;
done
echo "-- $(date) ------------------";
echo "DONE \o/"
