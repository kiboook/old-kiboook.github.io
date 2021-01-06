---
title: "[BaekJoon] 백준 1865번 : 웜홀"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1865번 : 웜홀

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103741550-a3206080-503c-11eb-98e2-fef92ed57041.png">
</center>

<br>

웜홀을 통해 이동하는 경우 음의 가중치를 가지게 된다.

따라서 음의 가중치가 있는 경우 최단거리를 구할 수 있는 벨만-포드 알고리즘을 사용한다.

이전까지 문제는 플로이드-워셜로 풀리는 문제들이여서 벨만-포드는 2년전에 학교 수업시간에 배우고 진짜 오랜만에 공부했다.

간단히 설명하자면 노드 개수 - 1 만큼 반복해 시작 노드에서부터의 최단거리를 갱신하는 알고리즘이다.

문제의 의도는 주어진 그래프에 음의 사이클이 있는가? 를 물어보는 문제이다.

음의 사이클이 있다면 한 지점에서 출발하여 다시 출발했던 위치로 돌아왔을 때 시간이 거꾸로 가있을 수 있다.

벨만-포드 알고리즘에서 음의 사이클의 존재 여부를 알고 싶다면 노드개수 - 1 만큼 반복한 뒤 한 번 더 반복하면 된다.

노드개수 - 1 만큼 반복하면 한 지점으로 부터의 최단거리가 모두 결정이 된다.

하지만 한 번 더 반복했는데 다시 갱신이 된다면 음의 사이클이 있다는 것을 의미한다.

여담이지만 처음엔 최단거리를 갱신해 줄 때 min 함수를 이용하였다.

그런데 if 문으로 바꾸어주니 시간이 두 배가량 줄어들었다.

또 시간을 줄이는 방법으로 노드개수 - 1 만큼 수행하는 도중 더 이상 노드들의 최단거리가 갱신이 안되는 경우가 있다.

그때도 굳이 끝까지 반복할 필요 없이 음의 사이클이 없다고 판단하고 반복을 종료하면 된다.

마지막으로.. 처음 풀 때 거리의 무한 값을 1e18 로 두고 했는데 틀렸습니다를 받았다..

이유를 찾아보니 1e18 - 3 == 1e18 이 된다.. 저렇게 수를 선언하고 작은 값을 빼 주면 무시되나보다..

---

```python
import sys


def bellman():
	res = "NO"

	for _ in range(node_cnt):
		for node in graph:
			for visit in graph[node]:
				visit_node, road_weigth = visit
				if node_weight[visit_node] > node_weight[node] + road_weigth:
					node_weight[visit_node] = node_weight[node] + road_weigth

	for node in graph:
		for visit in graph[node]:
			visit_node, road_weigth = visit
			if node_weight[visit_node] > node_weight[node] + road_weigth:
				res = "YES"

	return res


INF = 100000000

if __name__ == '__main__':
	testcase = int(input())

	for _ in range(testcase):
		node_cnt, road_cnt, hole_cnt = map(int, input().split())
		graph = {i: [] for i in range(node_cnt)}
		node_weight = {i: INF for i in range(node_cnt)}
		node_weight[0] = 0

		for _ in range(road_cnt):
			start, end, weight = map(int, sys.stdin.readline().rsplit())
			graph[start - 1].append([end - 1, weight])
			graph[end - 1].append([start - 1, weight])

		for _ in range(hole_cnt):
			start, end, weight = map(int, sys.stdin.readline().rsplit())
			graph[start - 1].append([end - 1, weight * -1])

		print(bellman())
```

<br>