---
title: "[BaekJoon] 백준 1504번 : 특정한 최단 경로"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1504번 : 특정한 최단 경로

<center><img width="1153" alt="스크린샷 2020-10-14 오후 7 03 47" src="https://user-images.githubusercontent.com/54533309/95974474-fe80ef00-0e4f-11eb-87bf-3e4e94ede354.png">
</center>

<br>

크게 놓고 보면 정점과 정점사이의 최단거리를 구하는 문제이다.

하지만 여기서 특정 정점을 무조건 통과해야하는 조건이 추가됐다.

문제를 해결하기 위해 작은 문제로 쪼갠 뒤 합치면 된다.

1번 정점에서 V1 정점으로 가는 최단거리, V1 정점에서 V2 정점으로 가는 최단거리, V2 정점에서 N번 정점으로 가는 최단거리

1번 정점에서 V2 정점으로 가는 최단거리, V2 정점에서 V1 정점으로 가는 최단거리, V1 정점에서 N번 정점으로 가는 최단거리

두 가지 값중 최솟값을 반환하면 된다. 최솟값이 INF 값이 나온다면 -1을 반환하면 된다.

정점과 정점사이의 거리를 구하기 위해서 다익스트라를 사용하면 된다.

플로이드-워셜도 있긴 한데 800<sup>3</sup> 은 너무 커 시간초과가 발생한다.

다익스트라는 지금까지 문제를 풀면서 사용 한 적이 없어 이 기회에 공부하게 되었다.

<a href="https://codingcocoon.tistory.com/129" style="color:#0FA678">[파이썬]최단경로 알고리즘</a>

---

```python
import sys
import heapq


def dijkstra(graph, start, end):
	dist = {i + 1: 1_000_000 for i in range(node_num)}
	dist[start] = 0
	queue = []
	heapq.heappush(queue, [dist[start], start])

	while queue:
		cur_dist, cur_node = heapq.heappop(queue)

		if dist[cur_node] < cur_dist:
			continue

		for cur in graph[cur_node]:
			weight, visit_node = cur

			if weight + cur_dist < dist[visit_node]:
				dist[visit_node] = weight + cur_dist
				heapq.heappush(queue, [weight + cur_dist, visit_node])

	return dist[end]


def solution(graph, v1, v2):
	first_v1 = dijkstra(graph, 1, v1) + dijkstra(graph, v1, v2) + dijkstra(graph, v2, node_num)
	first_v2 = dijkstra(graph, 1, v2) + dijkstra(graph, v2, v1) + dijkstra(graph, v1, node_num)

	answer = min(first_v1, first_v2)
	if answer >= 1_000_000:
		print(-1)
	else:
		print(answer)


node_num, edge_num = map(int, input().split())
graph = {i + 1: [] for i in range(node_num)}

for _ in range(edge_num):
	start, end, dist = map(int, sys.stdin.readline().rsplit())
	graph[start].append([dist, end])
	graph[end].append([dist, start])

v1, v2 = map(int, input().split())

solution(graph, v1, v2)
```

<br>