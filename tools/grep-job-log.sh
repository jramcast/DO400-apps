#!/bin/bash
oc wait --for=condition=ContainersReady \
  --timeout=60s pod --selector job-name=${1} -n ${2}

oc logs --selector=job-name=${1} -n ${2} --tail=-1 | grep "${3}"
