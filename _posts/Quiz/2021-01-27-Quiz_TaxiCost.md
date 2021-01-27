---
title:  "[Programmers] 합승 택시 요금"
excerpt: ""

categories:
  - Quiz

tags:
---

## 합승 택시 요금

<a href="https://programmers.co.kr/learn/courses/30/lessons/72413" style="color:#0FA678">합승 택시 요금</a> 을 클릭하면 바로 이동한다.

<img src="https://user-images.githubusercontent.com/54533309/105958378-e0b55e00-60bd-11eb-8b4e-97590fc0419d.png" alt="image" width="400">

모든 노드 별 최단거리를 구해야 풀 수 있는 문제이다.

최대 노드의 개수가 200개 이기 때문에 다익스트라를 사용하여도 된다.

모든 노드 별 최단거리를 구한 뒤 출발 노드를 기준으로 임의의 노드를 거쳐 목표 노드로 가는 최단거리를 구하면 된다.

식으로 나타내면 **graph[start]\[k] + graph[k]\[a] + graph[k]\[b]** 의 값 중 최솟 값을 찾으면 된다.

이런 문제를 풀 때 매번 가질 수 있는 거리의 최댓값을 계산해서 무한의 값으로 설정했는데 다른 방법이 있었다.

**INF = float('inf')** 이 방법을 사용하면 걱정없이 무한을 사용 할 수 있다.

---

```python
def dijkstra(n, graph):
	for k in range(n):
		for i in range(n):
			for j in range(n):
				if i != j:
					cost = graph[i][k] + graph[k][j]
					if graph[i][j] > cost:
						graph[i][j] = cost
				else:
					graph[i][j] = 0
	return


def solution(n, s, a, b, fares):
	s -= 1
	a -= 1
	b -= 1
	INF = float('inf')
	answer = INF

	graph = [[INF] * n for _ in range(n)]
	for val in fares:
		start, end, cost = val[0], val[1], val[2]
		graph[start - 1][end - 1] = cost
		graph[end - 1][start - 1] = cost
	dijkstra(n, graph)

	for i in range(n):
		cost = graph[s][i] + graph[i][a] + graph[i][b]
		if answer > cost:
			answer = cost

	return answer
```

 <br>
