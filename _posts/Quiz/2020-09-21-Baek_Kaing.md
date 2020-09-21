---
title: "[BaekJoon] 백준 6064번 : 카잉 달력"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 6064번 : 카잉 달력

<center><img width="1164" alt="Kaing" src="https://user-images.githubusercontent.com/54533309/93760579-4349a980-fc47-11ea-9816-d1ffdd986150.png">
</center>

<br>이 문제도 정말 수학 문제..

우선 N 이 M 보다 큰 경우에 y 와 x 값도 서로 바꾸고 M 과 N 의 위치도 서로 바꾸었다.

그래서 무조건 M >= N 인 경우로 만들어 풀도록 했다.

이렇게 한 뒤 규칙을 계속 보면 y 값이 계속 반복이 된다.

예를 들어 **M = 13, N = 11** 에서 **<5, 6>** 이 몇 번째 해 인지 찾아본다면

첫 번째 5가 들어가는 해는 **<5, 5>** 이고 다음 해는 **<5, 7>, <5, 9>, <5, 11>, <5, 2> \.\.\. ** 

M - N 만큼 y 값을 더해주고 N 으로 나머지 계산을 해주면 규칙적으로 y 값이 늘어나게 된다.

이 과정을 반복하면서 찾고자 하는 해를 찾아가면 된다.

그리고 만약 종말의 해를 넘어간다면 표현될 수 없는 해 이기 때문에 -1을 출력하면 된다.

---

```python
import sys
from math import gcd


def find_LMC(M, N):
	_gcd = gcd(M, N)
	return _gcd * (M // _gcd) * (N // _gcd)


def find_kaing(M, N, x, y):
	if M < N:
		M, N = N, M
		x, y = y, x

	start = x % N
	if start == 0:
		start = N

	cnt = 0
	while start != y:
		start += M - N
		start %= N
		if start == 0:
			start = N
		cnt += 1

		if M * cnt > find_LMC(M, N):
			return -1

	return M * cnt + x


T = int(input())
for _ in range(T):
	in_M, in_N, in_x, in_y = map(int, sys.stdin.readline().rsplit())
	print(find_kaing(in_M, in_N, in_x, in_y))
```

<br>