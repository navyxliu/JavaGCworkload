#!/bin/bash

echo "testing: " `which java`
#expr: https://openjdk.java.net/jeps/158
#WHAT='gc*,safepoint*,class*=trace,thread*=trace,jit*=debug'
WHAT='all=trace'
DECORATORS='l,tg'
time java -Xlog:"$WHAT:file=hotspot.log:$DECORATORS:filecount=0,async=true" $* --version
time java -Xlog:"$WHAT:file=hotspot-gold.log:$DECORATORS:filecount=0,async=false" $* --version
wc -l hotspot.log hotspot-gold.log

echo "dropped logs in async mode:"
grep "messages dropped" hotspot.log
