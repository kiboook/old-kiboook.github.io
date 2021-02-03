---
title: "[BaekJoon] 2589번 : 보물섬"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2589번 : 보물섬

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/106700618-8c176300-6628-11eb-9c7c-035d731366fc.png">
</center>

<br>

처음에는 트리의 지름을 구하는 문제인 줄 알고 트리의 지름을 구했으나 틀렸습니다를 받았다.

너무 바보같은 생각이었다! 문제에서 주어진 예시만 보고 트리의 지름을 구하려고 하다니..

아주 간단한 예로 위 예시의 **[2, 6]** 을 L 로 바꾸어주면 트리가 아니라 그래프가 된다.

결국 모든 땅에서 BFS 를 수행해 가장 멀리 떨어져있는 땅과의 거리를 출력하면 된다.

---

```python
from collections import deque


def BFS(start):
	queue = deque([start])
	visit = [[0] * m for _ in range(n)]
	visit[start[0]][start[1]] = 1
	dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]]
	distance = 0

	while queue:
		cur_i, cur_j, weight = queue.popleft()
		distance = weight
		for val in dirs:
			visit_i = cur_i + val[0]
			visit_j = cur_j + val[1]
			if 0 <= visit_i < n and 0 <= visit_j < m and visit[visit_i][visit_j] == 0:
				if ground[visit_i][visit_j] == 'L':
					visit[visit_i][visit_j] = 1
					queue.append([visit_i, visit_j, weight + 1])

	return distance


def solution():
	output = 0

	for i in range(n):
		for j in range(m):
			if ground[i][j] == 'L':
				result = BFS([i, j, 0])
				if output < result:
					output = result

	return output


if __name__ == '__main__':
	n, m = map(int, input().rsplit())
	ground = [list(map(str, input())) for _ in range(n)]

	print(solution())
```

<br>