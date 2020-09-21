---
title: "[BaekJoon] 백준 7569번 : 토마토"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 7569번 : 토마토

<center><img width="1163" alt="Tomato" src="https://user-images.githubusercontent.com/54533309/93758600-b7824e00-fc43-11ea-99b8-2750f08256ad.png">
</center>

<br>BFS 를 이용해 푸는 문제이다.

특이한 점은 매번 2차원 배열에서만 BFS 를 했는데 3차원 배열에서 BFS 를 수행 해야 한다는 부분이다.

2차원 배열에선 앞, 뒤, 왼쪽, 오른쪽을 방문했다면 3차원 배열에서는 위, 아래, 앞, 뒤, 왼쪽, 오른쪽을 방문하면 된다.

날짜를 최단 거리로 생각하면 다른 최단거리 문제와 똑같은 문제이다.

하지만 마지막에 익지 않은 토마토가 있는 경우를 따져줘야 하는데 BFS 를 수행 한 뒤

배열을 한 번 쭉 훑으면서 배열에 0 이 있다면 -1을 출력하면 된다.

---

```python
import sys
from collections import deque


def check_tomato(box, M, N, H):
	queue = deque()
	for h in range(H):
		for i in range(N):
			for j in range(M):
				if box[h][i][j] == 1:
					queue.append([h, i, j, 0])

	while queue:
		dirs = [[-1, 0, 0], [1, 0, 0], [0, 0, -1], [0, 0, 1], [0, 1, 0], [0, -1, 0]]
		cur_h, cur_i, cur_j, day = queue.popleft()

		for val in dirs:
			visit_h = cur_h + val[0]
			visit_i = cur_i + val[1]
			visit_j = cur_j + val[2]

			if 0 <= visit_h < H and 0 <= visit_i < N and 0 <= visit_j < M and box[visit_h][visit_i][visit_j] == 0:
				queue.append([visit_h, visit_i, visit_j, day + 1])
				box[visit_h][visit_i][visit_j] = day + 1

	for h in range(H):
		for i in range(N):
			for j in range(M):
				if box[h][i][j] == 0:
					return -1
	return day


M, N, H = map(int, input().rsplit())
_box = [[list(map(int, sys.stdin.readline().rsplit())) for _ in range(N)] for _ in range(H)]
print(check_tomato(_box, M, N, H))
```

<br>