if [ $# -ne 2 ]
then
	echo "Usage: md5name.sh [base] [pattern]"
	echo "Where [base] is the base directory and [pattern] is the glob pattern. The pattern is not processed recursively."
exit
fi

dir=$(readlink -f "$1")

for i in "$dir"/$2
do
filename=$(basename "$i")
extension="${filename##*.}"
newname=$(md5sum "$dir/$filename" | cut -d ' ' -f 1 -).$extension
mv "$dir/$filename" "$dir"/$newname
done
