#!/bin/bash

#expr: https://openjdk.java.net/jeps/158
WHAT='gc*,safepoint*,class*=trace,thread*=trace,jit*=debug'
DECORATORS='l,tg'
java -Xlog:"$WHAT:file=gc.log:$DECORATORS:filecount=1,async=true" --version 
java -Xlog:"$WHAT:file=gc-golden.log:$DECORATORS:filecount=1,async=false" --version 
wc -l gc.log gc-golden.log
