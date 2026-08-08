Y="$(cat  system.log| sed 1q | awk '{print $5 $6}')"
Z="$(cat  system.log| tail --lines=9|grep Timestamp:| awk '{ print$5 $6}')"
X=bak-system-"$Y"-"$Z".txt
W=bak-system-"$Y"-"$Z".tar.gz
touch "$X"
cat sys2.log>>"$X"
tar --force-local -cvzf "$W" "$X"

