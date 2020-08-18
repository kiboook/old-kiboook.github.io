---
title:  "[Programmers] 더 맵게"
excerpt: ""

categories:
  - Quiz

tags:

---

## 더 맵게

<a href="https://programmers.co.kr/learn/courses/30/lessons/42626" style="color:#0FA678" target="_blank">더 맵게</a> 를 클릭하면 바로 이동한다.

문제가 힙 카테고리에 있어서 힙으로 접근해야 하는 걸 알았지만..

진짜가 되려면 문제를 보고 '힙을 써야 금방 하겠다 !' 라는 생각이 들어야 한다.

처음엔 최소 힙 대신 우선순위큐를 써봤는데 정확도 문제는 다 맞는 반면 효율성에선 전부 틀렸다.

당연한 이야기겠지만 최소 힙은 루트 값을 뽑아오면 되지만 우선순위 큐는 제일 작은 값을 찾아야 하기 때문이다 !

---

```python
import heapq


def solution(scoville, k):
	answer = 0
	min_heap = list()

	for val in scoville:
		heapq.heappush(min_heap, val)

	while True:
		try:
			num1 = heapq.heappop(min_heap)
			num2 = heapq.heappop(min_heap)
			num3 = num1 + (num2 * 2)
			heapq.heappush(min_heap, num3)
			answer += 1

		except IndexError:
			answer = -1
			break

		if min_heap[0] >= k:
			break

	return answer
```

코드 그대로 쭉 설명해보면 scoville 을 통해 min_heap 을 만든 뒤

섞어서 만든 스코빌 값 중 최솟값이 K 를 넘으면 종료한다.

하지만 끝까지 섞었음에도 불구하고 최솟값이 K 를 넘지 못하면 -1을 반환 해야 한다.

이 경우는 마지막에 num2 를 pop 하는 과정에서 IndexError 가 발생 해 try, except 로 처리해주었다.