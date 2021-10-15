#!/bin/bash

echo "get_metrics started.."

get_metrics(){
   command=$(ps aux)
   while read -r command
   do
      var=$var$(awk '{print "cpu_usage{process=\""$11"\", pid=\""$2"\"}", $3"\nmem_usage{process=\""$11"\", pid=\""$2"\"}", $4command}');
   done <<< "$command"
   var=$var$'\n'
   response=$(curl -X POST -H  "Content-Type: text/plain" --data "$var"  http://localhost:9091/metrics/job/top/instance/machine) 
   echo ${response}
   unset var
}

while true; do get_metrics; sleep 1; done

