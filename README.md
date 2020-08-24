# fake_gsm_sim_operator

[Location Report Enabler](https://github.com/GhostFlying/LocationReportEnabler) with Magisk.

## How it works

Using [resetprop](https://github.com/topjohnwu/Magisk/blob/master/docs/tools.md#resetprop), fake_gsm_sim_operator runs in the background to constantly check and update these following properties:

* `gsm.sim.operator.numeric`, default to `310013`
* `gsm.sim.operator.iso-country`, default to `us`
* `gsm.sim.operator.alpha`, default to `Verizon`

Dual SIM is also supported.

## Customize

Modify these variables in `service.sh`(see more MCCs and MNCs from [here](https://www.mcc-mnc.com/)):

```sh
ALPHA='Verizon' # sed: escape if necessary, eg. 'AT\&T'
ISO_COUNTRY='us'
NUMERIC='310013'
```

Or if you want something more complicated(eg. dual SIM with different properties), simply change `set_prop()` to your like.  

Unlike [Xposed](https://github.com/GhostFlying/LocationReportEnablerXposed) or [Riru](https://github.com/RikkaApps/Riru-LocationReportEnabler) versions, this module isn't capable of hooking metheds. Instead, properties are read periodically and updated if changed by other services.

```sh
for i in $(seq 1 20); do 
  set_prop; sleep 9s
done
while true; do
  set_prop; sleep 1h
done
```

By default, properties are visited frequently right after at startup and less so afterwards. These can be altered, but with lower frequency the script tends to malfunction.
