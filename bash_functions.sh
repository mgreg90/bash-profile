#!/bin/bash
echo "\n\tloading bash functions..."

  function sunglasses() {
    echo -en " ( •_•)   \r"
    sleep 1
    echo -en " ( •_•)>⌐■-■\r"
    sleep 1
    echo " (⌐■_■)     "
    echo "Deal with it"
  }

  function chrome_in_zone() {

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

#########################
# Conditional App Aliases
#########################

function slack_app() {
  if [ "$_system_name" = "OSX" ]; then
    echo "Opening Slack in Mac OSX"
    open /Applications/Slack.app
  elif [ "$_system_type" = "Linux" ]; then
    echo "Opening Slack in Linux"
    slack &>/dev/null
  else
    echo "slack function Failed!"
  fi
}
alias slack='slack_app'

function spotify_app() {
  if [ "$_system_name" = "OSX" ]; then
    echo "Opening Spotify in Mac OSX"
    open /Applications/Spotify.app
  elif [ "$_system_type" = "Linux" ]; then
    echo "Opening Spotify in Linux"
    spotify &>/dev/null & disown
  else
    echo "spotify function Failed!"
  fi
}
alias spotify='spotify_app'

function chrome() {
  if [ "$_system_name" = "OSX" ]; then
    echo "Opening Chrome in Mac OSX"
    open /Applications/Google\ Chrome.app
  elif [ "$_system_type" = "Linux" ]; then
    echo "Opening Chrome in Linux"
    google-chrome &>/dev/null & disown
  else
    echo "chrome function Failed!"
  fi
}

function postman() {
  if [ "$_system_name" = "OSX" ]; then
    echo "Opening Postman in Mac OSX"
    open /Users/${USER}/Applications/Chrome\ Apps.localized/Default\ fhbjgbiflinjbdggehcddcbncdddomop.app/
  elif [ "$_system_type" = "Linux" ]; then
    echo "Opening Postman in Linux"
    google-chrome --app-id=fhbjgbiflinjbdggehcddcbncdddomop &>/dev/null & disown
  else
    echo "postman function Failed!"
  fi
}

function mail() {
  if [ "$_system_name" = "OSX" ]; then
    echo "Opening Mail in Mac OSX"
    open /Applications/Mail.app
  elif [ "$_system_type" = "Linux" ]; then
    echo "Opening Thunderbird in Mac OSX"
    thunderbird &>/dev/null & disown
  else
    echo "mail function Failed!"
  fi
}

function o() {
  if [ "$_system_name" = "OSX" ]; then
    open $1
  elif [ "$_system_type" = "Linux" ]; then
    xdg-open "$1" &>/dev/null & disown
  else
    echo "open function Failed!"
  fi
}

function copy() {
  if [ "$_system_name" = "OSX" ]; then
    pbcopy
  elif [ "$_system_type" = "Linux" ]; then
    ubuntu_copy
  else
    echo "copy function Failed!"
  fi
}

function ssh-pers() {
  ssh-add -D
  ssh-add ~/.ssh/git_mgreg90
}

function ssh-work() {
  ssh-add -D
  ssh-add ~/.ssh/git_carecloud
}

echo "\t\tDone"
