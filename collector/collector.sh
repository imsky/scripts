#!/bin/sh
if [ $# -ne 4 ]
then
	echo "Usage:\t`basename $0` [base] [pattern] [count] [output]"
	echo "\t[base] is the base directory for collection\n\t[pattern] is the 'find' glob pattern to search \n\t[count] is the number of files to collect\n\t[output] is the output directory for the generated archive"
exit
fi

FILENAME=$(date +%F_%N)
FILELIST=list_$FILENAME.txt
TMPDIR=/tmp/$FILENAME
INDIR=$(readlink -f "$1")
OUTDIR=$(readlink -f "$4")

#Create and populate temporary directory
mkdir $TMPDIR
echo "Finding matching files"
find "$INDIR" -iname $2 | shuf -n $3 > $TMPDIR/$FILELIST
echo "Moving found files to temporary directory"
rsync --remove-source-files --files-from=$TMPDIR/$FILELIST / $TMPDIR

#Flatten temporary directory
echo "Flattening temporary directory"
find $TMPDIR -mindepth 2 -type f -exec mv -i -t $TMPDIR {} +
find $TMPDIR -mindepth 1 -type d -exec rm -rf {} +

#Compress files and delete temporary directory
echo "Compressing files into an archive: $OUTDIR/$FILENAME.tar.gz"
tar -zcf "$OUTDIR/$FILENAME.tar.gz" -C $TMPDIR .
rm -rf $TMPDIR
echo "Done"
