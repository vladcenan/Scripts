# Apache Stop Script


apache_conf="/etc/httpd/conf/httpd.conf"
httpd_pid="/var/run/httpd/httpd.pid"
status=$(service apache2 status)
apachepid=$(awk '{print $1}' /var/run/httpd/httpd.pid)


if [ ! -f $apache_conf ]
then
echo "httpd.conf was not found.Check if Apache is installed!"
exit
fi


if [ ! -f $httpd_pid ]
then
echo "Apache is already stopped!"
exit
else
if [ pgrep $apacheid > /dev/null 2>&1 ]
then
echo "Apache is running...Apache will be stopped!"
sudo service apache2 stop
exit
fi
fi
#
#
#
#if [[ ! "$status" == "httpd.worker is stopped" ]]; then
# echo "Apache is already stopped"
# exit
#fi
#
#if [ -f $http_pid ]
# then
# echo "Apache is running...Apache will be stopped!"
# sudo service apache2 stop
# exit
# else
# echo "Apache is already stopped!"
# exit
#fi
