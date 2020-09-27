---
title: "[BaekJoon] 백준 10026번 : 적록색약"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 10026번 : 적록색약

<center><img width="1161" alt="스크린샷 2020-09-27 오후 4 36 05" src="https://user-images.githubusercontent.com/54533309/94359012-8ab8b580-00df-11eb-93c8-e46632f397d0.png">
</center>

<br>

BFS 를 통해 각 구역의 수를 세는 문제이다.

R, G, B 구역을 세면 되고 적록색약인 사람의 경우를 다시 구하면 된다.

방문을 했던 위치는 'V' 로 바꾸어 관리 했다.

적록색약인 경우는 처음 입력받았던 배열에서 R 을 모두 G 로 바꾸거나 그 반대로 바꾼 뒤 BFS 를 수행하면 된다.

이 때 기존의 배열을 온전한 상태로 가지고 있어야 하기 때문에

정상인인 경우 BFS 를 수행 할 땐 deepcopy 를 이용 해 복사 된 배열을 넘겨줬다.

---

```python
import sys
from collections import deque
from copy import deepcopy


def change_color(arr, size):
	for i in range(size):
		for j in range(size):
			if arr[i][j] == 'R':
				arr[i][j] = 'G'


def start_BFS(arr, size):
	cnt = 0

	for i in range(size):
		for j in range(size):
			if arr[i][j] != 'V':
				BFS(arr, i, j)
				cnt += 1
	print(cnt)


def BFS(arr, i, j):
	queue = deque([[i, j]])
	start_color = arr[i][j]
	arr[i][j] = 'V'

	while queue:
		cur_i, cur_j = queue.popleft()
		dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]]

		for val in dirs:
			visit_i = cur_i + val[0]
			visit_j = cur_j + val[1]

			if 0 <= visit_i < size and 0 <= visit_j < size and arr[visit_i][visit_j] == start_color:
				queue.append([visit_i, visit_j])
				arr[visit_i][visit_j] = 'V'


size = int(input())
_arr = [[x for x in sys.stdin.readline().rsplit()[0]] for _ in range(size)]
start_BFS(deepcopy(_arr), size)
change_color(_arr, size)
start_BFS(_arr, size)
```

<br>