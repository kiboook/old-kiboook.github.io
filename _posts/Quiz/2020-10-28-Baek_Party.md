---
title: "[BaekJoon] 백준 1238번 : 파티"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1238번 : 파티

<center><img width="1150" alt="스크린샷 2020-10-28 오후 1 42 32" src="https://user-images.githubusercontent.com/54533309/97391823-6ee54100-1923-11eb-9ce3-b017a751641b.png">
</center>

<img width="1150" alt="스크린샷 2020-10-28 오후 1 43 45" src="https://user-images.githubusercontent.com/54533309/97391874-9a682b80-1923-11eb-8ee9-aaddec1a9e0e.png">

<br>

다익스트라를 이용 해 최단거리를 구하면 되는 문제이다.

**1 &rarr; 2 &rarr; 1 = 5** 

**2**

**3 &rarr; 2 &rarr; 3 = 9**

**4 &rarr; 2 &rarr; 4 = 10**

예시에 대한 답을 구하면 10이 나온다.

중간고사 기간 때 코딩을 못 했는데 오랜만에 다익스트라를 풀게 되었다.

조~금 걱정했는데 까먹지 않아서 다행이었다.

---

```python
import sys
import heapq


INF = 2_000_000


def dijkstra(graph, start, end):
	dist = {i + 1: INF for i in range(len(graph))}
	dist[start] = 0
	queue = []
	heapq.heappush(queue, [dist[start], start])

	while queue:
		cur_weight, cur_node = heapq.heappop(queue)
		if cur_weight > dist[cur_node]:
			continue

		for val in graph[cur_node]:
			visit_weight, visit_node = val[0], val[1]
			if visit_weight + cur_weight <= dist[visit_node]:
				dist[visit_node] = visit_weight + cur_weight
				heapq.heappush(queue, [dist[visit_node], visit_node])

	return dist[end]


town_cnt, road_cnt, goal = map(int, input().split())
graph = {i + 1: [] for i in range(town_cnt)}

for _ in range(road_cnt):
	start, end, weight = map(int, sys.stdin.readline().rsplit())
	graph[start].append([weight, end])

answer = 0
for node in range(1, town_cnt + 1):
	temp = 0
	if node == goal:
		pass
	else:
		temp += dijkstra(graph, node, goal)
		temp += dijkstra(graph, goal, node)

	if temp >= answer:
		answer = temp

print(answer)
```

<br>