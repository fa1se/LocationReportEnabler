# fake-gsm-sim-operator

Location Report Enabler with Magisk.

## How it works

With the power of Magisk and [resetprop](https://github.com/topjohnwu/Magisk/blob/master/docs/tools.md#resetprop), a simple shell script runs in the background to constantly check and update these following properties:

* `gsm.sim.operator.numeric`, default to `310680`
* `gsm.sim.operator.iso-country`, default to `us`
* `gsm.sim.operator.alpha`, default `AT&T`

Dual SIM is also supported. See more MCCs and MNCs from [here](https://www.mcc-mnc.com/).

## Customize

Change these variables in `service.sh` if you want a different value:

```sh
ALPHA='AT\&T' # sed: escape if necessary
ISO_COUNTRY='us'
NUMERIC='310680'
```

Or if you want some more complex behavior(eg. different values for different slots), simply modify `set_prop()` to your like.  

Unlike [Xposed](https://github.com/GhostFlying/LocationReportEnablerXposed) or [Riru](https://github.com/RikkaApps/Riru-LocationReportEnabler) versions, this module isn't capable of hooking metheds directly. Instead, properties are read periodically and updated if changed by other services.

```sh
for i in $(seq 1 60); do
  set_prop; sleep 1.5
done
while true; do
  set_prop; sleep 180
done
```

By default, properties are visited frequently right after boot time and every 3 minute afterwards.  
Change this you want, but with lower frequency the script tends to malfunction somehow.
