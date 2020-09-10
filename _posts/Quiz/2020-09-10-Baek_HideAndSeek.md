---
title: "[BaekJoon] 백준 1697번 : 숨바꼭질"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1697번 : 숨바꼭질

<center><img width="1155" alt="Hide And Seek" src="https://user-images.githubusercontent.com/54533309/92715025-e40eae00-f397-11ea-8288-5e3fba966fb6.png">
</center>



<br>

처음에 어떤 알고리즘으로 접근해야하는지 감이 안잡혀 정말 어려웠던 문제였다.

DP 를 생각해봐도 아니었고 탐욕법을 생각해봐도 도통 아니었다.

고민을 한참해도 생각이 안나서 힌트를 얻고자 알고리즘 분류를 봤는데 그래프 탐색이었다.

각 vertex 값을 기준으로 + 1 , - 1 , * 2 인 값을 가지는 vertex 와 이어져 있는 그래프를 그리면 됐다.

그 이후부터는 <a href="https://nam-ki-bok.github.io/baekjoon/Baek_Kevin/" style="color:#0FA678">[BaekJoon] 1389번 : 케빈 베이컨의 6단계 법칙</a> 이 문제와 동일하다.

케빈 베이컨 문제에서는 모든 vertex 의 최단거리를 찾았지만 이 경우는 내가 원하는 vertex 의 최단거리만 찾으면 된다.

조건에서 N, K 는 0 이상 100,000 이하 이기 때문에 100,000 을 넘는 vertex 는 만들지 않아도 된다.

여담이지만 알고리즘도 다 맞게 짜 놓고 N, K 범위를 제대로 못 봐 1 이상 100,000 이하인 경우로 풀고 있었다..

그래서 N 이 0 인 경우 런타임 에러가 발생했는데 원인을 못 찾고 있었다..

**문제와 조건을 제발 제발 꼼꼼히 읽고 미리 다 정리 해 두고** 문제를 풀어야겠다.

---

```python
from collections import deque


def BFS(graph, start, goal):
	visited = dict()
	queue = deque([[start, 0]])

	while queue:
		visit_ver = queue.popleft()
		visited[visit_ver[0]] = 1

		if visit_ver[0] == goal:
			return visit_ver[1]

		for ver in graph[visit_ver[0]]:
			if ver not in visited:
				queue.append([ver, visit_ver[1] + 1])
				visited[ver] = 1


def find_min_time(N, K):
	if N >= K:
		return N - K

	graph = {i: [] for i in range(0, 100001)}
	graph[0] = [1]
	graph[1] = [0, 2]

	for i in range(2, 100001):
		tmp = [i - 1]
		if i + 1 <= 100000:
			tmp.append(i + 1)
		if i * 2 <= 100000:
			tmp.append(i * 2)
		graph[i] = tmp

	return BFS(graph, N, K)


N, K = map(int, input().split())
print(find_min_time(N, K))
```

