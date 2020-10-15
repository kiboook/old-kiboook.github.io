---
title: "[BaekJoon] 백준 1753번 : 최단경로"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1753번 : 최단경로

<center><img width="1150" alt="스크린샷 2020-10-15 오후 2 07 41" src="https://user-images.githubusercontent.com/54533309/96079464-caf5a180-0eef-11eb-8c9f-fe979359a87e.png">
</center>


<br>

어제 다익스트라 알고리즘을 공부했었는데 까먹을까봐 다익스트라를 이용하는 문제를 한 번 더 풀었다.

정점이 20,000개라서 플로이드-워셜은 사용하지 못 한다.

다익스트라는 우선순위 큐를 사용하는데, 처음에는 왜 굳이 우선순위 큐를 사용하는지 이해가 가지 않았다.

그냥 큐를 사용해도 어차피 문제는 풀리기 때문이다. 그래서 여기저기 검색을 해보니 이유를 알게되었다.

만약 일반 큐를 사용해 간선의 무게 상관없이 작업을 하다보면 무의미한 작업이 발생 할 수 있다.

하지만 우선순위 큐를 사용해 가벼운 간선을 먼저 처리하면 무의미한 작업이 사라진다.

다익스트라 문제를 또 풀어서 손에 익숙해지게 만들어야겠다.

---

```python
import sys
import heapq


def solution(graph, start, node_num):
	dist = {i + 1: 5_000_000 for i in range(node_num)}
	dist[start] = 0
	queue = []
	heapq.heappush(queue, [dist[start], start])

	while queue:
		cur_dist, cur_node = heapq.heappop(queue)

		if dist[cur_node] < cur_dist:
			continue

		for val in graph[cur_node]:
			weight, visit_node = val

			if dist[visit_node] > weight + cur_dist:
				dist[visit_node] = weight + cur_dist
				heapq.heappush(queue, [weight + cur_dist, visit_node])

	for val in dist.items():
		if val[1] == 5_000_000:
			print("INF")
		else:
			print(val[1])


node_num, edge_num = map(int, input().split())
pivot = int(input())
graph = {i + 1: [] for i in range(node_num)}

for _ in range(edge_num):
	start, end, weight = map(int, sys.stdin.readline().rsplit())
	graph[start].append([weight, end])

solution(graph, pivot, node_num)
```

<br>