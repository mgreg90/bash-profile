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
  
  function chrome_in_zone() {
    ### Customize these

    # Change this to the spoof a different timezone. Helpful for testing timezone specific client facing content.
    if [[ ! "$1" ]]; then
      export TZ="America/New York"
    else
      export TZ="$1"
    fi

    # Permanent directory to store the user-data directory of your 'fresh'
    # Chrome configuration.
    fresh_dir="$HOME/.fresh-chrome"

    # Temporary directory in which to create new user-data directories for
    # temporary Chrome instances.
    tmp_dir="/tmp"



    ### Main script begins

    set -e

    timestamp=`date +%Y%m%d%H%M%S`

    if [[ -e "$fresh_dir" ]]; then
        user_dir="$tmp_dir/chrome-$timestamp-$RANDOM"
        cp -r "$fresh_dir" "$user_dir"
        exec open -na "Google Chrome" --args "--user-data-dir=$user_dir"
    else
        exec open -na "Google Chrome" --args "--user-data-dir=$fresh_dir"
    fi
  }
  
  # timezones
  # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  # get browser timezone js
  # Intl.DateTimeFormat().resolvedOptions().timeZone
  # 
  # 
  export PATH=$PATH:~/.android-sdk-macosx/platform-tools/

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

#########################
# Conditional App Aliases
#########################

function slack() {
  if [ "$_system_name" = "OSX" ]; then
    open /Applications/Slack.app
  else
    slack &>/dev/null & disown
  fi
}

function spotify() {
  if [ "$_system_name" = "OSX" ]; then
    open /Applications/Spotify.app
  else
    spotify &>/dev/null & disown
  fi
}

function chrome() {
  if [ "$_system_name" = "OSX" ]; then
    open /Applications/Google\ Chrome.app
  else
    google-chrome &>/dev/null & disown
  fi
}

function postman() {
  if [ "$_system_name" = "OSX" ]; then
    open /Users/${USER}/Applications/Chrome\ Apps.localized/Default\ fhbjgbiflinjbdggehcddcbncdddomop.app/
  else
    google-chrome &>/dev/null & disown
  fi
}

function mail() {
  if [ "$_system_name" = "OSX" ]; then
    open /Applications/Mail.app
  else
    thunderbird &>/dev/null & disown
  fi
}

function o() {
  if [ "$_system_name" = "OSX" ]; then
    open $1
  else
    xdg-open "$1" &>/dev/null & disown
  fi
}


echo "Done"
