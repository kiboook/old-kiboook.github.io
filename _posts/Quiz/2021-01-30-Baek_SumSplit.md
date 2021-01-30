---
title: "[BaekJoon] 백준 2225번 : 합분해"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2225번 : 합분해

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/106349307-616b9880-6310-11eb-9e4b-21e981ee8a85.png">
</center>

<br>

특정 N, K 를 가지고 직접 풀다보면 규칙이 보이는 문제이다.

그 규칙을 가지고 점화식을 세우면 되는데 **[N, K] = [0, K - 1] + [1, K - 1] + ... + [N - 1, K - 1] + [N, K - 1]** 식을 구할 수 있다.

DP 배열을 한 개 만들어서 점화식을 통해 값을 구하면 된다.

풀고나서 다른사람들의 풀이를 봤는데 **중복조합** 을 이용하면 DP 배열 없이 문제를 풀 수 있었다.

이 문제는 n+1 개를 가지고 숫자 중복이 가능하게 k-1 개의 공간을 만드는 것과 같다.

즉 (n+1) H (k-1) 의 식을 세워 풀면 답이 된다.

```python
from math import factorial

n, r = map(int, input().split())
print(factorial(n + r - 1) // (factorial(r - 1) * factorial(n)) % 1_000_000_000)
```

이런걸 생각해서 푸는 사람은 정말 대단한 것 같다..

---

```python
def solution():
	dp = [[1] * (K + 1) for _ in range(N + 1)]
	for i in range(N + 1):
		dp[i][0] = 0

	for i in range(1, N + 1):
		for j in range(2, K + 1):
			sum = 0
			for n in range(i + 1):
				sum += dp[n][j - 1]
			dp[i][j] = sum

	return dp[N][K] % 1_000_000_000


if __name__ == '__main__':
	N, K = map(int, input().rsplit())
	print(solution())
```

<br>

