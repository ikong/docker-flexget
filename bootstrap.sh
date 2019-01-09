#!/bin/ash

rm -f /root/.flexget/.config-lock
flexget --loglevel info daemon start
