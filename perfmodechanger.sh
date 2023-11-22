echo "welcome to this piece of crap tech made by agentflemme, lmao"

#profiler function, detects current power plan
function profiler {
funnynumber=$(cat /sys/devices/virtual/thermal/thermal_message/sconfig)
if [[ $funnynumber == "-1" ]] ; then
profile=bugged
fi
if [[ $funnynumber == "0" ]] ; then 
profile=battery
fi
if [[ $funnynumber == "10" ]] ; then
profile=performance
fi
if [[ $funnynumber == "20" ]] ; then
profile=mgame 
fi
}

#root status check
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
profiler

if [[ $profile == "bugged" ]] ; then
echo "Power profile bugged, setting profile to battery"
echo 0 > /sys/devices/virtual/thermal/thermal_message/sconfig
fi

if [[ $profile == "battery" ]] ; then
echo "seems like your device is in battery mode, changing to performance mode"
echo 10 > /sys/devices/virtual/thermal/thermal_message/sconfig
fi

if [[ ${powah} == performance ]] ; then
echo "seems like your device is in performance mode, changing to battery mode"
echo 0 > /sys/devices/virtual/thermal/thermal_message/sconfig
fi


profiler
echo "power profile successfully changed to $profile !"
exit 1
fi

#Interactive mode, if you want to switch manually to a specific mode.

if [[ $1 == "-i" ]] ; then
profiler
echo -e "Current power profile is $profile.\nAvailable power profiles :\n - Battery 0\n - Nolimits (Performance+NoThermals) 1\n - MGame (Performance) 2"
read choice

if [[ $choice == 0 ]] ; then
echo 0 > /sys/devices/virtual/thermal/thermal_message/sconfig
fi
if [[ $choice == 1 ]] ; then
echo 10 > /sys/devices/virtual/thermal/thermal_message/sconfig
fi
if [[ $choice == 2 ]] ; then
echo 20 > /sys/devices/virtual/thermal/thermal_message/sconfig
fi

if [[ $choice != 0 || $choice != 1 || $choice != 2 ]] ; then
echo "wrong choice try again"
exit 1
fi

profiler ; echo "Power profile changed to $profile"
exit 1
fi

#Arguments Mode, to switch plans fast
if [[ $1 == "0" ]] ; then
echo 0 > /sys/devices/virtual/thermal/thermal_message/sconfig
fi
if [[ $1 == "10" ]] ; then
echo 10 > /sys/devices/virtual/thermal/thermal_message/sconfig
fi
if [[ $1 == "20" ]] ; then
echo 20 > /sys/devices/virtual/thermal/thermal_message/sconfig
fi
