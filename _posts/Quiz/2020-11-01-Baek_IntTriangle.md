---
title: "[BaekJoon] 백준 1932번 : 정수 삼각형"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1932번 : 정수 삼각형

<center><img width="1150" alt="스크린샷 2020-11-01 오후 5 05 45" src="https://user-images.githubusercontent.com/54533309/97797909-7c246780-1c64-11eb-87f6-bafd265b2322.png">
</center>


<br>

DP를 이용해 푸는 문제이다.

왼쪽 대각선의 합, 오른쪽 대각선의 합을 DP 배열에 계속 넣어주면 된다.

문제에서 합이 최대가 되는 값을 출력하면 되기 때문에 DP 배열에 넣어 줄 때 큰 값을 넣어주면 된다.

---

```python
import sys
from copy import deepcopy


size = int(input())
arr = []
dp = []
for _ in range(size):
	tmp = list(map(int, sys.stdin.readline().rsplit()))
	arr.append(tmp)

dp = deepcopy(arr)
for i in range(size - 1):
	for j in range(i + 1):
		left = dp[i][j] + arr[i + 1][j]
		right = dp[i][j] + arr[i + 1][j + 1]

		dp[i + 1][j] = max(dp[i + 1][j], left)
		dp[i + 1][j + 1] = max(dp[i + 1][j + 1], right)

print(max(sum(dp, [])))
```

<br>