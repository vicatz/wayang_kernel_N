#!/sbin/sh

CONFIGFILE="/tmp/init.wayang.rc"

DFSC=`grep "item.0.1" /tmp/aroma/mods.prop | cut -d '=' -f2`
if [ $DFSC = 0 ]; then
DFS=0
elif [ $DFSC = 1 ]; then
DFS=1
fi
FC=`grep "item.0.2" /tmp/aroma/mods.prop | cut -d '=' -f2`
if [ $FC = 1 ]; then
USB=1
elif [ $FC = 0 ]; then
USB=0
fi
FLS=`grep "item.0.3" /tmp/aroma/mods.prop | cut -d '=' -f2`
if [ $FLS = 1 ]; then
FLASH=0
elif [ $FLS = 0 ]; then
FLASH=200
fi
echo "    # USB FAST CHARGE" >> $CONFIGFILE
echo "    write /sys/kernel/fast_charge/force_fast_charge $USB" >> $CONFIGFILE
echo "    # FSYNC" >> $CONFIGFILE
echo "    write /sys/module/sync/parameters/fsync_enabled $DFS" >> $CONFIGFILE
echo "    # FLASH" >> $CONFIGFILE
echo "    write /sys/devices/soc/qpnp-flash-led-25/leds/led:torch_1/max_brightness $FLASH" >> $CONFIGFILE
