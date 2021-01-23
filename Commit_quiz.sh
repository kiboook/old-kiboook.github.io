YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)

echo "> Git add Baekjoon Page ...\n"

git add _pages/BaekJoon.md

sleep 1

echo "> Git Commit ...\n"

git commit -m "[$YEAR.$MONTH.$DAY]"

sleep 1

echo "\n> Git Push ...\n"

git push -u origin master

echo "\n> SUCCESS PUSH [$YEAR.$MONTH.$DAY] Baekjoon Page"
