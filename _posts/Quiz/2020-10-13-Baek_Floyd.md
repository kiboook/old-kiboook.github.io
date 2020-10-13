---
title: "[BaekJoon] 백준 11404번 : 플로이드"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 11404번 : 플로이드

<center><img width="1155" alt="스크린샷 2020-10-13 오후 1 34 58" src="https://user-images.githubusercontent.com/54533309/95815968-e4181a00-0d58-11eb-8743-2790c80ec6ae.png">
</center>


<br>

문제 이름도 플로이드고.. 그래프 최단거리 구하기.. 노드는 최대 100개.. 플로이드-워셜 알고리즘을 사용하면 된다.

하지만 조건에서 시작 도시와 도착 도시를 연결하는 노선은 하나가 아닐 수 있다고 하였다.

만약 같은 노선이 여러 개 입력된다면 더 비용이 싼 노선만 입력하면 된다.

이 조건만 맞춰주면 플로이드-워셜 기본 문제와 같다.

연결되지 않은 경우 거리를 10,000,000 으로 설정 한 뒤 풀면 된다.

도시의 개수는 최대 100개 이고 최대 비용은 100,000이기 때문에 가장 비싼 노선의 비용은 9,900,000이 되기 때문이다.

---

```python
import sys


def solution(graph, node_num):
	for k in range(node_num):
		for i in range(node_num):
			for j in range(node_num):
				graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])

	for i in range(node_num):
		for j in range(node_num):
			if i == j or graph[i][j] == 10_000_000:
				print(0, end=' ')
			else:
				print(graph[i][j], end=' ')
		print()


node_num = int(input())
edge_num = int(input())
graph = [[10_000_000] * node_num for _ in range(node_num)]

for _ in range(edge_num):
	start, end, dist = map(int, sys.stdin.readline().rsplit())

	start_to_end_dist = graph[start - 1][end - 1]
	if start_to_end_dist > dist:
		graph[start - 1][end - 1] = dist

solution(graph, node_num)
```

<br>