---
title: "[BaekJoon] 백준 17070번 : 파이프 옮기기 1"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 17070번 : 파이프 옮기기 1

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103507919-8dc3fe80-4ea3-11eb-9a1e-7210dd67759a.png">
</center>
<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103507946-9e747480-4ea3-11eb-861d-5daee931c0e6.png">
</center>

<br>

DFS 를 통해 길을 찾아가면 되는 문제이다.

가로, 세로, 대각선으로 이동하는 경우를 나누어 계산하면 된다.

하지만 파이썬은 DFS 로 풀면 시간초과가 발생한다.

분명히 이 방법이 맞는데 계속 시간초과가 발생 해 문제 알고리즘을 보니 다이나믹 프로그래밍이었다.

도저히 생각이 나질 않아 검색을 해보았더니 다이나믹 프로그래밍을 사용하려면 3차원 배열을 사용해야했다 🤮

하지만 DFS 도 가능한 풀이었다.

다만 파이썬만 안됐을뿐.. PyPy3 로 제출하면 통과가 된다.

여기서 더 화나는 상황이 발생했다.. 아래 두 가지 코드는 모두 구조가 똑같고 단지 좌표를 리스트로 묶어 준 차이밖에 없다.

더군다나 바로 아래에 있는 코드가 더 직관적인데.. 아래에 있는 코드는 시간초과가 발생한다.

파이썬이 느린 건 알고 있었지만 오늘따라 더 화나는 하루였다..

```python
import sys


def find_route(end_point, state):
   global res

   if end_point[0] == end_point[1] == home_size - 1:
      res += 1

   move_horizon = [end_point[0], end_point[1] + 1]
   move_vertical = [end_point[0] + 1, end_point[1]]
   move_diagonal = [end_point[0] + 1, end_point[1] + 1]

   if state == 0 or state == 1 or state == 2:
      i, j = move_diagonal
      if move_diagonal[0] < home_size and move_diagonal[1] < home_size:
         if home[i][j - 1] == home[i - 1][j] == home[i][j] == 0:
            find_route(move_diagonal, 2)

   if state == 0 or state == 2:
      if move_horizon[1] < home_size and home[move_horizon[0]][move_horizon[1]] != 1:
         find_route(move_horizon, 0)

   if state == 1 or state == 2:
      if move_vertical[0] < home_size and home[move_vertical[0]][move_vertical[1]] != 1:
         find_route(move_vertical, 1)


if __name__ == '__main__':
   home_size = int(input())
   home = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(home_size)]
   res = 0

   find_route([0, 1], 0)
   print(res)
```

---

```python
import sys


def find_route(i, j, state):
	global res

	if i == j == home_size - 1:
		res += 1

	if state == 0 or state == 1 or state == 2:
		if i + 1 < home_size and j + 1 < home_size:
			if home[i][j + 1] == home[i + 1][j] == home[i + 1][j + 1] == 0:
				find_route(i + 1, j + 1, 2)

	if state == 0 or state == 2:
		if j + 1 < home_size and home[i][j + 1] != 1:
			find_route(i, j + 1, 0)

	if state == 1 or state == 2:
		if i + 1 < home_size and home[i + 1][j] != 1:
			find_route(i + 1, j, 1)


if __name__ == '__main__':
	home_size = int(input())
	home = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(home_size)]
	res = 0

	find_route(0, 1, 0)
	print(res)
```

<br>