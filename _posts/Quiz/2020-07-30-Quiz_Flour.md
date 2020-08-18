---
title:  "[Programmers] 라면공장"
excerpt: ""

categories:
  - Quiz

tags:
---

## 라면공장

<a href="https://programmers.co.kr/learn/courses/30/lessons/42629" style="color:#0FA678" target="_blank">라면공장</a> 을 클릭하면 바로 이동한다.

처음에 힙을 사용하지 않고 풀어보려다가 고생만 엄청 했다.. 이 문제는 일단 문제를 이해하는게 중요했다 !

우선 문제를 쉽게 접근하려면 밀가루를 보유량을 버틸 수 있는 날로 바꾸어 생각하면 이해가 조금 더 잘 간다.

괜히 밀가루량 이랑 버틸 수 있는 날이랑 따로 생각하다보니 엄청 헷갈렸다.

밀가루 보유량이 k 보다 작은 경우 계산을 통해 밀가루를 보급받아야 한다.

하지만 최소한의 보급으로 버텨야 하기 때문에 보급 받을 수 있는 날짜에서 최대량을 보급 받아야 한다.

---

k 일 까지 보유한 밀가루로 버틸 수 없을 때

현재 보유한 밀가루 보다 작거나 같은 날짜에 받을 수 있는 모든 날짜 별 보급 밀가루량을 힙에 넣어 준 뒤 최댓값을 가져온다.

보유한 밀가루가 4 라면 늦어도 4일 뒤에는 보급을 받아야 다시 운영이 가능하기 때문이다.

```python
import heapq as hq


def solution(stock, dates, supplies, k):
	answer = 0
	start = 0
	max_supply = []
	flour_sum = stock

	while flour_sum < k:  # 밀가루가 k개 미만인 경우 보급받는다.
		for idx in range(start, len(dates)):
			if dates[idx] <= flour_sum:  # 보급 받을 수 있는 날 까지 보급량을 최대힙에 넣어준다.
				hq.heappush(max_supply, -supplies[idx])

			else:  # 보급 받을 수 있는 날 보다 먼저 받을 수 없으니 종료
				break

		start = idx  # 이미 힙에 넣어준 공급량을 중복해서 넣지 않도록 start 를 수정해준다.
		flour_sum += -hq.heappop(max_supply)
		answer += 1

	return answer
```

파이썬에서는 최소힙 밖에 지원하지 않는다. 그렇기 때문에 최대힙은 최소힙을 응용하면 된다.

힙에 넣어주는 값을 모두 음수로 바꾸어 넣는다면 가장 큰 값이 가장 작은 값으로 바뀌어 들어간다.

나중에 값을 사용하는 경우에 - 를 붙여주면 된다.



