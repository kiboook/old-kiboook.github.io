---
title: "[BaekJoon] 백준 2573번 : 빙산"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2573번 : 빙산

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104845747-6bf25f00-591a-11eb-9ab4-36113b3d9ce8.png">
</center>

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104845783-8fb5a500-591a-11eb-95f9-e332a583038e.png">
</center>


<br>

빙산을 찾아 주변의 바다에 맞게 녹인 뒤 BFS 를 수행 해 빙산 갯수를 세는 문제이다.

처음에 접근할 땐 너무 어렵게 생각 해 빙산을 찾아 녹이는 작업도 BFS 로 했지만 이중 반복문을 통해 접근해도 가능하다.

또 처리 해주어야 할 부분은 빙산 주변이 0인 경우 바다로 생각하고 녹여야하는데 빙산이 녹아 0이 되어있는 경우가 있다.

따라서 빙산이 녹아 0이 되어있는 부분이 아닌 순수한 바다인 경우에만 빙산을 녹일 수 있도록 했다.

모든 빙산이 녹을 때 까지 빙산의 갯수가 1을 넘지 않는다면 0을 출력한다.

이 문제는 2006년도 한국정보올림피아드 초등부 문제다..

2006년이면 나도 11살 초등학생이었는데.. 내가 11살 때 이 문제를 풀 수 있었을까..

---

```python
import sys
from collections import deque


def DFS(start, visit):
	queue = deque([start])
	visit[start[0]][start[1]] = 1
	dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]]

	while queue:
		cur_i, cur_j = queue.popleft()

		for val in dirs:
			visit_i = cur_i + val[0]
			visit_j = cur_j + val[1]

			if 0 <= visit_i < n and 0 <= visit_j < m:
				if data[visit_i][visit_j] > 0 and visit[visit_i][visit_j] == 0:
					visit[visit_i][visit_j] = 1
					queue.append([visit_i, visit_j])

	return


def count_iceberg():
	visit = [[0] * m for _ in range(n)]
	cnt = 0

	for i in range(n):
		for j in range(m):
			if data[i][j] > 0 and visit[i][j] == 0:
				DFS([i, j], visit)
				cnt += 1
	return cnt


def iceberg():
	ice = [[0] * m for _ in range(n)]
	dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]]

	for i in range(n):
		for j in range(m):
			if data[i][j] > 0:
				ice[i][j] = 1

				for val in dirs:
					visit_i = i + val[0]
					visit_j = j + val[1]

					if data[visit_i][visit_j] == 0 and ice[visit_i][visit_j] != 1:
						if data[i][j] != 0:
							data[i][j] -= 1

	return count_iceberg()


if __name__ == '__main__':
	n, m = map(int, input().split())
	data = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]

	if count_iceberg() > 1:
		print(0)
		exit(0)

	year = 0
	while True:
		res = iceberg()
		year += 1

		if res >= 2:
			print(year)
			exit(0)

		if res == 0:
			print(0)
			exit(0)
```

<br>