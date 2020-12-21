---
title: "[BaekJoon] 백준 9465번 : 스티커"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 9465번 : 스티커

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/102737315-73116600-438a-11eb-8f98-5d64ed4ef2dc.png">
</center>

<br>

계속 같은 작업을 반복하면서 최대값이나 최소값을 구하고 싶으면 다이나믹 프로그래밍을 사용하면 된다.

이 문제는 스티커를 떼는 경우가 두 가지 있다.

위의 문제를 예시로 들어보자면 100점 스티커를 떼기 위해 50점에서 오는 경우와 30점에서 오는 경우가 있다.

그림으로 나타내보면 1번 자리에 있는 스티커를 떼기 위해 2번 자리에서 오거나 3번 자리에서 올 수 있는 것이다.

<img src="https://user-images.githubusercontent.com/54533309/102737814-bfa97100-438b-11eb-883e-5ef216a8f835.png" alt="image" style="zoom:10%;" />

이때 1+2 와 1+3 의 값 중 큰 값을 1에 대입해 주면 된다.

다이나믹 프로그래밍 문제는 계속 풀어봐야 감을 늘릴 수 있을 것같다..

---

```python
import sys


def findMaxStickerScore(arr):
	data = arr
	global n

	if n == 1:
		return max(data[0][0], data[1][0])
	elif n == 2:
		return max(data[0][0] + data[1][1], data[1][0] + data[0][1])

	data[0][1] = data[1][0] + data[0][1]
	data[1][1] = data[0][0] + data[1][1]
	for j in range(2, n):
		data[0][j] = max(data[0][j] + data[1][j - 1], data[0][j] + data[1][j - 2])
		data[1][j] = max(data[1][j] + data[0][j - 1], data[1][j] + data[0][j - 2])

	return max(data[0][n - 1], data[1][n - 1])


testCase = int(input())
for _ in range(testCase):
	n = int(input())
	dp = []
	for _ in range(2):
		dp.append(list(map(int, sys.stdin.readline().rsplit())))
	print(findMaxStickerScore(dp))
```

<br>

