---
title:  "[BaekJoon] 1012번 : 유기농 배추"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1012번 : 유기농 배추

<center><img width="1157" alt="Cabbage" src="https://user-images.githubusercontent.com/54533309/92329022-b2e46400-f09f-11ea-86da-0c62aa033892.png">
</center>




<br>

배추에 지렁이를 놓아 배추를 살려보자.. 이런 문제지만 결국 배열 안에 상하좌우로 연결되어있는 그래프 개수를 찾는 문제이다.

DFS, BFS 를 통해 그래프를 찾으면 된다. 나는 스택보단 개인적으로 큐가 좋아 BFS 를 사용했다.

그리고 이 문제가 X, Y 좌표를 거꾸로 놔서 진짜 헷갈렸다.. 왜 이렇게 내는건지 진짜 이해 못하겠음.. 너무 화났다..

행렬 i, j 위치로 따지면 안되고 좌표평면 X, Y 로 따져야 한다. 😡🤬😡🤬🤯

배추가 있는 위치는 1 이지만 방문을 하면 0 으로 바꾸어 준다.

상하좌우 가 전부 배추가 없을 때 까지 돌면 벌레 수를 한 마리 올린다. 결국 BFS 를 몇 번 수행했나를 구하면 된다 !

처음엔 좌표평면을 문자열로 두고 풀어보려다 엄청 고생만 하고 실패했다..

결국 정석대로 풀었는데도 처음에 시간초과가 발생했다. 19 번째 줄 코드를 작성 하지 않았던게 이유였다.

거기서 0 으로 바꾸어 주지 않아도 어차피 13 번째 줄 에서 바꾸어 주니까 상관 없을 것 같았지만

배추가 사각형으로 놓여져 있으면 중복 된 위치가 계속 큐에 들어가 괜히 시간만 잡아먹고 있었다.

내가 서있는 배추 기준으로 주위에 있는 배추는 바로 0 으로 바꾸어 버리면 통과한다.

---

```python
import sys
from collections import deque


def BFS(x, y):
	start_loc = [x, y]
	queue = deque([start_loc])
	dirs = [[0, 1], [0, -1], [-1, 0], [1, 0]]

	while queue:
		print(queue)
		i, j = queue.popleft()
		cabbage_map[i][j] = 0

		for dir in dirs:
			go_x, go_y = i + dir[0], j + dir[1]

			if 0 <= go_x < N and 0 <= go_y < M and cabbage_map[go_x][go_y] == 1:
				cabbage_map[go_x][go_y] = 0
				queue.append([go_x, go_y])

	return 1


T = int(input())

for _ in range(T):
	bugs = 0
	M, N, K = map(int, sys.stdin.readline().rsplit())
	cabbage_map = [[0] * M for _ in range(N)]

	for _ in range(K):
		x, y = map(int, sys.stdin.readline().rsplit())
		cabbage_map[y][x] = 1

	for x in range(N):
		for y in range(M):
			if cabbage_map[x][y] == 1:
				bugs += BFS(x, y)

	print(bugs)
```
