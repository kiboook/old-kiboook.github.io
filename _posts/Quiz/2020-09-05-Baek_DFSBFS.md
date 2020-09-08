---
title:  "[BaekJoon] 백준 1260번 : DFS와 BFS"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1260번 : DFS와 BFS

<center><img width="1152" alt="DFSBFS" src="https://user-images.githubusercontent.com/54533309/92301736-0fad2500-efa1-11ea-9555-f43f73f1cd6d.png">
</center>



<br>

어제 <a href="https://nam-ki-bok.github.io/baekjoon/Baek_Poketmon/" style="color:#0FA678">[BaekJoon] 1620번 : 나는야 포켓몬 마스터 이다솜</a> 이 문제를 풀기 전 DFS, BFS 활용 하는 문제를 풀었는데

시간이 너무 오래걸려 풀지 못했다. 예전에 BFS, DFS 개념을 정리한 적이 있었는데 안풀려서 더 화났다..

그래서 오늘 정확히 하기 위해 BFS, DFS 문제를 풀었다. C 로 구현할 때 보다 너무너무 간단해서 정말 좋았다..

그래프는 사전으로 만들고 BFS 는 큐를, DFS 는 스택을 사용하면 구현 할 수 있다.

문제에서 정점이 여러 개 인 경우 정점 번호가 작은 것을 먼저 방문하기 때문에 간선 정보를 모두 입력 받은 후

마지막에 정렬을 한 번 씩 해주면 정점 번호가 작은 순서대로 방문 할 수 있다.

방문 했던 정점을 관리하는 것도 사전으로 만들었는데 in 명령을 수행할때 조금이라도 시간을 줄이기 위함이다.

---

```python
import sys
from collections import deque


def DFS(graph, start):
	visit = dict()
	stack = [start]

	while stack:
		visit_ver = stack.pop()
		if visit_ver not in visit:
			print(visit_ver, end=' ')
			visit[visit_ver] = 1

		for ver in reversed(graph[visit_ver]):

			if ver not in visit:
				stack.append(ver)


def BFS(graph, start):
	visit = dict()
	queue = deque([start])

	while queue:
		visit_ver = queue.popleft()
		if visit_ver not in visit:
			print(visit_ver, end=' ')
			visit[visit_ver] = 1

		for ver in graph[visit_ver]:
			if ver not in visit:
				queue.append(ver)


N, M, V = map(int, sys.stdin.readline().rsplit())
graph = {i: [] for i in range(1, N + 1)}

for _ in range(M):
	start, end = map(int, sys.stdin.readline().rsplit())
	graph[start].append(end)
	graph[end].append(start)

for i in range(1, N + 1):  # 정점 번호가 작은 순으로 방문해야하기 때문에 정렬한다
	graph[i].sort()

DFS(graph, V)
print()
BFS(graph, V)
```
