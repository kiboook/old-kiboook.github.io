---
title: "[BaekJoon] 백준 2667번 : 단지번호붙이기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2667번 : 단지번호붙이기

<center><img width="1152" alt="Hometown" src="https://user-images.githubusercontent.com/54533309/92996945-7060d280-f54a-11ea-979f-95e4fe76ed93.png">
</center>

<br>

<a href="https://nam-ki-bok.github.io/baekjoon/Baek_Cabbage/" style="color:#0FA678">[BaekJoon] 1012번 : 유기농 배추</a> 문제와 유사한 유형이다.

배추 문제는 BFS 수행 횟수만 반환하면 됐지만 이 문제는 수행 횟수와 각 BFS 마다 순회 한 횟수까지 반환하면 된다.

배열의 (0, 0) 에서부터 (N - 1, N - 1) 까지 전부 돌면서 1 인경우만 BFS 를 수행 하면 된다.

BFS 를 수행 하면서 방문 하는 집은 모두 0 으로 바꾸어 버리고 방문 횟수를 따로 저장해 반환한다.

---

```python
import sys
from collections import deque


def BFS(arr, start_loc):
	home_cnt = 0
	queue = deque([start_loc])
	dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]]

	while queue:
		cur_i, cur_j = queue.popleft()
		arr[cur_i][cur_j] = 0
		home += 1

		for dir in dirs:
			go_i = cur_i + dir[0]
			go_j = cur_j + dir[1]

			if 0 <= go_i < len(arr) and 0 <= go_j < len(arr) and arr[go_i][go_j] == 1:
				queue.append([go_i, go_j])
				arr[go_i][go_j] = 0

	return home_cnt


def find_hometown(arr):
	hometown = []

	for i in range(len(arr)):
		for j in range(len(arr)):
			if arr[i][j] == 1:
				hometown.append(BFS(arr, [i, j]))

	print(len(hometown))
	for i in sorted(hometown):
		print(i)


N = int(input())
_arr = [[int(x) for x in sys.stdin.readline().rsplit()[0]] for _ in range(N)]
find_hometown(_arr)
```

