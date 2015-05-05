# Script to Start Tomcat

catalina_home="/opt/tomcat"
tomcat_pid="/var/run/tomcat/catalina.pid"

#checking if tomcat is installed
if [ ! -d "$catalina_home" ]
then
echo "Please check if tomcat is installed. Abording!"
exit
fi

#checking tomcat's PID
if [ -f "$tomcat_pid" ]
then
echo "Tomcat is already running. Abroding!"
exit
else
echo "Tomcat is stopped. Starting Tomcat!"
sudo /etc/init.d/tomcat start >/dev/null
fi

#this will scan the logfile for every 10 seconds
while [ 1 ]
do
if grep -i "org.apache.catalina.startup.Catalina start" /var/log/tomcat/catalina.out #>/dev/null
then
echo "Tomcat is started!" | exit
exit
fi
sleep 10
done
