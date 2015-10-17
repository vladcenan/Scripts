#!/bin/bash



countdown()

{

if [[ "$answer" -lt "0" ]];

then

  for (( c=$answer; c>=$answer; c++ ))

  do

   echo -n "$c"

   sleep 1

   if [ "$c" == 1 ]; then

   exit 2

   fi

  done

else

 for (( c=$answer; c<=$answer; c-- ))

 do

  echo -n "$c"

  sleep 1

  if [ "$c" == 1 ]; then

 #break

  exit 2

  fi

 done

fi

}



#trap the signal

#trap '' 2



#put everything into a loop

while true

do

clear

 echo "Countdown to one"

 echo "Press q to quit"

 echo "Enter your selection"

 read answer

 case "$answer" in

  q) exit ;;

  *) countdown ;;

 esac

read input

 if [[ $answer =~ ^-?[0-9]+$ ]];

  then

   echo "String is a valid integer.Countdown:"

  else

   echo "Error 0 - The input is not an integer. Please choose an integer!"

   exit 0

 fi

done

