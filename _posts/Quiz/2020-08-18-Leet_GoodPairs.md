---
title:  "[LeetCode] 1512. Number Of Good Pairs"
excerpt: ""

categories:
  - LeetCode

tags:
---

## Number Of Good Pairs

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/pair1.png" style="zoom:50%;" /></center>

배열 안에 같은 숫자로 이루어진 짝의 개수를 반환 하는 문제이다.

---

이 중 포문을 사용하면 풀 수 있다. 하지만 포문을 한 번만 사용해서도 풀 수 있는데 수학적으로 생각하는게 참 대단한 것 같다.

```python
import collections
from typing import List


class Solution:
	def numIdenticalPairs(self, nums: List[int]) -> int:
		pair_num = 0
		for i in range(len(nums)):
			for j in range(i + 1, len(nums)):
				if nums[i] == nums[j]:
					pair_num += 1
		return pair_num

		# d = collections.defaultdict(int)
		# for i in nums:
		# 	d[i] += 1
		# return sum(k * (k - 1) // 2 for k in d.values())

		# d = dict()
		# for i in nums:
		# 	try:
		# 		d[i] += 1
		# 	except KeyError:
		# 		d[i] = 1
		# return sum(k * (k - 1) // 2 for k in d.values())
```

collection 의 defaultdict 를 사용하면 키가 없는 경우 미리 정해 둔 값을 반환한다.

위에서는 **defaultdict(int)** 로 해두었기 때문에 키가 없는 경우 0 을 반환한다.

포문을 한 번만 사용하는 경우 이렇게 dict 를 만들어 nums 에서 주어진 각 숫자의 개수를 센다.

그리고 그 숫자마다 만들 수 있는 짝의 수를 계산한다. k * (k - 1) 에서 2 를 나누어 준 이유는 (i, j) , (j, i) 의 중복을 제외하기 위함이다.

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/pair2.png" style="zoom:50%;" /></center>



이 문제에선 이중포문과 단일포문을 사용 한 경우 속도가 4ms 밖에 차이가 나지는 않지만 어떻게든 복잡도를 줄이는게 제일 중요하다 !!!

어떤 알고리즘이 주어졌을 때 그것을 수학적으로 바꿀 수 있는 능력이 제일 부럽다..

---

더 추가로 검색을 해보았는데 collection 에 리스트 원소 개수를 세주는 함수가 있었다. **Counter()**  를 사용 하면 된다.

```python
import collections


class Solution:
	def numIdenticalPairs(self, nums: List[int]) -> int:

		d = collections.Counter(nums)
		return sum(k * (k - 1) // 2 for k in d.values())
```

위에서 구현했던 Counter() 함수가 이미 내장되어 있었다. 이 코드로 제출을 하면 메모리 사용은 비슷하지만 런타임이 24ms 가 된다.