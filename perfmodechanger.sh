echo "welcome to this piece of crap tech made by agentflemme, lmao"
echo "Checking root status"
if [ `id -u` == 0 ] ; then
        echo "Root status OK, launching the script !"
        else
        echo "Root not detected. consider checking if your device is rooted or if termux has root perms."
        exit 1
fi

#Automatic mode : Doesn't need any arguments and will only use Performance mode or Battery mode. Recommended for beginners.
if [[ $1 == "" ]] ; then
echo "checking power profile"
powah=$(cat /sys/devices/virtual/thermal/thermal_message/sconfig)

if [ ${powah} == -1 ] 
then
echo "Hey man, using this script for the first time ? initializing the script in Battery mode."
echo 0 > /sys/devices/virtual/thermal/thermal_message/sconfig
profile=battery
fi

if [ ${powah} == 0 ] 
then
echo "seems like your device is in battery mode, changing to performance mode"
echo 10 > /sys/devices/virtual/thermal/thermal_message/sconfig
profile=performance
fi

if [ ${powah} == 10 ] 
then
echo "seems like your device is in performance mode, changing to battery mode"
echo 0 > /sys/devices/virtual/thermal/thermal_message/sconfig
profile=battery

fi
echo "power profile successfully changed to $profile !"

fi
