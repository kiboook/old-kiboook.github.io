---
title: "[BaekJoon] 백준 12851번 : 숨바꼭질 2"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 12851번 : 숨바꼭질 2

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103406032-91523f80-4b9c-11eb-8e00-8aa9c4059264.png">
</center>

<a href="https://nam-ki-bok.github.io/baekjoon/Baek_HideAndSeek/" style="color:#0FA678">[BaekJoon] 백준 1697번 : 숨바꼭질</a> 문제는 가장 빠른 시간만 구하면 되는 반면 이 문제는 최단 경로의 개수도 구해야 한다.

> <a href="https://nam-ki-bok.github.io/baekjoon/Baek_HideAndSeek/" style="color:#0FA678">[BaekJoon] 백준 1697번 : 숨바꼭질</a> 지금 이 문제 코드를 보니 왜 이렇게 코딩했을까 라는 생각이 든다..
>
> 저 때는 DFS 를 하려면 무조건 그래프를 만들어 두고 해야 한다고 생각한 것 같다..

<img src="https://user-images.githubusercontent.com/54533309/103405926-36204d00-4b9c-11eb-9693-572b938e9271.png" alt="image" style="zoom:35%;" />

문제의 예시를 그림으로 그려보면 이렇게 두 가지 방법이 있다.

처음 접근했던 방법은 DFS 를 통해서 가장 빠른 시간을 구한 뒤, 다시 DFS 를 통하여 경로 개수를 구하는 방법이었다.

이렇게 되면 같은 작업을 두 번 반복하는 것과 같아 시간 초과가 발생했다.

따라서 가장 빠른 시간을 구함과 동시에 경로 개수를 구해야 했다.

또 아주 사소하게 실수 할 수 있는 부분이 있었다.

만약 입력이 **1 3** 으로 주어진다면 가장 빠른 시간은 3초이고 가능한 경로의 개수는 2개가 나와야 한다.

처음 풀때 1개가 나와야 한다고 생각하고 풀어 계속 틀렸었다.

<img src="https://user-images.githubusercontent.com/54533309/103406583-84cee680-4b9e-11eb-8f66-9225b246f38d.png" alt="image" style="zoom:20%;" />

가능한 경로의 개수이기 때문에 1에서 순간 이동을 해서 2로 가는 경우와 걸어서 2로 가는 경우를 다른 케이스로 쳐줘야 한다.

---

```python
from collections import deque


def checkMinSec(start):
	queue = deque([[start, 0]])
	visit = {start: 1}
	sec = 1000000
	minRoute = 0

	while queue:
		curNode, curSec = queue.popleft()
		visit[curNode] = 1

		if curSec > sec:
			continue

		if curNode == k:
			minRoute += 1
			if curSec < sec:
				sec = curSec

		if curNode - 1 >= 0 and curNode - 1 not in visit:
			queue.append([curNode - 1, curSec + 1])

		if curNode + 1 <= 100000 and curNode + 1 not in visit:
			queue.append([curNode + 1, curSec + 1])

		if curNode * 2 <= 100000 and curNode * 2 not in visit:
			queue.append([curNode * 2, curSec + 1])

	return sec, minRoute


n, k = map(int, input().split())
minSec, routeCnt = checkMinSec(n)
print(minSec)
print(routeCnt)
```

<br>