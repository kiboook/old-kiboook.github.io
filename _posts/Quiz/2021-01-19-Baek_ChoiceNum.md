---
title: "[BaekJoon] 백준 2668번 : 숫자고르기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2668번 : 숫자고르기

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/105002675-023a9800-5a75-11eb-98e3-ca4df21a8cee.png">
</center>


<br>

처음엔 수학 문제인줄 알았는데 문제를 풀기위해 숫자를 따라가다보면 그래프 문제임을 알 수 있다.

예시에서 주어진 표를 가지고 그래프를 그려보면

<img src="https://user-images.githubusercontent.com/54533309/105002894-4d54ab00-5a75-11eb-85f9-5b010746716d.png" alt="image" style="zoom:25%;" />

이런 그래프가 그려지는데 답은 그래프가 가지는 모든 사이클의 경로를 보여주면 된다.

이 때, 1에서 출발하는 사이클, 3에서 출발하는 사이클의 경로가 겹치기 때문에

마지막에 set 을 통해 중복을 제거해 준 뒤 정렬을 해 출력하면 된다.

위 그래프는 [1, 3, 5] 가 답이 된다.

---

```python
from collections import deque


def DFS(start):
	global res
	queue = deque([start])
	visit = {start: 1}
	route = [start]

	while queue:
		visit_node = graph[queue.popleft()]
		if visit_node == start:
			res = res + route
			return

		route.append(visit_node)
		if visit_node not in visit:
			queue.append(visit_node)
			visit[visit_node] = 1

	return


if __name__ == '__main__':
	n = int(input())
	graph = {i + 1: int(input()) for i in range(n)}

	res = []
	for node in graph:
		DFS(node)

	res = sorted(list(set(res)))
	print(len(res))
	for val in res:
		print(val)
```

<br>