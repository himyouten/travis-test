#!/usr/bin/bash

NC='\033[0m'
CYAN='\033[0;36m'
RED='\033[0;31m'
GREEN='\033[0;32m'
DATE_FORMAT="%Y-%m-%d %T"
VERBOSE=0
PID=$$


echo_green()
{
  if [[ $VERBOSE -gt 0 ]]
  then
    echo -e `date +"${DATE_FORMAT}"`"[$PID] ${GREEN}$1 ${NC}"
  fi
}

echo_cyan()
{
  if [[ $VERBOSE -gt 1 ]]
  then
    echo -e `date +"${DATE_FORMAT}"`"[$PID] ${CYAN}$1 ${NC}"
  fi
}

echo_red()
{
  echo -e `date +"${DATE_FORMAT}"`"[$PID] ${RED}$1 ${NC}"
}

handle_cmd_stat()
{
    if [ $1 -eq 0 ]; then
      echo_green "$2 succeeded"
    else
      echo_red "$2 failed with exit code: $1"
      if [[ ! -z $3 ]] && [[ $3 -gt 0 ]]
      then
        exit $3
      fi
    fi
}

GITUSER=`git log -1 --pretty='%aN <%aE>'`
echo_red "gituser:$GITUSER"

echo_red "TEST_AUTHOR:$TEST_AUTHOR"
