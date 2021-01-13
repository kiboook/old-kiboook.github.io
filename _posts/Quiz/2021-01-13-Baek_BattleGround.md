---
title: "[BaekJoon] 백준 14938번 : 서강그라운드"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 14938번 : 서강그라운드

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104414033-dd48af80-55b2-11eb-8388-bc1cae935f13.png">
</center>

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104414067-ed608f00-55b2-11eb-971d-7b14b5e93d46.png">
</center>

<br>

모든 노드 별 최단거리를 구한 뒤 갈 수 있는 노드들의 아이템 값을 합하면 된다.

노드 개수가 최대 100개 이기 때문에 플로이드 워셜을 사용한다.

예전에 다익스트라, 플로이드 워셜을 다 풀었었는데 안한지 조금 됐다고 벌써 까먹었었다..

지금은 노드 개수가 적어 플로이드 워셜을 사용했지만 노드가 많아지면 다익스트라를 사용해야한다.

다익스트라는 그때 다시 복습해야겠다..

어쨌든 문제 풀이를 그림으로 나타내면 다음과 같다.

<img src="https://user-images.githubusercontent.com/54533309/104414087-f6e9f700-55b2-11eb-9a8f-9edb104dd76b.png" alt="image" style="zoom:30%;" />

문제에서 주어진 예시를 보면 수색범위로 5를 주었다.

때문에 A 노드에서는 B, D 노드만 갈 수 있고 따라서 가질 수 있는 아이템은 5 + 7 + 2 가 된다.

이렇게 반복 계산을 해 주어 최댓값을 구하면 된다.

---

```python
import sys


def solution():
	for k in range(node_cnt):
		for i in range(node_cnt):
			for j in range(node_cnt):
				graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
				if i == j:
					graph[i][j] = 0

	res = 0
	for row in range(node_cnt):
		item_sum = 0
		for col in range(node_cnt):
			if graph[row][col] <= max_dist:
				item_sum += node_item[col]

		res = max(res, item_sum)
	return res


if __name__ == '__main__':
	node_cnt, max_dist, road_cnt = map(int, input().split())
	node_item = list(map(int, input().split()))
	graph = [[1_000_000] * node_cnt for _ in range(node_cnt)]

	for _ in range(road_cnt):
		start, end, dist = map(int, sys.stdin.readline().rsplit())
		graph[start - 1][end - 1] = min(graph[start - 1][end - 1], dist)
		graph[end - 1][start - 1] = min(graph[end - 1][start - 1], dist)

	print(solution())
```

<br>