---
title: "[BaekJoon] 백준 1916번 : 최소비용 구하기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1916번 : 최소비용 구하기

<center><img width="1156" alt="스크린샷 2020-10-16 오후 1 48 37" src="https://user-images.githubusercontent.com/54533309/96214384-4b7ed580-0fb6-11eb-8dfb-b6b9353c0ddf.png">
</center>

<br>

그저께와 어제에 이어 다익스트라 문제를 한 번 더 풀었다..

이제 좀 손에 익게 코딩을 할 수 있게 되었다.

이 문제도 다익스트라를 이용해 노드와 노드간 최소 거리를 출력하면 된다.

비용을 갱신하는 반복문에서 변수명을 잘 지어야겠다.

처음에 변수명을 헷갈리게 해서 틀린 코드를 작성했었다.

---

```python
import sys
import heapq


def solution(graph, start, end, node_num):
	dist = {i + 1: INF for i in range(node_num)}
	dist[start] = 0
	queue = []
	heapq.heappush(queue, [dist[start], start])
	while queue:
		cur_cost, cur_node = heapq.heappop(queue)

		if dist[cur_node] < cur_cost:
			continue

		for val in graph[cur_node]:
			visit_cost, visit_node = val
			if dist[visit_node] > visit_cost + cur_cost:
				dist[visit_node] = visit_cost + cur_cost
				heapq.heappush(queue, [dist[visit_node], visit_node])

	print(dist[end])


INF = 200_000_000
node_num = int(input())
edge_num = int(input())
graph = {i + 1: [] for i in range(node_num)}

for _ in range(edge_num):
	start, end, cost = map(int, sys.stdin.readline().rsplit())
	graph[start].append([cost, end])

start, end = map(int, input().split())
solution(graph, start, end, node_num)
```

<br>