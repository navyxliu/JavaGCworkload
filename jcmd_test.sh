#!/bin/bash
jcmd $1 VM.log disable
jcmd $1 VM.log output="file=gc.log" output_options="filecount=5,filesize=10m,async=true" what="gc=debug" decorators="uptime,level,tags"
