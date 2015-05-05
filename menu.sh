#!/bin/bash

tin()
{
echo " Please enter your user: "
read user_name
sudo scp /home/cenan/scripts/*.sh $user_name@olaxda-gcs22:/tmp
/home/cenan/scripts/sshsudo -r -v $user_name@olaxda-gcs22 ./bounce.sh
sudo scp /home/cenan/scripts/*.sh $user_name@olaxda-gcs23:/tmp
/home/cenan/scripts/sshsudo -r -v $user_name@olaxda-gcs23 ./bounce.sh
exit
}

bronze()
{
echo " Please enter your user: "
read user_name
sudo scp /home/cenan/scripts/*.sh $user_name@olaxsa-gcs00:/tmp
/home/cenan/scripts/sshsudo -r -v $user_name@olaxsa-gcs00 ./bounce.sh
sudo scp /home/cenan/scripts/*.sh $user_name@olaxsa-gcs01:/tmp
/home/cenan/scripts/sshsudo -r -v $user_name@olaxsa-gcs01 ./bounce.sh
exit
}

carbon()
{
echo " Please enter your user: "
read user_name
sudo scp /home/cenan/scripts/*.sh $user_name@olaxpa-gcsmobile00:/tmp
/home/cenan/scripts/sshsudo -r -v $user_name@olaxpa-gcsmobile00 ./bounce.sh
sudo scp /home/cenan/scripts/*.sh $user_name@olaxpa-gcsmobile01:/tmp
/home/cenan/scripts/sshsudo -r -v $user_name@olaxpa-gcsmobile01 ./bounce.sh
exit
}

pyrite()
{
echo " Please enter your user: "
read user_name
sudo scp /home/cenan/scripts/*.sh $user_name@olaxpa-gcs18:/tmp
/home/cenan/scripts/sshsudo -r -v $user_name@olaxpa-gcs18 ./bounce.sh
sudo scp /home/cenan/scripts/*.sh $user_name@olaxpa-gcs19:/tmp
/home/cenan/scripts/sshsudo -r -v $user_name@olaxpa-gcs19 ./bounce.sh
exit
}

sub_menu1()
{
trap '' 2
while true
do
clear
echo " ------------------------------------------------------------------------------------- "
echo " -------------------------------- BOUNCE ENVIRONMENT ------------------------------- "
echo " Please choose an environment: "
echo " 1) Bounce tin "
echo " 2) Bounce bronze "
echo " 3) Bounce carbon "
echo " 4) Bounce pyrite "
echo " 5) Back "
echo " ------------------------------------------------------------------------------------- "
echo -e "\n"
echo -e "Enter your selection \c"
read answer
case "$answer" in
1) echo " Bouncing Tin environment "
tin
;;
2) echo " Bouncing Bronze environment "
bronze ;;
3) echo " Bouncing Carbon environment "
carbon ;;
4) echo " Bouncing Pyrite environment "
pyrite ;;
5) menu ;;
esac
echo -e "Enter return to continue \c"
read input
done
}

sub_menu2()
{
clear
echo " ------------------------------------------------------------------------------------- "
echo " -------------------------------- BOUNCE BOX --------------------------------------- "
echo " Please enter a box name: "
echo " Example: olaxda-gcs22 or type back to return to the Bounce Menu"
read input_box
echo " You entered: $input_box "
if [ "$input_box" == "back" ]; then
menu
else
echo " Please enter your user: "
read user_name
sudo scp /home/cenan/scripts/*.sh $user_name@$input_box:/tmp
/home/cenan/scripts/sshsudo -r -v $user_name@$input_box ./bounce.sh
echo "$input_box"
if [[ "$input_box" == $HOSTNAME ]]; then
echo " You are connected "
else
exit
fi
fi
echo " ------------------------------------------------------------------------------------- "
}


menu()
{
trap '' 2
while true
do
clear
echo " ------------------------------------------------------------------------------------- "
echo " -------------------------------- BOUNCE MENU -------------------------------------- "
echo " Please choose an option: "
echo " 1) Bounce Environment "
echo " 2) Bounce Boxes "
echo " 3) Exit "
echo " ------------------------------------------------------------------------------------- "
echo -e "\n"
echo -e "Enter your selection \c"
read answer
case "$answer" in
1) sub_menu1 ;;
2) sub_menu2 ;;
3) exit ;;
esac
echo -e "Enter return to continue \c"
read input
done
}

menu
