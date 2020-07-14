---
title:  "[Programmers] 주식 가격"
excerpt: ""

categories:
  - Quiz

tags:

---

## 주식 가격

<a href="https://programmers.co.kr/learn/courses/30/lessons/42584" style="color:#0FA678" target="_blank">주식 가격</a> 을 클릭하면 바로 이동한다.

효율성도 따졌던 문제였지만 deque 를 사용해 통과했다 !

```python
from collections import deque


def solution(prices):
	answer = list()
	prices = deque(prices)

	while prices:
		check = prices.popleft()
		sec = 0

		for val in prices:
			sec += 1
			if check <= val:
				continue
			else:
				break
		answer.append(sec)

	return answer
```

주식 가격이 몇 초 동안 떨어지지 않았나를 계산하는 문제다.

반복문에 들어와서 무조건 초는 1초를 더해 준 뒤 값을 비교해서 따지면

금방 풀 수 있는 문제.

prices 를 list 그대로 풀게 되면 효율성에서 전부 시간초과가 나와 틀리게 된다.

왼쪽 부터 뽑아야 하는 경우 꼭 deque 를 사용하자 !!

<a href="https://nam-ki-bok.github.io/python/Python_list_queue/" style="color:#0FA678">[Python] List VS Queue</a>