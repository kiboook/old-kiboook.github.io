YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)

echo "> Git add TIL ...\n"

git add _posts/TDL/$YEAR-$MONTH-$DAY-$(date +%y)$MONTH$(date +%d)TDL.md

sleep 1

echo "> Git Commit ...\n"

git commit -m "[$YEAR.$MONTH.$DAY] Done :)"

sleep 1

echo "\n> Git Push ...\n"

git push -u origin master

echo "\n> SUCCESS PUSH [$YEAR.$MONTH.$DAY] TIL"
