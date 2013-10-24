mkdir $2
echo Copying Toolbar Customizations
cp $1/localstore.rdf $2
echo Copying Bookmarks
cp $1/places.sqlite $2
echo Copying Passwords
cp $1/key3.db $2/
cp $1/signons.sqlite $2/
echo Copying Site Preferences
cp $1/permissions.sqlite $2/
echo Copying Search Engines
cp $1/search.sqlite $2/
cp $1/search.json $2/
cp -R $1/searchplugins $2/
echo Copying Search Options
cp $1/search-metadata.json $2/
echo Copying Personal Dictionary
cp $1/persdict.dat $2/
echo Copying Security Certificate Settings
cp $1/cert8.db $2/
echo Copying Extensions
cp -R $1/extensions $2/
cp $1/extensions.sqlite $2/
echo Copying Preferences
cp $1/prefs.js $2/
echo Delete $2/prefs.js if your preferences were corrupt
if [ -e $1/adblockplus ]
then
cp -R $1/adblockplus $2/
fi
