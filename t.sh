#!/bin/bash

PREFIX="cset proc -l -s benchmark -e"
$PREFIX ./runJava.sh -- 2g gc.log.default -XX:-AsyncGCLogging
$PREFIX ./runJava.sh -- 2g gc.log.async -XX:+AsyncGCLogging -XX:+PrintGCLogStatistics
#delay5m
$PREFIX ./runJava.sh -- 2g gc.log.delay5 -XX:DelayInGCLogging=5 -XX:-AsyncGCLogging
$PREFIX ./runJava.sh -- 2g gc.log.delay5.async -XX:DelayInGCLogging=5 -XX:+AsyncGCLogging -XX:+PrintGCLogStatistics
#delay10m
$PREFIX ./runJava.sh -- 2g gc.log.delay10 -XX:DelayInGCLogging=10 -XX:-AsyncGCLogging
$PREFIX ./runJava.sh -- 2g gc.log.delay10.async -XX:DelayInGCLogging=10 -XX:+AsyncGCLogging -XX:+PrintGCLogStatistics
