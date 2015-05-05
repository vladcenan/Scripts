#!/bin/bash


shutdown_tomcat() {
local sleep_time=$2
local tries_number=$3
local required_cmds=(jps grep ps kill)
#check if we have the required tools
for cmd in "${required_cmds[@]}"; do
which $cmd > /dev/null 2>&1 || {
echo "ERROR: $cmd command not found! Maybe you need to set PATH env variable?"
return 1
}
done
# check if catalina_home is set
if [ "${catalina_home}none" == "none" ]; then
echo "ERROR: Please set catalina_home env variable! Aborting..."
return 1
fi
local tomcat_jps="$(jps -l | grep $1)"
local tomcat_pid="${tomcat_jps%% *}"
local tomcat_shutdown_script="sudo /etc/init.d/tomcat stop"


#checking if tomcat PID was found for passed in process name


if [ "${tomcat_pid}none" == "none" ]; then
echo "ERROR: Catalina PID for process name $1 not found! Maybe tomcat is not running?"
return 1
fi
#executing the shutdown script
$tomcat_shutdown_script > /dev/null 2>&1
#checking at a regular interval of sleep_time seconds for a max of number of tries for Catalina's process
while true
do
ps -p $tomcat_pid > /home/teleptean/stop_tomcat.log 2>&1 #/dev/null 2>&1
local ret=$?
# echo "Return Value=$ret" echo "tomcat_pid=$tomcat_pid"


if [ $ret != "1" ]; then
echo "INFO: Catalina service didn't stop yet, checking in ${sleep_time} seconds..."
echo "INFO: Number of tries left: ${tries_number}"
let tries_number=tries_number-1
if [ "$tries_number" == "0" ]; then
echo "INFO: Catalina service didn't stop gracefully, shutting it down forcibly..."
echo "INFO: Killing process with PID: ${tomcat_pid}."
kill -9 $tomcat_pid > /dev/null 2>&1
if [ "$?" != "0" ]; then
echo "ERROR: Could not kill process! Maybe you're not the owner of the process?"
return 1
fi
return 0
fi
sleep $sleep_time
else
echo " INFO: Catalina service running with PID $tomcat_pid was shutdown. "
return 0
fi
done
}
stop_tomcat() {
catalina_home=/opt/tomcat/
tomcat_process_name=catalina
sleep_time=4
tries_number=5
#call the shutdown tomcat function passing in the TOMCAT_PROCESS variable as an argument
shutdown_tomcat $tomcat_process_name $sleep_time $tries_number
}
stop_tomcat
exit $?
