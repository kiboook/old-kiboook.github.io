---
title: "[BaekJoon] 백준 1780번 : 종이의 개수"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1780번 : 종이의 개수

<center><img width="1158" alt="paper" src="https://user-images.githubusercontent.com/54533309/93663442-0e045680-faa3-11ea-9794-d6bf8a13c33c.png">
</center>

<br><a href="https://nam-ki-bok.github.io/baekjoon/Baek_Z/" style="color:#0FA678">[BaekJoon] 백준 1074번 : Z</a>  문제를 풀었던게 많은 도움이 됐다.

N * N 의 크기에서 다른 숫자가 있다면 다시 N/3 * N/3 의 크기로 나누어 계속 확인을 한다.

N * N 에 다른 숫자가 있는지 확인 하는 부분의 시간 복잡도를 줄이려고 해보았다.

이중포문을 사용하면 시간초과가 걸릴 것 같아 리스트를 slice 해서 비교하는 방식을 사용했다.

```python
def check_paper(width, x, y):
	tmp = []
	for i in range(x, x + width):
		box = arr[i][y:y + width]
		tmp += box
		if len(set(tmp)) > 1:
			return [False, -1]

	return [True, tmp[0]]
```

그러나 시간초과가 발생했다.. 그래서 일단 이중포문으로 비교하는 방식으로 바꾸어 보았는데 통과를 했다 !!

이때 솔직히 파이썬에서 주로 사용하는 함수의 시간복잡도를 정확히 모르고 있었다는 느낌을 받았다.

이번주 안에 주로 사용하는 함수의 시간복잡도를 정리해봐야겠다.

---

```python
import sys


def check_paper(width, x, y):
	pivot = arr[x][y]
	for i in range(x, x + width):
		for j in range(y, y + width):
			if pivot != arr[i][j]:
				return [False, -1]
	return [True, pivot]


def make_paper(width, i, j):

	check = check_paper(width, i, j)
	if check[0]:
		count[check[1]] += 1
		return
	else:
		make_paper(width // 3, i, j)
		make_paper(width // 3, i, j + width // 3)
		make_paper(width // 3, i, j + width // 3 * 2)
		make_paper(width // 3, i + width // 3, j)
		make_paper(width // 3, i + width // 3, j + width // 3)
		make_paper(width // 3, i + width // 3, j + width // 3 * 2)
		make_paper(width // 3, i + width // 3 * 2, j)
		make_paper(width // 3, i + width // 3 * 2, j + width // 3)
		make_paper(width // 3, i + width // 3 * 2, j + width // 3 * 2)


N = int(input())
arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(N)]

count = {-1: 0, 0: 0, 1: 0}
make_paper(N, 0, 0)

for cnt in count.values():
	print(cnt)
```

<br>