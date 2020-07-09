---
title:  "[Programmers] 기능개발"
excerpt: ""

categories:
  - Quiz

tags:

---

## 기능개발

<a href="https://programmers.co.kr/learn/courses/30/lessons/42586" style="color:#0FA678" target="_blank">기능개발</a> 을 클릭하면 바로 이동한다.

> 프로그래머스 팀에서는 기능 개선 작업을 수행 중입니다. 각 기능은 진도가 100%일 때 서비스에 반영할 수 있습니다.
>
> 또, 각 기능의 개발속도는 모두 다르기 때문에 뒤에 있는 기능이 앞에 있는 기능보다 먼저 개발될 수 있고
>
> 이때 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포됩니다.
>
> 먼저 배포되어야 하는 순서대로 작업의 진도가 적힌 정수 배열 progresses와
>
> 각 작업의 개발 속도가 적힌 정수 배열 speeds가 주어질 때 각 배포마다 몇 개의 기능이 배포되는지를
>
> return 하도록 solution 함수를 완성하세요.



저번에 풀었던 Level 2 문제와 다르게 아주 쉬웠던 문제 !

각 작업이 배포까지 며칠 걸리는 지 구한 뒤 조건에 맞게 계산 해 주면 됐다.

```python
from math import ceil


def solution(progresses, speed):
	answer = []
	date = [ceil((100 - p) / s) for p, s in zip(progresses, speed)]

	while date:
		cnt = 1
		check = date.pop(0)

		while True:
			try:
				if check >= date[0]:
					date.pop(0)
					cnt += 1
				else:
					answer.append(cnt)
					break

			except IndexError:
				answer.append(cnt)
				break
	return answer
```

list comprehension 을 통해 배포까지 걸리는 일 수 를 저장하고

맨 앞에서 부터 배포를 할 때 한 번에 배포 되는 작업 개수를 셌다.

첫 while 문에 들어갈때 pop을 하고 들어가기 때문에 마지막 원소에서는 IndexError 가 발생한다.

그래서 Try Except 문으로 잡아주었다.

구조 상으로는 먼저 들어온 데이터가 먼저 나가는 큐가 더 적합하다.

하지만 list 로 만든 뒤 pop(0) 을 하면 queue 함수인 popleft() 와 동일 하다.

queue 를 사용하려면 collection 에 있는 queue 를 import 한 후 사용해야하는데..

무슨 차이가 있는지 알아봐야겠다.