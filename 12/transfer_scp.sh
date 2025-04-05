#!/bin/bash

SOURCE=$1
USER=$2
IP=$3

scp -r "$SOURCE" "${USER}@${IP}":~