for i in $1
do
filename=$(basename "$i")
extension="${filename##*.}"
newname=$(md5sum "$filename" | cut -d ' ' -f 1 -).$extension
mv "$filename" $newname
done
