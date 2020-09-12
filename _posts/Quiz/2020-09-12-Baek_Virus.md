---
title: "[BaekJoon] 백준 2606번 : 바이러스"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2606번 : 바이러스

<center><img width="1165" alt="Virus" src="https://user-images.githubusercontent.com/54533309/92994509-b95a5c00-f535-11ea-88a3-5e1314b13635.png">
</center>




<br>

그래프 순회 문제이다. BFS, DFS 상관없지만 나는 BFS 가 더 좋아 BFS 로 풀었다.

무조건 시작 Vertex 가 1 이기 때문에 연결이 안된 그래프는 어짜피 순회를 하지 않아 처리를 따로 해줄 필요가 없다.

1번 컴퓨터를 통해 바이러스에 감염 되는 컴퓨터 수를 구하는 것 이기 때문에 1번 컴퓨터를 방문 했을 때만 제외해주면 된다.

기본적인 그래프 순회 문제인데.. 이 문제가 2004년도 정보올림피아드 초등부 기출 문제이다.

2004년에 나도 초등학교 2학년이었는데.. 그때 난 뭐 하고있었지..

초등학생인데 그래프 순회 문제를 풀 정도면 크게 될 아이가 아닌가 싶다..

---

```python
from collections import deque
import sys


def find_virus_com(graph):
	virus = -1
	queue = deque([1])
	visited = dict()

	while queue:
		cur_com = queue.popleft()
		visited[cur_com] = 1
		virus += 1

		for com in _graph[cur_com]:
			if com not in visited:
				visited[com] = 1
				queue.append(com)

	return virus


computer_num = int(input())
route_num = int(input())

_graph = {i: [] for i in range(1, computer_num + 1)}
for _ in range(route_num):
	start, end = map(int, sys.stdin.readline().rsplit())
	_graph[start].append(end)
	_graph[end].append(start)

print(find_virus_com(_graph))
```

