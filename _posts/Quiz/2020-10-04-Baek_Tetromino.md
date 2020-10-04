---
title: "[BaekJoon] 백준 14500번 : 테트로미노"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 14500번 : 테트로미노

<center><img width="1156" alt="스크린샷 2020-10-04 오후 3 31 33" src="https://user-images.githubusercontent.com/54533309/95008653-afb8a580-0656-11eb-80c5-039c14f18c6e.png">
</center>

<br>

만들 수 있는 모든 테트로미노의 경우를 따져 최댓값을 구하면 되는 브루트포스 문제이다.

(0, 0) 부터 (N - 1, M - 1) 까지 모든 인덱스를 기준삼아 테트로미노가 놓인 칸에 쓰여 있는 수들의 합을 구해 최댓값을 넣어준다.

그러나 (0, 0) 을 기준으로 ㅓ 모양의 테트로미노를 놓으면 계산을 할 수 없다.

이 때 따로 처리를 하지 않고 되는 부분만 더하게 놔두었다.

어차피 최대값을 구하는 것이기 때문에 이렇게 계산을 해도 다른 값보다 무조건 작아지기 때문이다.

---

```python
import sys


def make_max(arr):
	result = 0
	a, b = [[0, 1], [0, 2], [0, 3]], [[1, 0], [2, 0], [3, 0]]
	c = [[0, 1], [1, 0], [1, 1]]
	d, e = [[1, 0], [2, 0], [2, 1]], [[0, 1], [0, 2], [-1, 2]]
	f, g = [[0, 1], [1, 1], [2, 1]], [[0, 1], [0, 2], [1, 0]]
	h, i = [[1, 0], [1, 1], [2, 1]], [[0, 1], [-1, 1], [-1, 2]]
	j, k = [[1, 0], [1, -1], [1, 1]], [[-1, 0], [0, 1], [1, 0]]
	l, m = [[0, -1], [-1, 0], [1, 0]], [[0, -1], [1, 0], [0, 1]]
	n, o = [[0, 1], [-1, 1], [-2, 1]], [[0, 1], [0, 2], [1, 2]]
	p, q = [[0, 1], [1, 0], [2, 0]], [[1, 0], [1, 1], [1, 2]]
	r, s = [[1, 0], [1, -1], [2, -1]], [[0, 1], [1, 1], [1, 2]]
	move = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s]

	for i in range(N):
		for j in range(M):
			for cur in move:
				tmp = arr[i][j]
				for val in cur:
					move_i, move_j = i + val[0], j + val[1]
					if 0 <= move_i < N and 0 <= move_j < M:
						tmp += arr[move_i][move_j]

				if result < tmp:
					result = tmp

	return result


N, M = map(int, input().split())

my_arr = []
for _ in range(N):
	my_arr.append(list(map(int, sys.stdin.readline().rsplit())))

print(make_max(my_arr))
```

<br>