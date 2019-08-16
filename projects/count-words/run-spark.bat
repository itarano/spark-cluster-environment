@echo off
set file=%1
if [%file%]==[] (echo Need a script to run) else (copy %1 "..\..\docker\volumes\spark-master\data" && docker exec -it spark-master spark-submit /tmp/data/%file:.\=%)