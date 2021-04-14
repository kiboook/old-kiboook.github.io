YEAR=$(date +%Y)

MONTH=$(date +%m)
DAY=$(date +%d)

echo "> Git add Quiz and BaekJoon Page or Programmers Page ...\n"

git add _posts/Quiz
git add _pages/BaekJoon.md
git add _pages/Programmers.md

sleep 1

echo "> Git Commit ...\n"

git commit -m "[$YEAR.$MONTH.$DAY]"

sleep 1

echo "\n> Git Push ...\n"

git push -u origin master

echo "\n> SUCCESS PUSH [$YEAR.$MONTH.$DAY] Quiz and BaekJoon Page"
