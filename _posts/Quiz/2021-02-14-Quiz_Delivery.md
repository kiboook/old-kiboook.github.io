---
title:  "[Programmers] 배달"
excerpt: ""

categories:
  - Quiz

tags:
---

## 배달

<a href="https://programmers.co.kr/learn/courses/30/lessons/12978" style="color:#0FA678">배달</a> 을 클릭하면 바로 이동한다.

1번 노드에서 K 이하의 거리를 가진 노드가 몇 개인지 구하면 되는 문제이다.

전체 노드는 최대 50개 이므로 다익스트라 알고리즘을 사용한다.

다만 노드 사이의 간선이 여러 개 있을 수 있기 때문에 인접행렬을 만드는 과정에서 제일 작은 거리를 가지는 간선만 넣어준다.

---

```python
def solution(N, road, K):
	answer = 0
	INF = float("INF")
	graph = [[INF] * N for _ in range(N)]

	for i in road:
		start, end, time = i
		if graph[start - 1][end - 1] > time:
			graph[start - 1][end - 1] = time
			graph[end - 1][start - 1] = time

	for k in range(N):
		for i in range(N):
			for j in range(N):
				if i != j:
					graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
				else:
					graph[i][j] = 0

	for i in graph[0]:
		if i <= K:
			answer += 1

	return answer


if __name__ == '__main__':
	N = 5
	road = [[1, 2, 1], [2, 3, 3], [5, 2, 2], [1, 4, 2], [5, 3, 1], [5, 4, 2]]
	K = 3

	print(solution(N, road, K))
```

 <br>
