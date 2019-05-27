#!/usr/bin/env bash
set -e
source ss.fun
ss
ss 22
ss state established
ss 80 -t
ss 53 -ulpn


