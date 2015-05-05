# gmap_service Start Script


gmap_service_conf="/etc/rc.d/init.d/gmap_service.sh"
gmap_service_pid="/var/run/gmap/gmap_service"
gmap_donotrestart="/web/gmap_service/do.not.restart"
status='sudo /etc/init.d/gmap_service status'


if [ ! -f $gmap_service_conf ]
then
echo "gmap_service was not found. Check if gmap_service is installed!"
exit
fi



if [ -f $gmap_donotrestart ]
then
sudo rm $gmap_donotrestart > /dev/null 2>&1
fi



# if [[ ! "$status == gmap_service[1-8] is stopped." ]]
# then
# echo "gmap is running..."
# exit
# fi



for i in $(seq 1 8); do
if [ -f "$gmap_service_pid$i.pid" ]
then
echo "gmap_service is already running. Abording!"
break
else
echo "gmap_service is stopped...gmap_service will be started!"
sudo /etc/init.d/gmap_service start
break
fi


done
