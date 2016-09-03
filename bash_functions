#!/bin/bash
echo "loading bash functions..."

  function o() {
    if [ ! "$1" ]; then
      echo "opening finder..."
      xdg-open .  &>/dev/null & disown
    else
      echo "opening $1"
      xdg-open "$1" &>/dev/null & disown
    fi
  }

# Run rails server in the background with easy bouncing and toggling
# function rs() {
#   if [[ -f tmp/pids/server.pid ]]; then
#     kill -9 $(cat tmp/pids/server.pid)
#     rm tmp/pids/server.pid
#     if [ "$1" = "-b" ]; then
#       rails server -d >>log.txt 2>&1 & disown
#       echo "------------------------------- SERVER WAS BOUNCED -------------------------------" >> log/development.log
#       echo "bouncing server..."
#     else
#       echo "killing server..."
#       echo "------------------------------- SERVER WAS KILLED --------------------------------" >> log/development.log
#     fi
#     return 0
#   else
#     rails server -d >>log.txt 2>&1 & disown
#     echo "------------------------------- SERVER WAS STARTED -------------------------------" >> log/development.log
#     echo "starting server..."
#     return 0
#   fi
# }

# Changes rails logs to print dev log of rails project
# function rails() {
#   if [ "$1" = "logs" ]; then
#     cat log.txt
#   else
#     command rails $@
#   fi
# }

echo "Done"
