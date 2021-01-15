---
title: "[BaekJoon] 백준 5014번 : 스타트링크"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 5014번 : 스타트링크

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104679167-7224e780-5730-11eb-88d2-825bb7cca8fa.png">
</center>

<br>

<a href="https://nam-ki-bok.github.io/baekjoon/Baek_HideAndSeek2/" style="color:#0FA678">[BaekJoon] 백준 12851번 : 숨바꼭질 2</a> 백준의 숨바꼭질 문제들과 비슷한 유형이다.

건물이 총 몇 층이고, 몇 층에서 몇 층으로 갈것이고.. 설명이 많지만 정리하자면

주어진 숫자 순서대로 최대 노드 키, 시작 노드, 도착 노드, 더해주는 값, 빼주는 값 으로 이해하면 된다.

즉 **10 1 10 2 1** 은 1에서 2를 더하거나 1을 빼는 계산을 최소로 몇 번 해야 10을 만들 수 있는지 물어보는 문제이다.

<img src="https://user-images.githubusercontent.com/54533309/104679639-769dd000-5731-11eb-84a2-1aeeb38a350f.png" alt="image" style="zoom:18%;" />

그림과 같이 시작 층 부터 BFS 를 통해 탐색하여 목표하는 층에 도착하면 버튼 누른 횟수를 반환한다.

층을 올라가는 경우 최고 층을 넘어가면 큐에 넣지 않고, 층을 내려가는 경우 1층 아래로 가면 큐에 넣지 않는다.

---

```python
from collections import deque


def elevator():
	queue = deque([[start, 0]])
	visit = {start: 1}

	while queue:
		floor, btn = queue.popleft()
		if floor > max_floor:
			break

		if floor == end:
			return btn

		if floor + up not in visit and floor + up <= max_floor:
			visit[floor + up] = 1
			queue.append([floor + up, btn + 1])

		if floor - down not in visit and floor - down >= 1:
			visit[floor - down] = 1
			queue.append([floor - down, btn + 1])

	return "use the stairs"


if __name__ == '__main__':
	max_floor, start, end, up, down = map(int, input().split())
	print(elevator())
```

<br>