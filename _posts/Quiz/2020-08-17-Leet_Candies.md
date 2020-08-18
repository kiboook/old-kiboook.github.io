---
title:  "[LeetCode] Kids With the Greatest Number of Candies"
excerpt: ""

categories:
  - LeetCode

tags:
---

## Kids With the Greatest Number of Candies

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/candy1.png" style="zoom:50%;" /></center>

각자 어린이들이 가진 사탕 개수와 추가 사탕 개수를 더해 어린이들 중에 가장 많이 사탕을 가지고 있으면 True 를 반환한다.

---

처음엔 추가 사탕 개수를 더한 뒤 그 때 사탕 배열에서 max 값을 찾아 반환하는 식으로 코딩을 했다.

그리고 제출을 해보니.. 동작 시간도 느릴 뿐 더러 메모리 사용량은 거의 최하위였다..

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/candy2.png" style="zoom:50%;" /></center>

그래서 맨 처음 한 번만 최대값을 구하고 비교를 하니 실행시간, 메모리 사용량이 눈에 띄게 좋아졌다.

```python
from typing import List


class Solution:
	def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
		answer = []
		max_val = max(candies)

		for val in candies:
			if val + extraCandies >= max_val:
				answer.append(True)
			else:
				answer.append(False)

		return answer
```

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/candy3.png" style="zoom:50%;" /></center>

