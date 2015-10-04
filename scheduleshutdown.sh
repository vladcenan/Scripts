#!/bin/bash
# Bash Meniu Script to shutdown Fedora
# Author vladhc

#trap the signal ctrl+c
trap '' 2

#put everything in a while do-done loop
while true
do
#every time we do the Do loop will clear the screen
  clear
  echo "========================================================================="
  echo "                             Shutdown Fedora                             "
  echo "========================================================================="  
  echo -e "\n"
  echo "Shutdown Fedora Linux after: "
  echo "30 minutes"
  echo "45 minutes"
  echo "60 minutes"
  echo "90 minutes"
  echo -e "\n"
  echo "============ Meniu ============"
  echo "Enter c to cancel shutdown"
  echo "Press q to quit"
#echo out a new line (without -e \n will be displayed as char)
  echo -e "\n"
#anything you type here will be read in variable answer 
  echo -e "Enter your selection \c"
  read answer 
#read the selection with the case esac statement
  case "$answer" in
    30) sudo shutdown -h +30 ;;
    45) sudo shutdown -h +45 ;; 
    60) sudo shutdown -h +60 ;;
    90) sudo shutdown -h +90 ;;
    c) sudo shutdown -c ;;
    q) exit ;;
  esac
  echo -e "Press Enter to continue \c"
  read input
done
 
