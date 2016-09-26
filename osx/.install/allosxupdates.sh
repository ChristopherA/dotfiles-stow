#!/bin/bash

# Install all macOS updates, reboot if necessary, and install command line tools

# 2016-09-21 Confirmed working with macOS Sierra 10.12.0

# Execute on a new machine via:

# $ curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/osx/.install/allosxupdates.sh | bash

# TBD: It is possible that after command line utilities are installed that
# additional updates may be required, even though previous test resulted in
# a report of no updates required. For now I'm forcing one last update. To
# to do properly requires refactoring this script and how it does update checks,
# probably some form of 'until [ $found_updates -eq 0 ] do xxxx done'

# TBD: There should be some way if a restart is required to install a
# script to automatically start this script again, until found_updates() is
# false. I've had too many false starts on this for it to be a priority.

# TBD: Redo all the echos and command output to /dev/null
# if $SCRIPT_DEBUG is false.

# Script Debugger

#SCRIPT_DEBUG=true
#SCRIPT_DEBUG=false

# Ask for the administrator password upfront
echo -e "\nUpdating system software and developer tools.\n Your administrator password will be required."
sudo -v

# What kind of OS are we running?

echo -e "\nChecking System -- \c"

# If we on OSX, install OSX specific command line tools, brew, brew cask, etc.

if [[ `uname` == 'Darwin' ]]; then

  # Get OSX Version
  OSX_VERS=$(sw_vers -productVersion)
  OSX_VERS_FIRST=$(sw_vers -productVersion | awk -F "." '{print $2}')

  echo "we are installing on a Mac under OSX $OSX_VERS."

  # on 10.9+, we can leverage Software Update to get the latest CLI tools
  if [ "$OSX_VERS_FIRST" -ge 9 ];
  then

    # Define some variables...
    tmp_file=".softwareupdate.$$"
    reboot=""
    found_updates=""

    echo -e "\n  Checking Apple Software Update Server for available updates,\n  Please be patient. This process may take a while to complete... \c"
    sudo /usr/sbin/softwareupdate -l &> $tmp_file
    wait
    sudo -v # extend sudo's timeout by 5 minutes

    echo -e "\n"
    reboot=$(/usr/bin/grep "restart" $tmp_file | /usr/bin/wc -l | xargs )
    echo "    $reboot updates require a reboot."
    /usr/bin/grep "restart" $tmp_file

    echo ""
    found_updates=$(/usr/bin/grep -v "restart" $tmp_file | grep "recommended" | /usr/bin/wc -l | xargs )
    echo "    $found_updates updates do not require a reboot."
    /usr/bin/grep -v "restart" $tmp_file | grep "recommended"
    echo ""

    if [ $found_updates = "0" ]
      then
         echo "    No new recommended updates found."
      else
        if [ $reboot = "0" ]
        then
          echo "    Updates found, but no reboot required. Installing now."
          echo "    Please be patient. This process may take a while to complete."
          sudo -v # extend sudo's timeout by 5 minutes
          sudo /usr/sbin/softwareupdate -ia
          wait
          sudo -v # extend sudo's timeout by 5 minutes
          echo -e "\n  Finished with all Apple Software Update installations."
        else
          echo "    Updates found, reboot required. Installing now."
          echo "    Please be patient. This process may take a while to complete."
          echo -e "    Once complete, this machine will automatically restart.\n"
          sudo -v # extend sudo's timeout by 5 minutes
          sudo /usr/sbin/softwareupdate -ia
          wait
          sudo -v # extend sudo's timeout by 5 minutes
          echo -e "    Finished with all Apple Software Update installations."
        fi
      fi

    # cleaning up temp files before possible reboot
    /bin/rm -rf $tmp_file

    if [ $reboot != "0" ]
    then
      echo -e "\n  Apple Software Updates requiring restart have been installed."
      echo -e "  Please run this script again after restart.\n"
      read -p "Press any key to restart..." </dev/tty
      wait
      echo -e "\nRestarting..."
      sudo /sbin/shutdown -r now
    fi

    echo -e "\n  Checking to see if Apple Command Line Tools are installed."
    xcode-select -p &>/dev/null
    if [[ $? -ne 0 ]]
    then
      echo "    Apple Command Line Utilities not installed. Installing..."
      echo "    Please be patient. This process may take a while to complete."

      # Tell software update to also install OXS Command Line Tools without prompt
      ## As per https://sector7g.be/posts/installing-xcode-command-line-tools-through-terminal-without-any-user-interaction

      touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
      sudo -v # extend sudo's timeout by 5 minutes
      sudo /usr/sbin/softwareupdate -ia
      wait
      sudo -v # extend sudo's timeout by 5 minutes

      /bin/rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

      # Check one last time for updates - TBD: refactor to do a test first.
      sudo -v # extend sudo's timeout by 5 minutes
      sudo /usr/sbin/softwareupdate -ia
      wait
      sudo -v # extend sudo's timeout by 5 minutes

      echo -e "\n    Finished installing Apple Command Line Tools."
    else
      echo -e "\n    Apple Command Line Tools already installed."
    fi


    # Clean log files
    echo -e "\n  Cleaning log files."
    sudo rm -rf /var/log/*

    # Force empty trash
    echo -e "\n  Emptying trash."
    sudo rm -rf ~/.Trash/*

    # Run maintenance scripts
    echo -e "\n  Running maintenance scripts."
    # The locate and whathis databases, also used by apropos, is only generated weekly,
    # so run it after changing commands. This will happen in the background and can
    # take some time to generate the first time.

    sudo periodic daily weekly monthly

 else
   echo "This script only supports OSX 10.9 Mavericks or better! Exiting..."
 fi

else
  echo "We are not running on a Mac! Install scripts for non-Macs are a work-in-progress."
fi

echo -e "\nFinished installation.\n"
