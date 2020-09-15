---
title: "[BaekJoon] 백준 11724번 : 연결 요소의 개수"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 11724번 : 연결 요소의 개수

<center><img width="1151" alt="Connect" src="https://user-images.githubusercontent.com/54533309/93217263-c7151900-f7a3-11ea-8d14-6971df54bdef.png">
</center>




<br>

BFS, DFS 를 수행하면서 수행 한 횟수를 세면 된다..

여기서 연결요소는 간선이 없는 정점도 연결요소 이다. 이 점을 간과하면 안된다..

처음에 간선으로 이어져 있는 노드들만 연결요소로 치는 줄 알고 풀었다가 틀렸다..

분명히 알고리즘 시간에 배웠는데 말이다 정점도 하나의 그래프다.. 그렇다면 하나의 연결요소이다..

웃긴게 visited 를 사전으로 사용하면 메모리 초과가 발생한다. 그건 일단 아직 미스터리..

이 문제 말고 실버 5 짜리 수학 문제를 풀다가 도저히 못풀어서 넘어왔는데.. 수학 문제는 진짜 안맞는다..

수학을 왜 이렇게 못 하는거지 !?!?!

---

```python
import sys
from collections import deque


def BFS(graph, start, visited):
	queue = deque([start])

	while queue:
		cur_ver = queue.popleft()
		visited.append(start)

		for ver in graph[cur_ver]:
			if ver not in visited:
				queue.append(ver)
				visited.append(ver)


def count_connect(graph, visited):
	count = 0

	for ver, connect_list in graph.items():
		if ver not in visited:
			BFS(graph, ver, visited)
			count += 1

	return count


N, M = map(int, sys.stdin.readline().rsplit())
graph = {i: [] for i in range(1, N + 1)}
visited = []

for _ in range(M):
	start, end = map(int, sys.stdin.readline().rsplit())

	graph[start].append(end)
	graph[end].append(start)

print(count_connect(graph, visited))
```

