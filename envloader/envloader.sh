#!/usr/bin/env bash

# This script sets all environment variables in ~/.env to the PATH
# Each line in ~/.env should have a variable, a tab, and a value. Example:
# PATH	/home/user/bin
# Each value is prepended to the existing value, so the above line is interpreted as:
# export PATH=/home/user/bin:$PATH
# Running this script directly adds it to the user's .bashrc, so it's always executed

if [ X"$0" = X"envloader.sh" ]
then
	echo "Copying envloader.sh to ~/"
	cp $0 ~/envloader.sh
fi

if grep -q envloader.sh ~/.bashrc
then
	:
else
	printf ". ~/envloader.sh\n" >> ~/.bashrc
	echo "Added environment loader to .bashrc"
fi

while read line; do
VAR=${line%'	'*}
DIR=${line#*'	'}
export $VAR="$DIR:"$(printenv $VAR)
done < ~/.env