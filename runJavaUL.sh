#!/bin/bash
javac Test.java

H=$1
shift

GCLOG=$1
shift

#10g heap is suggested
java -Xmx$H -Xms$H -Xlog:gc=trace:file=$GCLOG $* Test -1 4
