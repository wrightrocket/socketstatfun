#!/usr/bin/env bash
source ss.fun
echo Naked "ss"
ss
read -p 'Quick port 22 filter "ss 22" <Press Enter>'
ss 22
read -p 'State filter for established connections <Press Enter>'
ss state established

