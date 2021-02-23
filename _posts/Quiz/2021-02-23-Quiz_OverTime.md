---
title:  "[Programmers] 야근 지수"
excerpt: ""

categories:
  - Quiz

tags:
---

## 야근 지수

<a href="https://programmers.co.kr/learn/courses/30/lessons/12927" style="color:#0FA678">야근 지수</a> 를 클릭하면 바로 이동한다.

야근 지수는 야근을 할 때 남은 작업량의 제곱의 합이다.

때문에 야근을 하기 전 까지 최대한 작업량이 많은 작업들을 줄여 놓으면 된다.

즉, 시간이 갈 때 마다 배열의 최댓값에서 1을 빼주면 된다.

작업을 할 때 마다 최댓값을 찾아야 하기 때문에 max 함수를 이용하면 시간초과가 발생한다.

이럴 때 최대힙을 사용하면 된다.

하지만 파이썬은 최소힙만을 제공하기 때문에 원래 값에 -1 을 곱해 최대힙을 구현한다.

제곱을 해서 더하라는 이유가 최대힙을 구현하면 -1 을 곱해야 하니 힌트를 준 것인가..

---

```python
import heapq


def solution(n, works):
	result = 0

	if sum(works) <= n:
		return 0

	for i in range(len(works)):
		works[i] *= -1

	heapq.heapify(works)
	for i in range(n):
		work = heapq.heappop(works) * -1
		work -= 1
		heapq.heappush(works, work * -1)

	for work in works:
		result += (work ** 2)

	return result
```

 <br>

