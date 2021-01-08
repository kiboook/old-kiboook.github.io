---
title: "[BaekJoon] 백준 2206번 : 벽 부수고 이동하기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2206번 : 벽 부수고 이동하기

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103999340-1c0bed80-51e0-11eb-822b-96cc08c8fa0f.png">
</center>

<br>

벽을 부술 수 없었다면 간단한 BFS 문제이지만..

벽을 한 개 부술 수 있는 조건이 있어 너무 어려웠던 문제였다.

처음엔 부술 수 있는 벽들을 한 개 씩 부숴보고 BFS 를 실행했다.

이 경우 BFS 수행 횟수가 많아져 시간초과가 발생한다.

해결방법은 일반적으로 BFS 를 수행할 때 해당 노드의 방문 여부를 체크하는 visit 를 응용하면 된다.

3차원으로 만들어 벽을 부수고 온 경우, 벽을 부수지 않고 온 경우를 각각 나누어 저장하면 된다.

3차원으로 하자니 정말 이해가 안가 정답 코드를 통해 디버깅을 하면서 겨우 이해했다.

**<a href="https://hazung.tistory.com/146" style="color:#0FA678">[알고리즘] 백준 2206 벽 부수고 이동하기 / 파이썬</a>**

---

```python
import sys
from collections import deque


def findRoad():
	queue = deque([[0, 0, 0]])
	visit = [[[0, 0] for _ in range(m)] for _ in range(n)]
	visit[0][0][0] = 1

	while queue:
		cur_i, cur_j, wall = queue.popleft()
		if cur_i == n - 1 and cur_j == m - 1:
			return visit[cur_i][cur_j][wall]

		visit_dir = [[-1, 0], [0, 1], [1, 0], [0, -1]]
		for i in visit_dir:
			visit_i = cur_i + i[0]
			visit_j = cur_j + i[1]
			if 0 <= visit_i < n and 0 <= visit_j < m and visit[visit_i][visit_j][wall] == 0:
				if data[visit_i][visit_j] == 0:
					visit[visit_i][visit_j][wall] = visit[cur_i][cur_j][wall] + 1
					queue.append([visit_i, visit_j, wall])

					# 처음 벽을 만나는 경우
			if data[visit_i][visit_j] == 1 and wall == 0:
					visit[visit_i][visit_j][1] = visit[cur_i][cur_j][wall] + 1
					queue.append([visit_i, visit_j, 1])

	return -1


if __name__ == '__main__':
	n, m = map(int, input().split())
	data = []
	for _ in range(n):
		for val in sys.stdin.readline().rsplit():
			data.append([int(num) for num in val])

	print(findRoad())
```

<br>