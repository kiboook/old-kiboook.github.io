---
title:  "[LeetCode] 1561. Maximum Number of Coins You Can Get"
excerpt: ""

categories:
  - LeetCode

tags:
---

## Maximum Number of Coins You Can Get

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/maxcoin1.png" style="zoom:50%;" /></center>

3의 배수의 길이로 되어있는 int 로 이루어진 리스트가 주어지면

순서 상관없이 리스트에서 3 개씩 돈을 뽑은 뒤 친구가 가장 큰 돈을 가져가고 그 다음으로 큰 돈을 내가 가져간다.

이 작업을 반복했을 때 내가 가져갈 수 있는 돈은 최대 얼마인가를 구하면 된다.

처음엔 리스트에서 Max, Max, Min 을 뽑아서 두 번째 Max 값을 더해주는 방식으로 진행을 했다.

하지만 주어지는 리스트의 최대 길이는 무려 10<sup>5</sup> 이었다. 최대 길이로 주어졌을 경우에 계속 Max, Max, Min 을 뽑는다니..

생각만 해도 소름이 돋는다. 그래서 주어진 리스트를 먼저 한 번 정렬을 한 뒤 queue 로 만들었다.

그리고 **pop, pop, popleft** 를 해주어 답을 구했다.

---

```python
from typing import List
from collections import deque

class Solution:
	def maxCoins(self, piles: List[int]) -> int:
		answer = 0
		queue = deque()
		queue.extend(sorted(piles))

		while queue:
			queue.pop()
			answer += queue.pop()
			queue.popleft()

		return answer
```

