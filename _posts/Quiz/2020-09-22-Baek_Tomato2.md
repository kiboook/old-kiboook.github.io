---
title: "[BaekJoon] 백준 7576번 : 토마토"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 7576번 : 토마토

<center><img width="1154" alt="Tomato2" src="https://user-images.githubusercontent.com/54533309/93891309-41a2e300-fd26-11ea-9dbc-475024312a38.png">
</center>

<br><a href="https://nam-ki-bok.github.io/baekjoon/Baek_Tomato/" style="color:#0FA678">[BaekJoon] 백준 7569번 : 토마토</a> 문제와 100% 똑같은 문제이다.

다만 농장이 3차원이 아닌 2차원인 문제..

똑같이 BFS 를 통해 앞, 뒤, 왼쪽, 오른쪽을 방문하면 된다.

---

```python
import sys
from collections import deque


def check_tomato_min_day(arr, m, n):
	box = arr[:]
	row, col = n, m
	day = 0
	queue = deque()
	for i in range(row):
		for j in range(col):
			if box[i][j] == 1:
				queue.append([i, j, day])

	while queue:
		dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]]
		cur_i, cur_j, cur_day = queue.popleft()

		for val in dirs:
			visit_i = cur_i + val[0]
			visit_j = cur_j + val[1]

			if 0 <= visit_i < row and 0 <= visit_j < col and box[visit_i][visit_j] == 0:
				queue.append([visit_i, visit_j, cur_day + 1])
				box[visit_i][visit_j] = cur_day + 1

	for i in range(row):
		for j in range(col):
			if box[i][j] == 0:
				return -1

	return cur_day


in_m, in_n = map(int, input().rsplit())
in_arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(in_n)]
print(check_tomato_min_day(in_arr, in_m, in_n))
```

<br>