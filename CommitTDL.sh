echo "Now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"

YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)

echo "> Git add TIL ..."

git add _posts/TDL/$YEAR-$MONTH-$DAY-$(date +%y)$MONTH$(date +%d)TDL.md

sleep 1

echo "> Git Commit ..."

git commit -m "[$YEAR.$MONTH.$DAY] Done :)"

sleep 1

echo "> Git Push ..."

git push -u origin master

echo "> SUCCESS PUSH [$YEAR.$MONTH.$DAY] TDL"
