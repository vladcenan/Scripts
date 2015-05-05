# gmap_service Stop Script


gmap_service_conf="/etc/rc.d/init.d/gmap_service.sh"
gmap_service_pid="/var/run/gmap/gmap_service"
gmap_donotrestart="/web/gmap_service/do.not.restart"


if [ ! -f $gmap_service_conf ]
then
echo "gmap_service was not found.Check if gmap_service is installed!"
exit
fi


if [ ! -f $gmap_donotrestart ]
then
sudo touch $gmap_donotrestart > /dev/null 2>&1
fi


for i in $(seq 1 8); do
if [ -f "$gmap_service_pid$i.pid" ]
then
echo "gmap_service is running. gmap_service will be stopped!"
sudo /etc/init.d/gmap_service stop
break
else
echo "gmap_service is already stopped.Abording!"
break
fi
done
