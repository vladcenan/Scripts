#Bounce

norestart="/web/do.not.restart"
gnorestart="/web/gmap_service/do.not.restart"

adddonotrestart()
{
if [ ! -f "$norestart" ]
then
echo "Creating do not restart..."
sudo touch $norestart > /dev/null 2>&1
if [ -d /web/gmap_service ] && [ ! -f "$gnorestart" ]
then
sudo touch $gnorestart > /dev/null 2>&1
fi
fi
}

apache_stop()
{
if [ -f $norestart ]
then
echo "Stopping apache service..."
sudo /tmp/apache_stop.sh > /dev/null 2>&1
else
sudo touch $norestart > /dev/null 2>&1
sudo /tmp/apache_stop.sh > /dev/null 2>&1
fi
}

tomcat_stop()
{
if [ -f $norestart ]
then
echo "Stopping tomcat service..."
sudo /tmp/tomcat_stop.sh > /dev/null 2>&1
else
sudo touch $norestart > /dev/null 2>&1
sudo /tmp/tomcat_stop.sh > /dev/null 2>&1
fi
}
gmap_service_stop()
{
if [ -f $gnorestart ]
then
echo "Stopping gmap service..."
sudo /tmp/gmap_service_stop.sh > /dev/null 2>&1
else
sudo touch $gnorestart > /dev/null 2>&1
sudo /tmp/gmap_service_stop.sh > /dev/null 2>&1
fi
}

tomcat_start()
{
if [ -f $norestart ]
then
echo "Starting tomcat service..."
sudo /tmp/tomcat_start.sh > /dev/null 2>&1
fi
}

gmap_service_start()
{
if [ -f $norestart ]
then
echo "Starting gmap service..."
sudo /tmp/gmap_service_start.sh > /dev/null 2>&1
fi
}

apache_start()
{
if [ -f $norestart ]
then
echo "Starting apache service..."
sudo /tmp/apache_start.sh > /dev/null 2>&1
fi

}

removedonotrestart()
{
if [ -f "$norestart" ]
then
echo "Removing do not restart..."
sudo rm $norestart > /dev/null 2>&1
if [ -d /web/gmap_service ] && [ -f "$gnorestart" ]
then
sudo rm $gnorestart > /dev/null 2>&1
fi
fi
}

adddonotrestart
apache_stop
tomcat_stop
gmap_service_stop
tomcat_start
gmap_service_start
apache_start
removedonotrestart
