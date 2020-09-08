---
title: "[BaekJoon] 백준 1389번 : 케빈 베이컨의 6단계 법칙"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1389번 : 케빈 베이컨의 6단계 법칙

<center><img width="1156" alt="Kevin" src="https://user-images.githubusercontent.com/54533309/92387591-c6033c80-f150-11ea-8d8b-1dcc1c2e0398.png">
</center>

<br>

각 Vertex 에서 다른 Vertex 까지의 최단 길이를 구하는 문제이다.

정말 정말 오랜만에 접한 그래프 순회 알고리즘이라 하나도 생각이 안났었다..

그래서 2학년 2학기 때 수강했던 알고리즘 자료를 뒤져보니 기억이 새록새록 났다 물론 알고리즘 이름만..

벨만포드, 플로이드 워셜, 다익스트라, 크루스칼 등등..

그 중에 BFS 를 이용한 최단경로 찾기 알고리즘을 사용했다.

플로이드 워셜을 통해서도 풀 수 있는데 이 땐 그래프를 인접 행렬을 이용해서 풀어야 한다.

하지만 파이썬으로 푸느라 인접 리스트가 너무 편해 놓아줄 수 가 없다..

어쨌든 기존 BFS 코드와 똑같지만 큐에 vertex num 과 route 를 같이 넣어주면 된다.

연결 된 vertex 를 큐에 넣을 때 자신의 route + 1 을 해주면 최단 경로를 찾을 수 있다.

---

```python
import sys
from collections import deque


def route_cnt_BFS(start):
	visited = dict()
	queue = deque([[start, 0]])
	total_route = 0

	while queue:
		visited_ver, route = queue.popleft()
		visited[visited_ver] = 1
		total_route += route

		for connected_ver in friends[visited_ver]:
			if connected_ver not in visited:
				queue.append([connected_ver, route + 1])
				visited[connected_ver] = 1

	return total_route


N, M = map(int, sys.stdin.readline().rsplit())
friends = {i + 1: [] for i in range(N)}

for _ in range(M):
	start, end = map(int, sys.stdin.readline().rsplit())
	friends[start].append(end)
	friends[end].append(start)

answer = [0, 1000000]
for start in range(1, N + 1):
	kevin_num = route_cnt_BFS(start)
	if kevin_num < answer[1]:
		answer = [start, kevin_num]

print(answer[0])
```
