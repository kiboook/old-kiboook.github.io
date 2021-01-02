---
title: "[BaekJoon] 백준 13549번 : 숨바꼭질 3"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 13549번 : 숨바꼭질 3

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103452669-28da9e00-4d15-11eb-9627-530c67a74bcb.png">
</center>

가중치가 있는 그래프를 그린 뒤 DFS 를 통해 최단거리를 찾으면 되는 문제이다.

처음 문제를 풀땐 <a href="https://nam-ki-bok.github.io/baekjoon/Baek_HideAndSeek2/" style="color:#0FA678">[BaekJoon] 백준 12851번 : 숨바꼭질 2</a> 문제를 응용해서 풀려고 했다.

그런데 생각을 해보니 최단 거리만 찾으면 되기 때문에 걸어서 가나, 순간 이동을 해서 가나 둘 다 갈 수 있다면

걸어서 갈 수 있는 경우를 없애주었다.

<img src="https://user-images.githubusercontent.com/54533309/103452749-0d23c780-4d16-11eb-9d75-4a1eef4d38e7.png" alt="image" style="zoom:15%;" />

순간 이동을 통해 먼저 그래프를 그린 뒤 방문했다고 표시를 하면

다음 걸어가서 방문하는 경우는 큐에 집어넣지 않게된다.

이렇게 그래프를 그려 탐색을 하면 최단 시간을 구할 수 있다.

---

```python
from collections import deque


def findMinTime(start, end):
	queue = deque([[start, 0]])
	visit = {start: 1}

	while queue:
		curNode, curSec = queue.popleft()

		if curNode == end:
			return curSec

		if curNode * 2 <= 1000000 and curNode * 2 not in visit:
			visit[curNode * 2] = 1
			queue.append([curNode * 2, curSec])

		if curNode - 1 >= 0 and curNode - 1 not in visit:
			visit[curNode - 1] = 1
			queue.append([curNode - 1, curSec + 1])

		if curNode + 1 <= 100000 and curNode + 1 not in visit:
			visit[curNode + 1] = 1
			queue.append([curNode + 1, curSec + 1])


n, k = map(int, input().split())
print(findMinTime(n, k))
```

<br>