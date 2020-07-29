---
title:  "[Python] BFS/DFS (너비우선, 깊이우선탐색)"
excerpt: ""

categories:
  - Python

tags:
---

<a href="https://nam-ki-bok.github.io/quiz/Quiz_TargetNum/" style="color:#0FA678">[Programmers] 타겟넘버</a> 문제를 풀면서 정말 오랜만에 BFS, DFS 에 대해 공부를 다시 했다.

밑의 트리를 통해 설명해보도록 하겠다.

<img src="https://nam-ki-bok.github.io/assets/images/language/p_2.jpeg" style="zoom:30%;" />

이 트리는 dict 를 이용하여 구현하였다.

```python
graph = {
	'A': ['B', 'C', 'D'],
	'B': ['A', 'E', 'F'],
	'C': ['A', 'G'],
	'D': ['A', 'H'],
	'E': ['B', 'I'],
	'F': ['B'],
	'G': ['C', 'J', 'K'],
	'H': ['D', 'L'],
	'I': ['E'],
	'J': ['G'],
	'K': ['M'],
	'L': ['H'],
	'M': ['K']
}
```

## BFS 너비우선탐색

BFS 는 말 그대로 너비우선탐색이다. 같은 너비에 있는 노드들을 우선 탐색한다고 생각하면 된다.

손가락을 쫙 벌려서 같은 층에 있는 노드들을 먼저 방문하는 것 이다.

위 트리를 BFS 로 순회한다면 A &rarr; B &rarr; C &rarr; D &rarr; E &rarr; F &rarr; G &rarr; H &rarr; I &rarr; J &rarr; K &rarr; L &rarr; M 이 된다.

BFS 는 큐를 사용하여 구현한다.

간단히 방법을 설명 해 보자면 방문한 노드의 자식 노드를 큐에 전부 넣는다.

또 pop 을 한 뒤 그 노드의 자식 노드를 큐에 전부 넣는다.

이렇게 큐가 빌 때까지 반복하면 BFS 가 완성된다.

```python
from collections import deque


def BFS(graph, root_node):
	queue = deque()
	visit = dict()

	node = root_node
	queue.append(node)

	while queue:
		node = queue.popleft()
		if node not in visit:
			visit[node] = 1
			queue.extend(graph[node])

	print('BFS :', list(visit.keys()))
```

## DFS 깊이우선탐색

DFS 는 말 그대로 깊이우선탐색이다. 바닥까지 쭉 내려갔다가 다시 바닥까지 쭉 내려가는 것을 반복하면 된다.

위 트리를 DFS 로 순회한다면 A &rarr; B &rarr; E &rarr; I &rarr; F &rarr; C &rarr; G &rarr; J &rarr; K &rarr; M &rarr; D &rarr; H &rarr; L 이 된다.

DFS 는 stack 을 사용하여 구현한다. BFS 와 똑같지만 큐를 스택으로 바꿔주기만 하면 된다.

간단히 방법을 설명 해 보자면 방문한 노드의 자식 노드를 역순으로 스택에 쌓는다.

여기서 자식 노드를 역순으로 쌓으면 왼쪽부터 탐색을 하고 자식 노드를 정순으로 쌓으면 오른쪽부터 탐색을 한다.

또 pop 을 한 뒤 그 노드의 자식 노드를 전부 스택에 쌓는다.

이렇게 스택이 빌 때까지 반복하면 DFS 가 완성된다.

```python
def DFS(graph, start_node):
	stack = list()
	visit = dict()

	node = start_node
	stack.append(node)

	while stack:
		node = stack.pop()
		if node not in visit:
			visit[node] = 1
			stack.extend(reversed(graph[node]))

	print('DFS :', list(visit.keys()))
```