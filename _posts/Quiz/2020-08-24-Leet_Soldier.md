---
title:  "[LeetCode] 1395. Count Number of Teams"
excerpt: ""

categories:
  - LeetCode

tags:
---

## 1395. Count Number of Teams

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/soldier1.png" style="zoom:50%;" /></center>

주어진 배열에서 3 명을 뽑는데 다음과 같은 조건을 만족 시키면서 뽑으면 된다.

index 는 **i < j < k**, 값은 **rating[i] < rating[j] < rating[k] or rating[i] > rating[j] > rating[k]**

이때 뽑을 수 있는 경우의 수를 모두 구하는 문제이다.

처음엔 **combination** 으로 풀었다가 두 번째로는 **index** 를 직접 접근하여 풀었다.

---

```python
from typing import List
from itertools import combinations


class Solution:
	def solution1(self, rating: List[int]) -> int:
		answer = 0
		for cur in combinations(rating, 3):
			if cur[0] < cur[1] and cur[1] < cur[2]:
				answer += 1
			elif cur[0] > cur[1] and cur[1] > cur[2]:
				answer += 1

		return answer

	def solution2(self, rating: List[int]) -> int:
		answer = 0
		for i in range(len(rating) - 2):
			for j in range(i + 1, len(rating) - 1):
				for k in range(j + 1, len(rating)):
					if rating[i] > rating[j] > rating[k]:
						answer += 1
					elif rating[i] < rating[j] < rating[k]:
						answer += 1

		return answer
```

문제에선 rating 의 길이가 200 이라 속도 면에서 차이가 없지만 길이가 1000 단위로 넘어가면 solution1 이 10초 가량 더 빠르다.

그래도 둘 다 길이가 긴 rating 이 온다면 성능면에선 꽝이다. combination 을 전부 구하고.. O(n^3) 이고..

그래서 다른 사람들의 O(n^2), O(nlogn) 복잡도를 가진 코드를 봤는데 그곳은 내가 감당할 곳이 아니었다..