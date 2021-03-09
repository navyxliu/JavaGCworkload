#!/bin/bash
# legacy style of gclog. we need to explicitly use G1GC for jdk8u.
javac Test.java

H=$1
shift

GCLOG=$1
shift

#10g heap is suggested
java -Xmx$H -Xms$H -Xloggc:$GCLOG -XX:+UseG1GC -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCDetails $* Test -1 4
