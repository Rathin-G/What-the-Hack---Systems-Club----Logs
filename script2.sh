
if [ $# -eq 0 ]; then
    exit 1
fi

while [ "$1" != "" ]; do
	case $1 in
		--prod)
			while true
			do
				cat system.log>>sys2.log
				./backupscript.sh
				sleep 300
			done
			;;
		--test)
			while true
			do
				cat system.log>>sys2.log
				./backupscript.sh
				sleep 10
			done
			;;
	esac
done
	
