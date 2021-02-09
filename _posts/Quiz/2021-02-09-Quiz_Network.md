---
title:  "[Programmers] 네트워크"
excerpt: ""

categories:
  - Quiz

tags:
---

## 네트워크

<a href="https://programmers.co.kr/learn/courses/30/lessons/43162" style="color:#0FA678">네트워크</a> 를 클릭하면 바로 이동한다.

BFS / DFS 를 통해 그래프가 몇 개로 이루어져 있는지 구하면 되는 문제이다.

---

```python
from collections import deque


def BFS(start, graph, visit):
	queue = deque([start])
	visit[start] = 1

	while queue:
		cur_node = queue.popleft()
		for visit_node in graph[cur_node]:
			if visit[visit_node] == 0:
				visit[visit_node] = 1
				queue.append(visit_node)
        
	return


def solution(n, computers):
	answer = 0
	graph = {i: [] for i in range(n)}
	for i in range(n):
		for j in range(n):
			if i != j and computers[i][j] == 1:
				graph[i].append(j)

	visit = {i: 0 for i in range(n)}
	for node in range(n):
		if visit[node] == 0:
			BFS(node, graph, visit)
			answer += 1

	return answer
```

 <br>
