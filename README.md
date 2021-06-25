# LocationReportEnabler

[Location Report Enabler](https://github.com/GhostFlying/LocationReportEnabler) with Magisk.

## How it works

With the power of [resetprop](https://github.com/topjohnwu/Magisk/blob/master/docs/tools.md#resetprop), this module runs a simple [script](service.sh) to constantly update these following properties:

- `gsm.sim.operator.numeric`, set to `310013`
- `gsm.sim.operator.iso-country`, set to `us`
- `gsm.sim.operator.alpha`, set to `Verizon`

*You may also want to clear the data of Google Play services the first time you flash this.*
