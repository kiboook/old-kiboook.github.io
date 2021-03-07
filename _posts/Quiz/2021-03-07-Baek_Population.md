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

**[2021.03.07] 복습**

```python
import sys
from copy import deepcopy
from collections import deque


def BFS(field, visit, start):
   dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]]
   visit[start[0]][start[1]] = 1
   move_idx = [start]
   queue = deque([start])
   population = field[start[0]][start[1]]

   while queue:
      now_i, now_j = queue.popleft()
      for val in dirs:
         visit_i, visit_j = now_i + val[0], now_j + val[1]
         if 0 <= visit_i < n and 0 <= visit_j < n and not visit[visit_i][visit_j]:
            if L <= abs(field[now_i][now_j] - field[visit_i][visit_j]) <= R:
               population += field[visit_i][visit_j]
               visit[visit_i][visit_j] = 1
               move_idx.append([visit_i, visit_j])
               queue.append([visit_i, visit_j])

   average = population // len(move_idx)
   for idx in move_idx:
      field[idx[0]][idx[1]] = average


def move(field):
   before_field = deepcopy(field)
   visit = [[0 for _ in range(n)] for _ in range(n)]

   for i in range(n):
      for j in range(n):
         if not visit[i][j]:
            BFS(field, visit, [i, j])

   if before_field == field:
      return False
   else:
      return True


def solution(field):
   move_cnt = 0
   while move(field):
      move_cnt += 1

   return move_cnt


if __name__ == '__main__':
   n, L, R = map(int, input().split())
   field = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]

   print(solution(field))
```

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

