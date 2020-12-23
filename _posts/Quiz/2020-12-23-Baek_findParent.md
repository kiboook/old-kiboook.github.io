---
title: "[BaekJoon] 백준 11725번 : 트리의 부모 찾기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 11725번 : 트리의 부모 찾기

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/102967837-25396100-4536-11eb-9912-b3cea1e6bb07.png">
</center>

<br>

주어진 정보를 가지고 트리를 만들어 순회를 하면 되는 문제이다.

양방향 그래프로 생성한 뒤 BFS 로 순회를 하며 부모를 저장하면 된다.

BFS 문제도 정말 오랜만에 풀어 처음에 기억이 나지 않았었다..

진짜 꾸준히 계속 풀어야 잊어버리지 않을 것 같다.

---

```python
import sys
from collections import deque


def BFS():
	queue = deque([1])
	visit = {}

	while queue:
		parent = queue.popleft()
		visit[parent] = 1

		for child in graph[parent]:
			if child not in visit:
				res[child] = parent
				queue.append(child)
				visit[child] = 1


n = int(input())
data = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n - 1)]
graph = {i: [] for i in range(1, n + 1)}
res = {i: 0 for i in range(2, n + 1)}

for val in data:
	graph[val[0]].append(val[1])
	graph[val[1]].append(val[0])

BFS()
for val in res.values():
	print(val)
```

<br>

