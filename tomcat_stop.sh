# Script to Stop Tomcat

catalina_home="/opt/tomcat"
tomcat_pid="/var/run/tomcat/catalina.pid"

#checking if tomcat is installed
if [ ! -d "$catalina_home" ]
then
echo "Please check if tomcat is installed. Abording!"
exit
fi

#checking tomcat's PID
if [ ! -f "$tomcat_pid" ]
then
echo "Tomcat is already stopped. Abroding!"
exit
else
echo "Tomcat is running. Stopping Tomcat!"
sudo /etc/init.d/tomcat stop >/dev/null
fi

#this will scan logfile for every 10 secounds
while [ 1 ]
do
if grep -i "org.apache.catalina.core.StandardService stopInternal" /var/log/tomcat/catalina.out #>/dev/null
then
echo "Tomcat is stopped!"
exit
else
echo "Stopping tomcat is taking longer than expected.Please check logfile for more details!"
#sudo /etc/init.d/tomcat stop >/dev/null
fi
sleep 10
done
