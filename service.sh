#! /system/bin/sh

ALPHA='Verizon'
ISO_COUNTRY='us'
NUMERIC='310013'

PROP_NAME_ALPHA='gsm.sim.operator.alpha'
PROP_NAME_ISO_COUNTRY='gsm.sim.operator.iso-country'
PROP_NAME_NUMERIC='gsm.sim.operator.numeric'

set_prop() {
  for PROP in ALPHA ISO_COUNTRY NUMERIC; do
    eval PROP_NAME=$"PROP_NAME_$PROP" VALUE=$"$PROP"
    REPORT_VALUE=$(resetprop $PROP_NAME)
    TARGET_VALUE=$(echo $REPORT_VALUE | sed -r "s/[^,]{1,}/$VALUE/g")
    if [ "$REPORT_VALUE" != "$TARGET_VALUE" ]; then
      resetprop $PROP_NAME $TARGET_VALUE
    fi
  done
}

for i in $(seq 1 20); do 
  set_prop; sleep 9s
done

while true; do
  set_prop; sleep 1h
done
