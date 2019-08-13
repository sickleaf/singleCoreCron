#!/bin/sh

# in cron file, setting are written below
# */1 * * * * bash ~/repository/scheduler/execSchedule.sh ~/repository/scheduler/schedule/

schedulePath=$1

dateA=`LANG=C; date "+%a"`
dateHHMM=`LANG=C; date "+%H%M"`

find ${schedulePath} -type f |
while read f; do

	cat ${f} | 
	grep -E "${dateA}||ALL" |
	grep ${dateHHMM} |
	while read d; do
		cmd=`echo "${d}" | cut -d"," -f3`
		redirect=`echo "${d}" | cut -d"," -f4`
		args=`echo "${d}" | cut -d"," -f5-`
	#	echo "[(each line)]"${d}
	#	echo "[cmd]"${cmd}
	#	echo "[redirect]"${redirect}
	#	echo "[args]"${args}
		nohup bash ${cmd} "${args}" >> ${redirect} &
	done

done
