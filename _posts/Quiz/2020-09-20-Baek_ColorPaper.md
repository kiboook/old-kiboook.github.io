---
title: "[BaekJoon] 백준 2630번 : 색종이 만들기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2630번 : 색종이 만들기

<center><img width="1150" alt="Color Paper 1" src="https://user-images.githubusercontent.com/54533309/93698261-cf2cda00-fb50-11ea-8a5c-d5c40be90d3a.png">
</center>

<center><img width="1150" alt="Color Paper 2" src="https://user-images.githubusercontent.com/54533309/93698179-c936f900-fb50-11ea-88de-5e0e3b6fcafe.png">
</center>

<br><a href="https://nam-ki-bok.github.io/baekjoon/Baek_Paper/" style="color:#0FA678">[BaekJoon] 백준 1780번 : 종이의 개수</a> 는 9등분을 했지만 이 문제는 4등분을 하는 문제이다.

재귀를 이용하여 왼쪽 위, 오른쪽 위, 왼쪽 아래, 오른쪽 아래로 나누어 다시 계산을 반복하면 된다.

N * N 안에 모두 같은 색으로만 이루어져 있는지 확인은 시작 좌표 값을 기준 삼아 다른 값이 있다면 바로 멈추었다.

재귀문제를 많이 풀어봐야 할 것 같다.. 맨 처음 재귀 문제를 풀땐 도통 이해가 안갔는데 요새들어 조~금 이해가 간다..

---

```python
import sys


def check_paper(width, x, y):
	pivot = arr[x][y]
	for i in range(x, x + width):
		for j in range(y, y + width):
			if arr[i][j] != pivot:
				return [False, -1]
	return [True, pivot]


def make_paper(width, i, j):
	check = check_paper(width, i, j)
	if check[0]:
		count[check[1]] += 1
		return

	else:
		make_paper(width // 2, i, j)
		make_paper(width // 2, i, j + width // 2)
		make_paper(width // 2, i + width // 2, j)
		make_paper(width // 2, i + width // 2, j + width // 2)


N = int(input())
arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(N)]
count = {0: 0, 1: 0}
make_paper(N, 0, 0)

for val in count.values():
	print(val)
```

<br>