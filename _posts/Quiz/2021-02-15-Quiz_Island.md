---
title:  "[Programmers] 섬 연결하기"
excerpt: ""

categories:
  - Quiz

tags:
---

## 섬 연결하기

<a href="https://programmers.co.kr/learn/courses/30/lessons/42861" style="color:#0FA678">섬 연결하기</a> 를 클릭하면 바로 이동한다.

최소한의 비용을 사용해 모든 그래프를 연결하는 문제이다.

최소 스패닝 트리를 만들 때 사용하는 크루스칼 알고리즘을 사용하면 된다.

사이클 형성 여부를 확인하는 방법은 다양하게 있는데 이 방법이 제일 간단하다.

만약 이렇게 해서 시간초과가 발생한다면 사전을 이용해 사이클 형성 여부를 확인해도 된다.

---

```python
def find_parent(parent, node):
	if parent[node] != node:
		parent[node] = find_parent(parent, parent[node])

	return parent[node]


def union_parent(parent, a, b):
	a = find_parent(parent, a)
	b = find_parent(parent, b)
	if a < b:
		parent[b] = a
	else:
		parent[a] = b


def solution(n, costs):
	answer = 0
	parent = [i for i in range(n + 1)]
	costs.sort(key=lambda x: x[2])

	for edge in costs:
		a, b, cost = edge
		if find_parent(parent, a) != find_parent(parent, b):
			union_parent(parent, a, b)
			answer += cost

	return answer
```

 <br>
