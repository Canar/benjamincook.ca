#!/usr/bin/env bash
JPEG="jpe?g$"
echo "Importing $1..."
if [[ $1 =~ $JPEG ]] ; then
	mv "$1" /srv/http/benjamincook.ca/site/blog/`./datepoch.sh "$1"`.jpeg
fi
./regen.sh
