#!/usr/bin/env bash
# This script adds all paths (separated by a newline) in ~/.path to the PATH
# Running it adds it to the user's .bashrc, so it's always executed

DIRS=$(tr '\n' ':' < ~/.path)
export PATH="$DIRS$PATH"

if [ X"$0" = X"pathloader.sh" ]
then
	echo "Copying pathloader.sh to ~/"
	cp $0 ~/pathloader.sh
fi

if grep -q pathloader.sh ~/.bashrc
then
	:
else
	printf ". ~/pathloader.sh\n" >> ~/.bashrc
	echo "Added path loader to .bashrc"
fi
