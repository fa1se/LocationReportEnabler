# fake-gsm-sim-operator

[Location Report Enabler](https://github.com/GhostFlying/LocationReportEnabler) with Magisk.

## How it works

With the power of Magisk and [resetprop](https://github.com/topjohnwu/Magisk/blob/master/docs/tools.md#resetprop), fake_gsm_sim_operator runs in the background to constantly check and update these following properties:

* `gsm.sim.operator.numeric`, default to `310013`
* `gsm.sim.operator.iso-country`, default to `us`
* `gsm.sim.operator.alpha`, default to `Verizon`

Dual SIM is also supported.

## Customize

Change these variables in `service.sh`(see more MCCs and MNCs from [here](https://www.mcc-mnc.com/)):

```sh
ALPHA='Verizon' # sed: escape if necessary, eg. 'AT\&T'
ISO_COUNTRY='us'
NUMERIC='310013'
```

Or if you want some more complex behavior(eg. different values for different slots), simply modify `set_prop()` to your like.  

Unlike [Xposed](https://github.com/GhostFlying/LocationReportEnablerXposed) or [Riru](https://github.com/RikkaApps/Riru-LocationReportEnabler) versions, this module isn't capable of hooking metheds directly. Instead, properties are read periodically and updated if changed by other services.

```sh
for i in $(seq 1 ...); do 
  set_prop; sleep ...
done
while true; do
  set_prop; sleep ...
done
```

By default, properties are visited frequently right after boot time and less so afterwards. Change this if you want, but with lower frequency the script tends to malfunction.
