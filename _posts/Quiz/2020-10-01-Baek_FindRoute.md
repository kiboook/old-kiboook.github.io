---
title: "[BaekJoon] 백준 11430번 : 경로 찾기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 11430번 : 경로 찾기

<center><img width="1158" alt="스크린샷 2020-10-01 오후 10 32 16" src="https://user-images.githubusercontent.com/54533309/94815849-f67b8500-0435-11eb-9161-f3bfb2cd383c.png">
</center>

<br>

<a href="https://nam-ki-bok.github.io/baekjoon/Baek_Beer/" style="color:#0FA678">[BaekJoon] 백준 9205번 : 맥주 마시면서 걸어가기</a> 이 문제를 풀 때 플로이드-워셜을 공부했는데 써먹지 못했었다..

이 문제는 어떤 그래프 탐색 방법을 사용해도 상관 없지만 인접 행렬로 주어졌으니 플로이드-워셜을 사용하면 된다.

여기서 주어지는 그래프는 가중치가 없는 방향 그래프였기 때문에 이어지지 않은 노드는 0 으로 표현된다.

때문에 이어지지 않은 노드의 가중치를 1,000,000 으로 바꾸어 플로이드-워셜을 수행할 때 오류가 안생기게 했다.

마지막에 출력할 때도 인접행렬의 모양 그대로 출력을 해야해서 문자열로 바꾼뒤 join 을 이용해 출력했다.

---

```python
import sys


def Floyd(graph):
	for k in range(N):
		for i in range(N):
			for j in range(N):
				if graph[i][j] == 0:
					graph[i][j] = INF

				graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])


INF = 1_000_000
N = int(input())
in_graph = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(N)]
Floyd(in_graph)

for i in range(N):
	for j in range(N):
		if in_graph[i][j] != INF:
			in_graph[i][j] = 1
		else:
			in_graph[i][j] = 0

for val in in_graph:
	val = map(str, val)
	print(' '.join(val))
```

<br>