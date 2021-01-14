---
title: "[BaekJoon] 백준 2644번 : 촌수계산"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2644번 : 촌수계산

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104554555-b5734d80-567f-11eb-9979-bb053428be3c.png">
</center>


<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104414067-ed608f00-55b2-11eb-971d-7b14b5e93d46.png">
</center>
<br>

부모-자식 간의 관계를 나타낸 그래프이고 촌수를 계산하기 때문에 모든 간선의 무게는 1이다.

때문에 BFS 를 통해 출발 노드와 도착 노드의 최단 거리를 구하면 되는 문제이다.

---

```python
import sys
from collections import deque


def cal_relationship():
	queue = deque([[start, 0]])
	visit = {start: 1}

	while queue:
		cur_node, cur_dist = queue.popleft()
		if cur_node == end:
			return cur_dist

		for visit_node in graph[cur_node]:
			if visit_node not in visit:
				visit[visit_node] = 1
				queue.append([visit_node, cur_dist + 1])

	return -1


if __name__ == '__main__':
	person = int(input())
	start, end = map(int, input().split())
	graph = {i + 1: [] for i in range(person)}

	for _ in range(int(input())):
		parent, child = map(int, sys.stdin.readline().rsplit())
		graph[parent].append(child)
		graph[child].append(parent)

	print(cal_relationship())
```

<br>