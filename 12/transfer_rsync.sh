#!/bin/bash

SOURCE=$1
USER=$2
IP=$3

rsync -avz "$SOURCE" "${USER}@${IP}":~