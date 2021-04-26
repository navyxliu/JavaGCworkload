#!/bin/bash

jcmd $1 VM.native_memory baseline
sleep 5
echo "focus on Logging"
watch -n 0.5 jcmd $1 VM.native_memory summary.diff
