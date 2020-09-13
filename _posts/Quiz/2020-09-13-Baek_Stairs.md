---
title: "[BaekJoon] 백준 2579번 : 계단 오르기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2579번 : 계단 오르기

<center><img width="1151" alt="stair1" src="https://user-images.githubusercontent.com/54533309/93012626-ddbd4380-f5dc-11ea-80e7-2a368cc988e0.png">
</center>

<center><img width="1151" alt="stair2" src="https://user-images.githubusercontent.com/54533309/93012603-b36b8600-f5dc-11ea-99a2-67f09688801c.png">
</center>

<br>

처음 문제를 풀 때는 마지막 계단은 무조건 밟아야 하니 거꾸로 마지막 계단을 밟고 시작해 바닥으로 내려가는 식으로 접근했다.

그리고 한 칸을 내려간 경우, 두 칸을 내려간 경우를 비교 해 큰 값이 있는 계단으로 내려갔다.

이 때 한 칸을 내려간 경우는 다음에 한 칸을 또 내려갈 수 없으니 무조건 두 칸을 또 내려가게 해두었다.

이런식으로 접근을 했었는데 같은 값이 연속으로 올 때 등 맞지 않는 부분이 엄청 많았다..

어떤 알고리즘을 사용해야 하는지만 살짝 봤는데 DP 를 활용하면 풀 수 있는 문제이다.

DP 를 사용하는 문제를 풀어 본 적이 있어서 계속 풀이를 생각해 보았는데 연속 된 세 개의 계단을 밟으면 안되는 조건이 너무 어려웠다.

다른 사람들의 풀이를 보고 이해를 할 수 있었다.. 어떻게 바로 이런 생각을 할 수 있을까 대단하군..

일단 첫 번째, 두 번째, 세 번째 계단 까지의 최댓값은 식을 통해 구할 수 있다.

이 다음부터 DP 를 사용하면 되는데 한 칸 뒤에서 올라온 경우와 두 칸 뒤에서 올라온 경우를 구해 더 큰 값을 가지면 된다.

만약 내가 **한 칸 뒤에서 올라온 경우**는 **현재 계단 점수, 한 칸 뒤 계단 점수, DP[세 칸 뒤 계단]** 점수를 더한다.

**두 칸 뒤에서 올라온 경우**는 **현재 계단 점수, DP[두 칸 뒤 계단]** 점수를 더한다.

처음에 이해하기가 어려웠는데 이해하고 보면 생각보다 나쁘지 않게 풀 수 있을 것 만 같은 기분이다.

DP 관련 문제를 많이 풀어서 이런 느낌을 계속 접해봐야 할 것 같다.

---

```python
import sys


def find_max_score(stairs):
	if len(stairs) == 1:
		return stairs[0]

	if len(stairs) == 2:
		return stairs[0] + stairs[1]

	if len(stairs) == 3:
		return max(stairs[0] + stairs[2], stairs[1] + stairs[2])

	dp = list()
	dp.append(stairs[0])
	dp.append(stairs[0] + stairs[1])
	dp.append(max(stairs[0] + stairs[2], stairs[1] + stairs[2]))

	for i in range(3, len(stairs)):
		dp.append(max(stairs[i] + stairs[i - 1] + dp[i - 3], stairs[i] + dp[i - 2]))

	return dp[-1]


N = int(input())
_stairs = [int(sys.stdin.readline().rsplit()[0]) for _ in range(N)]
print(find_max_score(_stairs))
```

