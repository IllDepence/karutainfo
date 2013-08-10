#! /bin/sh

wget -O webpage http://www.karuta.or.jp/ > /dev/null 2>&1
newlast=`cat webpage | grep -Po 'href="topic/\d{8}\w?.html"' | grep -Po '\d{8}' | head -n 1`
oldlast=`tail dates -n 1`
if [ $newlast -gt $oldlast  ]
then
year=`echo $newlast | grep -Po '^\d{4}'`
month=`echo $newlast | grep -Po '\d{4}$' | grep -Po '^\d{2}'`
day=`echo $newlast | grep -Po '\d{2}$'`
echo "new karuta event: $year/$month/$day (check out: http://www.karuta.or.jp/)" | mailx -s "new karuta event" `cat mailaddr0`
echo $newlast >> dates
fi
