---
title: "[BaekJoon] 백준 14503번 : 로봇 청소기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 14503번 : 로봇 청소기

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104874776-0b553780-5997-11eb-9ee3-8b6940ddfea2.png">
</center>

<br>

문제에서 주어지는 조건을 바탕으로 구현을 하면 되는 문제이다.

<a href="https://nam-ki-bok.github.io/baekjoon/Baek_MicroDust/" style="color:#0FA678">[BaekJoon] 백준 17144번 : 미세먼지 안녕!</a> 이 문제도 구현 문제인데 이것보다는 쉬워서 다행이었다..

코드를 보면 2-a, b, c, d 로 구현을 해두었는데 2-a, b 는 공통 된 부분이 많아 줄일 수도있지 않을까 생각을 해보았다.

반복문을 통해 줄일 수는 있을 것 같은데 동, 서, 남, 북을 풀어서 코딩하니 더 직관적인 모습이었다.

---

```python
import sys
from collections import deque


def clean():
	queue = deque([[robot_i, robot_j, head]])
	ground[robot_i][robot_j] = 3
	clean_cnt = 0
	north, east, south, west = [-1, 0], [0, 1], [1, 0], [0, -1]

	while queue:
		none_cnt = 0
		cur_i, cur_j, cur_head = queue.popleft()
		ground[cur_i][cur_j] = 3
		clean_cnt += 1

		while True:
			if none_cnt == 4:
				none_cnt = 0
				# 2-c
				if cur_head == 0:
					cur_i = cur_i + 1
				if cur_head == 1:
					cur_j = cur_j - 1
				if cur_head == 2:
					cur_i = cur_i - 1
				if cur_head == 3:
					cur_j = cur_j + 1

        # 2-d
				if ground[cur_i][cur_j] == 1:
					break

			# north
			if cur_head == 0:
				visit_i = cur_i + west[0]
				visit_j = cur_j + west[1]

				# 2-a
				if ground[visit_i][visit_j] == 0:
					queue.append([visit_i, visit_j, 3])
					break

				# 2-b
				if ground[visit_i][visit_j] == 1 or ground[visit_i][visit_j] == 3:
					cur_head = 3
					none_cnt += 1
					continue

			# east
			if cur_head == 1:
				visit_i = cur_i + north[0]
				visit_j = cur_j + north[1]

				# 2-a
				if ground[visit_i][visit_j] == 0:
					queue.append([visit_i, visit_j, 0])
					break

				# 2-b
				if ground[visit_i][visit_j] == 1 or ground[visit_i][visit_j] == 3:
					cur_head = 0
					none_cnt += 1
					continue

			# south
			if cur_head == 2:
				visit_i = cur_i + east[0]
				visit_j = cur_j + east[1]

				# 2-a
				if ground[visit_i][visit_j] == 0:
					queue.append([visit_i, visit_j, 1])
					break

				# 2-b
				if ground[visit_i][visit_j] == 1 or ground[visit_i][visit_j] == 3:
					cur_head = 1
					none_cnt += 1
					continue

			# west
			if cur_head == 3:
				visit_i = cur_i + south[0]
				visit_j = cur_j + south[1]

				# 2-a
				if ground[visit_i][visit_j] == 0:
					queue.append([visit_i, visit_j, 2])
					break

				# 2-b
				if ground[visit_i][visit_j] == 1 or ground[visit_i][visit_j] == 3:
					cur_head = 2
					none_cnt += 1
					continue

	return clean_cnt


if __name__ == '__main__':
	n, m = map(int, input().split())
	robot_i, robot_j, head = map(int, input().split())
	ground = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]

	print(clean())
```

<br>