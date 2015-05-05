# Apache Start Script


apache_conf="/etc/httpd/conf/httpd.conf"
httpd_pid="/var/run/httpd/httpd.pid"
status=$(service apache2 status)


if [ ! -f $apache_conf ]
then
echo "httpd.conf was not found. Check if Apache is installed!"
exit
fi


if [ -f $httpd_pid ]
then
echo "Apache is already running...Abording!"
exit
else
if [[ "$status" == "httpd.worker is stopped" ]]
then
echo "Apache is stopped...Apache will be started!"
sudo /etc/init.d/apache2 start
exit
fi
fi
