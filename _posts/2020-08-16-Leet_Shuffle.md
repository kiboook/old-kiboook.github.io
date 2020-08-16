---
title:  "[LeetCode] Shuffle The Array"
excerpt: ""

categories:
  - LeetCode

tags:
---

## Shufle The Array

오늘 부터 <a href="https://leetcode.com/" style="color:#0FA678" target="_blank">릿코드</a> 에 있는 문제도 풀어보려고 한다.

Easy, Medium, Hard 로 문제를 구분하고 있다.

일단 모든 문제가 영어라서 영어 공부도 할 겸 해서 풀어봐야겠다.

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/shuffle1.png" style="zoom:50%;" /></center>

이 문제는 List 를 반으로 나눈 뒤 서로 번갈아가며 원소를 넣어 새로운 List 를 만들면 된다.

---

```python
from typing import List


class Solution:
	def shuffle(self, nums: List[int], n: int) -> List[int]:
		answer = []
		list_a = nums[:n]
		list_b = nums[n:]

		for a, b in zip(list_a, list_b):
			answer.append(a)
			answer.append(b)

		return answer
```

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/shuffle2.png" style="zoom:50%;" /></center>

그리고 릿코드에 아주 신기한 기능이 있다.

바로 내 코드가 얼마나 시간이 걸렸고 같은 언어를 사용하는 사람들 중 얼만큼 빠르고

메모리를 얼마나 사용하고 같은 언어를 사용하는 사람들 중 얼만큼 적게 사용하는지를 보여준다.

Details 를 누르면 막대그래프를 통해 아주 자세히 보여준다.

내 코드가 어떤지 직관적으로 볼 수 있어 재밌는 기능..