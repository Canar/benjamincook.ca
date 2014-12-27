TZ=America/Vancouver date -d "`stat -c %z $1`" "+%s"
