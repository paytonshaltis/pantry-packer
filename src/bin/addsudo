#!/bin/bash
# based on https://stackoverflow.com/questions/8784761/adding-users-to-sudoers-through-shell-script
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


if [ "$EUID" -ne 0 ]
  then echo "This must be run as root. Requesting root access..."
  sudo /bin/bash $0 "${@:1}"
  exit
fi

echo "${red}This program adds any user given to the sudoers list."
echo "That means that they have root access with sudo."
echo "This is dangerous. Make sure you enter the correct usernames or security issues will be created.${reset}"
echo
echo "Are you sure the command is entered correctly?"
echo "These users will become sudoers:"
echo "${green}${@:1}${reset}"
echo
echo "Press enter for yes, quit with CTRL+C (SIGINT) to stop if it's not."
read yn

while [[ -n $1 ]]; do
    #echo "$1	ALL=(ALL:ALL) ALL" >> /etc/sudoers;
	echo "-> $1 is now a sudoer"
    shift # shift all parameters;
done
echo
echo "With great power comes great responsibility. Be careful with sudo access."