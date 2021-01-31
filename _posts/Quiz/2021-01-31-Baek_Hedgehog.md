---
title: "[BaekJoon] 백준 3055번 : 탈출"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 3055번 : 탈출

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/106376774-a4df0900-63db-11eb-93e9-ac7b3c1fcb4a.png">
</center>


<br>

일반 DFS 문제보다 조금 신경 써야 할 조건이 있는 문제이다.

작업을 분 단위로 나누어서 해당 시점에 퍼져야 하는 물을 전부 퍼트린 후 고슴도치를 이동시키면 된다.

처음 제출했을 때 런타임 에러가 자꾸 발생해 어떤 문제인지 찾기 어려웠었다.

그런데.. 나는 물이 한 군데에서 시작하는 경우만 따지고 있었다.

물이 여러 군데에서 시작할 수도 있는데 말이다!

물의 시작 위치를 여러 군데로 받을 수 있게 고쳐주니 바로 통과했다.

---

```python
from collections import deque


def solution(water_start, hedgehog_start):
	water_queue = deque(water_start)
	hedgehog_queue = deque([hedgehog_start])
	dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]]

	while hedgehog_queue:
		hedgehog_i, hedgehog_j, hedgehog_minute = hedgehog_queue.popleft()
		while water_queue:
			if water_queue[0][2] == hedgehog_minute:
				water_i, water_j, water_minute = water_queue.popleft()
			else:
				break
			for val in dirs:
				water_visit_i = water_i + val[0]
				water_visit_j = water_j + val[1]
				if 0 <= water_visit_i < r and 0 <= water_visit_j < c:
					if ground[water_visit_i][water_visit_j] == '.':
						ground[water_visit_i][water_visit_j] = 'X'
						water_queue.append([water_visit_i, water_visit_j, water_minute + 1])

		for val in dirs:
			hedgehog_visit_i = hedgehog_i + val[0]
			hedgehog_visit_j = hedgehog_j + val[1]
			if 0 <= hedgehog_visit_i < r and 0 <= hedgehog_visit_j < c:
				if ground[hedgehog_visit_i][hedgehog_visit_j] == '.':
					ground[hedgehog_visit_i][hedgehog_visit_j] = 'X'
					hedgehog_queue.append([hedgehog_visit_i, hedgehog_visit_j, hedgehog_minute + 1])
				if ground[hedgehog_visit_i][hedgehog_visit_j] == 'D':
					return hedgehog_minute + 1

	return "KAKTUS"


if __name__ == '__main__':
	r, c = map(int, input().rsplit())
	ground = [list(map(str, input())) for _ in range(r)]

	water_start = []
	hedgehog_start = []
	for i in range(r):
		for j in range(c):
			if ground[i][j] == '*':
				water_start.append([i, j, 0])
			if ground[i][j] == 'S':
				hedgehog_start = [i, j, 0]

	print(solution(water_start, hedgehog_start))
```

<br>

