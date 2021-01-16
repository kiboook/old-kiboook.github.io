---
title: "[BaekJoon] 백준 2468번 : 안전 영역"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2468번 : 안전 영역

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104807020-e2119b80-581e-11eb-9f41-114ca41e2218.png">
</center>

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104807024-e9d14000-581e-11eb-994f-afc8e808fd3d.png">
</center>

<br>

비가 오지않는 경우, 높이 1까지 오는 경우, 높이 2까지 오는 경우 ... 높이 100 까지 오는 경우를 반복하면 된다.

위의 예시처럼 비가 높이 4까지 오는 경우 (0, 0) 은 높이가 6이라 잠기지 않으니 DFS 를 시작한다.

더 이상 탐색할 곳이 없으면 방문한 적이 없는 잠기지 않는 땅부터 다시 DFS 를 시작한다.

즉 잠기지 않는 땅을 시작으로 DFS 를 수행 한 횟수가 안전한 구역의 갯수가 된다.

문제 노트를 보면 아무 지역도 물에 잠기지 않을 수도 있다고 하는데 이 말은 비가 오지 않을 수도 있다는 의미이다.

---

```python
import sys
from collections import deque
from copy import deepcopy


def DFS(data, start, height):
	queue = deque([start])
	data[start[0]][start[1]] = 0
	dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]]

	while queue:
		cur_i, cur_j = queue.popleft()

		for val in dirs:
			visit_i = cur_i + val[0]
			visit_j = cur_j + val[1]
			if 0 <= visit_i < n and 0 <= visit_j < n and data[visit_i][visit_j] > height:
				data[visit_i][visit_j] = 0
				queue.append([visit_i, visit_j])
	return


def rain(height):
	copy_ground = deepcopy(ground)
	safe_area = 0

	for i in range(n):
		for j in range(n):
			if copy_ground[i][j] > height:
				DFS(copy_ground, [i, j], height)
				safe_area += 1

	return safe_area


if __name__ == '__main__':
	res = 0
	n = int(input())
	ground = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]

	for i in range(0, 101):
		res = max(res, rain(i))

	print(res)
```

<br>