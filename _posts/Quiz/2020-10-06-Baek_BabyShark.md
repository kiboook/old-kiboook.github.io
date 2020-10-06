---
title: "[BaekJoon] 백준 16236번 : 아기 상어"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 16236번 : 아기 상어

<center><img width="1151" alt="스크린샷 2020-10-06 오후 10 32 43" src="https://user-images.githubusercontent.com/54533309/95208297-db3cbb00-0823-11eb-86cf-d58991a0d598.png">
</center>

<center><img width="1151" alt="스크린샷 2020-10-06 오후 10 33 20" src="https://user-images.githubusercontent.com/54533309/95208363-f0b1e500-0823-11eb-8a96-9def31ac2f04.png">
</center>

<br>

아기상어 위치에서 BFS 를 수행 한 뒤 지금 SIZE 보다 작고 거리가 가장 가까운 곳으로 이동한다.

그 위치에서 다시 BFS 를 수행 한 뒤 지금 SIZE 보다 작고 거리가 가장 가까운 곳으로 이동한다.

거리는 따로 배열을 선언 해 관리하고 SIZE 만큼 BFS 를 수행하면 SIZE 를 1 올린다.

이 작업을 계속 반복하다가 갈 수 있는 곳이 모두 빈 칸이거나 SIZE 이상인 경우 종료한다.

BFS 를 수행할 때, 방문했다면 배열의 값을 10 으로 바꾸었는데 굉장한 오류였다.

배열에 1 ~ 9 크기의 물고기가 온다고 하여 상어의 최대 크기도 9 까지라고 생각했다.

하지만 20 * 20 배열에서 전부 1인경우 상어의 크기는 9 보다 훨씬 커진다.

그래서 방문한 경우를 더 큰 수로 바꾸어 처리해주니 일부분이 맞았다.. 다음 문제는 종료 조건이었다.

내가 처음에 생각했었던 종료조건은 모든 물고기를 먹은 경우, 갈 수 있는 곳이 모두 0 인경우였다.

이때도 예외케이스가 있었다..

가능한 종료조건을 모두 써놓고 보니 갈 수 있는 곳이 모두 빈 칸이거나 SIZE 이상인 경우가 모든 경우를 포함했다.

이거 찾는게 제일 오래걸렸다..

---

```python
import sys
from collections import deque
from copy import deepcopy


def BFS(arr, i, j, size):
	arr_tmp = deepcopy(arr)
	dist_arr = [[0] * N for _ in range(N)]
	queue = deque([[i, j, 0]])
	dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]]

	while queue:
		start_i, start_j, dist = queue.popleft()
		arr_tmp[start_i][start_j] = 1_000_000

		for cur in dirs:
			visit_i, visit_j = start_i + cur[0], start_j + cur[1]
			if 0 <= visit_i < N and 0 <= visit_j < N and arr_tmp[visit_i][visit_j] <= size:
				arr_tmp[visit_i][visit_j] = 1_000_000
				dist_arr[visit_i][visit_j] = dist + 1
				queue.append([visit_i, visit_j, dist + 1])
	dist_arr[i][j] = 0
	return dist_arr


def solution(arr):
	size_cnt = 0
	answer = 0
	size = 2
	start = []

	for i in range(N):
		for j in range(N):
			if arr[i][j] == 9:
				start = [i, j]
				arr[i][j] = 0
	dist = BFS(arr, start[0], start[1], size)

	while True:
		re_i, re_j, check = 0, 0, 0
		
		go_cnt, over_cnt = 0, 0
		for i in range(N):
			for j in range(N):
				if dist[i][j] != 0:
					go_cnt += 1
					if arr[i][j] == 0 or arr[i][j] >= size:
						over_cnt += 1
		if go_cnt == over_cnt:  # 갈 수 있는 모든 곳이 0 이거나 size 이상이라면 종료
			break

		tmp = 1_000_000
		for i in range(N):
			for j in range(N):
				if 1 <= arr[i][j] < size and 0 < dist[i][j] < tmp:
					tmp = dist[i][j]
					re_i, re_j = i, j

		size_cnt += 1
		arr[re_i][re_j] = 0
		answer += dist[re_i][re_j]

		if size_cnt == size:
			size_cnt = 0
			size += 1

		dist = BFS(arr, re_i, re_j, size)

	print(answer)


N = int(input())
my_arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(N)]
solution(my_arr)
```

<br>