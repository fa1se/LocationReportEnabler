# Location Report Enabler

[Location Report Enabler](https://github.com/GhostFlying/LocationReportEnabler) with Magisk.

## How it works

This module will start a cron job to constantly update these properties using [resetprop](https://github.com/topjohnwu/Magisk/blob/master/docs/tools.md#resetprop):

- `[gsm.sim.operator.numeric]: [310030]`
- `[gsm.sim.operator.iso-country]: [us]`

Also on first reboot after installation, data of the following packages will be cleared:

- `com.google.android.gms`
- `com.google.android.gsf`
