ui_print '
This module will enable Google Location History.

Following properties will be changed:
 * gsm.sim.operator.numeric: 310030
 * gsm.sim.operator.iso-country: us

These packages will be cleared on next reboot:
 * com.google.android.gms
 * com.google.android.gsf
'

# clearing Google Play services crashes Magisk Manager
touch $MODPATH/pm-clear
