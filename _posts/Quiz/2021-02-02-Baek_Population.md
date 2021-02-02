---
title: "[BaekJoon] 16234번 : 인구이동"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 16234번 : 인구이동

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/106556672-5e1c1b00-6563-11eb-9824-13a63c82c5e0.png">
</center>


<br>

<img src="https://user-images.githubusercontent.com/54533309/106556921-fc0fe580-6563-11eb-97cd-40a2bd396824.png" alt="image" width="600" />

한 번의 인구 이동이 일어나면 다음과 같이 인구 수가 변한다.

더 이상 인구 수 변화가 없을 때까지 이 과정이 몇 번 반복되는지 구하면 된다.

주어진 조건에 맞게 BFS 를 수행하며 총인구수를 구하고 국경을 개방한 나라 수를 구한 뒤

평균 인구를 구해 방문했던 나라의 인구 수를 모두 평균 인구로 바꾸어주면 된다.

만약 BFS 를 N * N 번 수행했다면 인구 이동이 없었다는 의미를 갖기 때문에 종료한다.

---

```python
from collections import deque
import sys


def BFS(start, visit):
	queue = deque([start])
	visit[start[0]][start[1]] = 1
	union = [start]
	dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]]
	country_cnt = 1
	population = world[start[0]][start[1]]

	while queue:
		cur_i, cur_j = queue.popleft()
		for val in dirs:
			visit_i = cur_i + val[0]
			visit_j = cur_j + val[1]

			if 0 <= visit_i < N and 0 <= visit_j < N and visit[visit_i][visit_j] == 0:
				if L <= abs(world[cur_i][cur_j] - world[visit_i][visit_j]) <= R:
					visit[visit_i][visit_j] = 1
					queue.append([visit_i, visit_j])
					union.append([visit_i, visit_j])
					country_cnt += 1
					population += world[visit_i][visit_j]

	avg = population // country_cnt
	for idx in union:
		world[idx[0]][idx[1]] = avg

	return


def solution():
	answer = 0

	while True:
		bfs_cnt = 0
		visit = [[0] * N for _ in range(N)]
		for i in range(N):
			for j in range(N):
				if visit[i][j] == 0:
					BFS([i, j], visit)
					bfs_cnt += 1

		if bfs_cnt == (N * N):
			return answer
		else:
			answer += 1


if __name__ == '__main__':
	N, L, R = map(int, input().rsplit())
	world = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(N)]
	print(solution())
```

<br>

