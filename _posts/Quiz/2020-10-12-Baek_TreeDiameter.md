---
title: "[BaekJoon] 백준 1167번 : 트리의 지름"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1167번 : 트리의 지름

<center><img width="1157" alt="스크린샷 2020-10-12 오후 12 16 09" src="https://user-images.githubusercontent.com/54533309/95701499-b6fa3780-0c84-11eb-8713-1532b684508d.png">
</center>

<br>

임의의 노드 n1, n2 를 선택해 트리를 쭉 늘렸을 때 나머지 노드가 모두 n1, n2 사이에 있는 경우

n1 과 n2 의 거리를 트리의 지름이라고 한다.

저번주에 했던 프로그래머스 월간 코딩 챌린지에서 트리의 지름을 이용 해 푸는 문제가 있었다.

그 때 이 개념을 알고 있었더라면 풀 수 있었을텐데 너무 아쉬웠다.

트리의 지름을 구하는 방법은, 우선 임의의 노드 n1 을 선택 해 가장 멀리 있는 노드 n2 를 구한다.

그리고 n2 에서 가장 멀리 있는 노드 n3 를 구한다.

이 때, n2 와 n3 의 거리가 트리의 지름이 된다.

정리하자면 두 번의 그래프 탐색을 통해 구할 수 있게 된다.

---

```python
import sys
from collections import deque


def BFS(graph, start):
	visit = dict()
	output = []
	queue = deque([[start, 0]])

	while queue:
		cur_node, cur_dist = queue.popleft()
		visit[cur_node] = 1
		output.append([cur_node, cur_dist])

		for val in graph[cur_node]:
			visit_node, visit_dist = val
			if visit_node not in visit:
				queue.append([visit_node, cur_dist + visit_dist])
				visit[visit_node] = 1

	output = sorted(output, key=lambda x: x[1])
	return output[-1]


def solution(graph):
	start = BFS(graph, 1)
	end = BFS(graph, start[0])
	print(end[1])


N = int(input())
graph = {i: [] for i in range(1, N + 1)}
for _ in range(N):
	data = sys.stdin.readline().rsplit()
	node = int(data[0])
	edge = data[1:-1]

	for j in range(0, len(edge), 2):
		tmp = [int(edge[j]), int(edge[j + 1])]
		graph[node].append(tmp)

solution(graph)
```

<br>