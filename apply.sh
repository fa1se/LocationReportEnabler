PROPERTY='
gsm.sim.operator.numeric=310030
gsm.sim.operator.iso-country=us
'

for PROP in $PROPERTY; do
  NAME=${PROP%=*} VALUE=${PROP#*=}
  REPORT=$(getprop $NAME)
  TARGET=$(echo $REPORT | sed -r "s/[^,]{1,}/$VALUE/g") # dual-sim
  [ "$TARGET" = "$REPORT" ] || resetprop -n $NAME $TARGET
done
