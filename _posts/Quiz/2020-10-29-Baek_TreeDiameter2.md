---
title: "[BaekJoon] 백준 1967번 : 트리의 지름"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1967번 : 트리의 지름

<center><img width="1150" alt="스크린샷 2020-10-29 오후 3 59 14" src="https://user-images.githubusercontent.com/54533309/97535891-b214e200-19ff-11eb-92b1-98bad62780eb.png">
</center>

<br>

트리의 지름을 구하는 문제를 한 번 더 풀어봤다..

BFS 를 두 번 이용해서 구하는 방식이 가장 일반적인데 정말 당황스럽게 처음 풀 때 방법을 까먹었었다..

안헷갈리게 계속 골고루 풀어보는 수 밖에 없을 것 같다..

---

```python
import sys
from collections import deque


def BFS(graph, start):
	queue = deque([[start, 0]])
	visit = dict()
	dist = list()
	visit[start] = 1

	while queue:
		cur_node, cur_weight = queue.popleft()
		dist.append([cur_node, cur_weight])

		for val in graph[cur_node]:
			visit_node, visit_weight = val
			if visit_node not in visit:
				visit[visit_node] = 1
				queue.append([visit_node, cur_weight + visit_weight])

	return sorted(dist, key=lambda x: x[1])[-1]


node_num = int(input())
graph = {i + 1: [] for i in range(node_num)}

for _ in range(node_num - 1):
	parent, child, weight = map(int, sys.stdin.readline().rsplit())
	graph[parent].append([child, weight])
	graph[child].append([parent, weight])

temp = BFS(graph, 1)
print(BFS(graph, temp[0])[1])
```

<br>