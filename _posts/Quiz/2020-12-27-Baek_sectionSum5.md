---
title: "[BaekJoon] 백준 11660번 : 구간 합 구하기 5"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 11660번 : 구간 합 구하기 5

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103165493-04397e80-485c-11eb-942f-06144c6d1ca7.png">
</center>

<br>

구간 합을 구해야 하는 횟수가 최대 100,000 번 이기 때문에 매 번 구하게 되면 무조건 시간초과가 발생한다.

때문에 다이나믹 프로그래밍을 사용하면 된다.

처음 풀었던 방식은 행의 누적 합만 구한 뒤 그 값을 가지고 구간 합을 구했다.

<img src="https://user-images.githubusercontent.com/54533309/103165540-8cb81f00-485c-11eb-85a8-954f9739d6a7.png" alt="image" style="zoom:20%;" />

```python
import sys


n, m = map(int, sys.stdin.readline().rsplit())
arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]
loc = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(m)]
prefixSum = [[0 for _ in range(n)] for _ in range(n)]

for i in range(n):
	prefixSum[i][0] = arr[i][0]

for i in range(n):
	for j in range(1, n):
		prefixSum[i][j] = prefixSum[i][j - 1] + arr[i][j]

for cur in loc:
	res = 0
	x1, y1, x2, y2 = cur
	if y1 == 1:
		for i in range(x1 - 1, x2):
			res += prefixSum[i][y2 - 1]

	else:
		for i in range(x1 - 1, x2):
			res += (prefixSum[i][y2 - 1] - prefixSum[i][y1 - 2])
	print(res)
```

이 코드를 파이썬으로 제출하면 시간초과가 발생하지만 PyPy3 으로 제출하면 통과 하기는 한다..

---

파이썬으로 제출 해서 시간초과가 발생하지 않으려면 prefixSum 배열의 값을 (1, 1) (x, y) 까지의 구간 합을 구해 저장하면 된다.

<img src="https://user-images.githubusercontent.com/54533309/103165615-89716300-485d-11eb-9293-5910467bc683.png" alt="image" style="zoom:15%;" />

행의 누적값을 구한 뒤 그 배열을 가지고 다시 열의 누적값을 구하면 구간 합을 구할 수 있다.

이 배열에서 초록색 부분의 구간 합을 구하고 싶은 경우 빨간색 부분을 빼주면 된다.

이때 겹치는 빨간색 부분은 두 번 빼주기 때문에 한 번 더해주면 값을 구할 수 있다.

```python
import sys

n, m = map(int, sys.stdin.readline().rsplit())
arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]
loc = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(m)]
prefixSum = [[0 for _ in range(n)] for _ in range(n)]

for i in range(n):
	prefixSum[i][0] = arr[i][0]

for i in range(n):
	for j in range(1, n):
		prefixSum[i][j] = prefixSum[i][j - 1] + arr[i][j]

for i in range(n):
	for j in range(1, n):
		prefixSum[j][i] = prefixSum[j - 1][i] + prefixSum[j][i]

for cur in loc:
	x1, y1, x2, y2 = cur

	if x1 == 1 and y1 == 1:
		print(prefixSum[x2 - 1][y2 - 1])
	elif x1 == 1:
		print(prefixSum[x2 - 1][y2 - 1] - prefixSum[x2 - 1][y1 - 2])
	elif y1 == 1:
		print(prefixSum[x2 - 1][y2 - 1] - prefixSum[x1 - 2][y2 - 1])
	else:
		print(prefixSum[x2 - 1][y2 - 1] - prefixSum[x2 - 1][y1 - 2] - prefixSum[x1 - 2][y2 - 1] + prefixSum[x1 - 2][y1 - 2])
```

<br>