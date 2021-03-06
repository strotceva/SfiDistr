#!/bin/sh
#
# Site build script
#
# This file should contain all necessary steps to build the website.
#

case $@ in
  #
  # This is called when container is being build (and this script is called with --preinstall param)
  #
  *--preinstall*)
    echo "Build script: PREINSTALL"
    # We need this for the sake of CircleCI
    git config --global user.email "dimaip@gmail.com" &&  git config --global user.name "Dmitri Pisarev"
    ./beard patch
    ;;
 
  #
  # This is called when container launches (and script is called without param)
  #
  *)
    echo "Site build script"
    if [ -f Configuration/Production/Settings.yaml ]; then
      cp Configuration/Production/Settings.yaml Configuration/Settings.yaml
    fi
    chmod g+rwx -R .
    ;;
esac
