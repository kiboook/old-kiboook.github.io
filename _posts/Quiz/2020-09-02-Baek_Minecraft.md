---
title:  "[BaekJoon] 백준 18111번 : 마인크래프트"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 18111번 : 마인크래프트

<center><img width="1151" alt="mine" src="https://user-images.githubusercontent.com/54533309/91975920-206c5980-ed5b-11ea-8812-b88d0616bc6f.png"></center>

<br>

처음엔 이진탐색을 써야하나.. 주어진 땅에서 가장 높은 높이를 기준으로 뭘 어떻게 해야하나 엄청 고민했다.

그런데 어떤 경우는 높이를 0 으로 만들 때가 시간이 가장 적게 걸리고 어떤 경우는 또 최대로 높여야 시간이 적게 걸리고 그랬다.

결국 높이가 0 부터 256 까지 모든 경우를 따져서 최솟값을 반환하면 되는 완전탐색 문제였다. **하지만 또 문제가 발생했다 !!!!!**

이 문제의 경우 최악일때 257 * 500 * 500 을 반복한다. 다른 언어의 경우 이렇게 반복을 해도 시간초과에 걸리지 않는다.

그러나 파이썬은 257 * 500 * 500 으로 돌게되면 주어진 제한시간인 1초를 넘어버린다. 따라서 반복하는 횟수를 줄일 필요가 있다.

일일이 땅을 돌지말고 같은 높이를 가진 땅을 묶어두어 한 번에 계산을 하면 257 * 257 로 줄일 수 있다.

또 모든 높이를 계산하면 안된다. 예를 들어 **[2, 4]** 의 땅이 주어지고 주머니에 아무 블럭이 없을 때, 높이를 모두 4로 만들 수 없다.

이처럼 내가 가진 모든 블럭의 갯수가, 만들고자 하는 높이로 만들었을 때 필요한 블럭 갯수보다 적으면 계산할 필요가 없다.

---

```python
from collections import Counter


def make_land(height):
	sec = 0
	for key in land:
		if key < height:
			sec += (height - key) * land[key]
		elif key > height:
			sec += (key - height) * 2 * land[key]
	return sec


n, m, inven = map(int, input().split())
land = []
for _ in range(n):
	land += map(int, input().split())

_sum, _len = sum(land), n * m
land = dict(Counter(land))
height, min_sec = 0, 100000000000000

for i in range(257):

	if _len * i <= _sum + inven:
		sec = make_land(i)
		if sec <= min_sec:
			min_sec = sec
			height = i

print(min_sec, height)
```

이렇게 했는데 처음에 **틀렸습니다!** 가 나왔다.

아무리 생각해도 알고리즘에 틀린 부분이 없어서 혹시 몰라 **min_sec** 를  더 크게 늘렸더니 통과했다..

처음에 10000000 로 초기화 했었는데 이 것 보다 더 오래걸리는 답이 있었나보다.