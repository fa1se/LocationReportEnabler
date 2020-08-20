#! /system/bin/sh

ALPHA='AT\&T'
ISO_COUNTRY='us'
NUMERIC='310680'

set_prop() {
  REPORT_ALPHA=$(resetprop gsm.sim.operator.alpha)
  TARGET_ALPHA=$(echo $REPORT_ALPHA | sed -r "s/[^,]{1,}/$ALPHA/g")
  if [ "$REPORT_ALPHA" != "$TARGET_ALPHA" ]; then
    resetprop gsm.sim.operator.alpha $TARGET_ALPHA; fi
  REPORT_ISO_COUNTRY=$(resetprop gsm.sim.operator.iso-country)
  TARGET_ISO_COUNTRY=$(echo $REPORT_ISO_COUNTRY | sed -r "s/[^,]{1,}/$ISO_COUNTRY/g")
  if [ "$REPORT_ISO_COUNTRY" != "$TARGET_ISO_COUNTRY" ]; then
    resetprop gsm.sim.operator.iso-country $TARGET_ISO_COUNTRY; fi
  REPORT_NUMERIC=$(resetprop gsm.sim.operator.numeric)
  TARGET_NUMERIC=$(echo $REPORT_NUMERIC | sed -r "s/[^,]{1,}/$NUMERIC/g")
  if [ "$REPORT_NUMERIC" != "$TARGET_NUMERIC" ]; then
    resetprop gsm.sim.operator.numeric $TARGET_NUMERIC; fi
}

for i in $(seq 1 60); do 
  set_prop; sleep 1.5
done

while true; do
  set_prop; sleep 180
done

