#!/bin/bash
echo "\tloading bash environment variables..."

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
export RUBY_SCRIPT_FILE=~/src/bash-profile/ruby_scripts/script.rb
export RUBY_CREATE_SCRIPTS_FILE=~/src/bash-profile/ruby_scripts/create_scripts.rb
export RUBY_PRYRC_FILE=~/src/bash-profile/ruby_scripts/pryrc.rb
export JIRA_URL=https://jira.carecloud.com/

echo "\t\tDone"