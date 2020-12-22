---
title: "[BaekJoon] 백준 11053번 : 가장 긴 증가하는 부분 수열"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 11053번 : 가장 긴 증가하는 부분 수열

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/102847745-7114d900-4456-11eb-9d66-f85e5935919c.png">
</center>


<br>

바로 어제 DP 문제를 풀었는데 이 문제도 DP를 이용하는 문제였다..

하지만 처음에는 DP를 이용해야겠다는 생각을 못 했다..

어제 문제를 풀면서 DP 문제를 어느정도 알았다고 생각했는데 전혀 아니였다..

심지어 DP 인걸 알았지만 어떻게 접근해야 할 지 감이 오지 않았다.

해결방법은 각자 수 마다 자신이 포함되어있는 수열의 길이를 저장한다.

그렇게 되면 자기보다 작은 수 중 가장 큰 수열 길이를 가져와 1을 더해주면 된다.

<img src="https://user-images.githubusercontent.com/54533309/102848137-66a70f00-4457-11eb-8c0c-31a558b0231b.png" alt="image" style="zoom:13%;" />

이 배열 같은 경우 가장 긴 증가하는 수열의 길이는 6이 된다.

DP 문제만 따로 모아 풀어볼까 생각도 했는데 그렇게 되면 지금 푸는 문제가 DP 문제인걸 알기 때문에

먼저 내가 푸는 문제는 DP 를 써야한다는걸 알 수 있는 연습을 해야겠다..

---

```python
import sys


n = int(input())
data = list(map(int, sys.stdin.readline().rsplit()))
dp = [0 for i in range(n)]
dp[0] = 1

for i in range(1, len(data)):
	for j in range(i):
		if data[i] > data[j] and dp[i] < dp[j]:
			dp[i] = dp[j]
	dp[i] += 1

print(max(dp))
```

<br>

