---
title:  "[Programmers] 가장 먼 노드"
excerpt: ""

categories:
  - Quiz

tags:
---

## 가장 먼 노드

<a href="https://programmers.co.kr/learn/courses/30/lessons/49189" style="color:#0FA678">가장 먼 노드</a> 를 클릭하면 바로 이동한다.

BFS / DFS 를 통해 1 에서 부터의 노드 별 거리를 구한 뒤 가장 멀리 있는 노드 개수를 반환하면 된다.

---

```python
import collections


def solution(n, edge):
	answer = []
	graph = {i: [] for i in range(1, n + 1)}
	visit = {i: 0 for i in range(1, n + 1)}

	for val in edge:
		start, end = val
		graph[start].append(end)
		graph[end].append(start)

	queue = collections.deque([[1, 0]])
	visit[1] = 1

	while queue:
		cur_node, dist = queue.popleft()
		for node in graph[cur_node]:
			if visit[node] == 0:
				visit[node] = 1
				queue.append([node, dist + 1])
				answer.append(dist + 1)

	return collections.Counter(answer)[max(answer)]
```

 <br>
