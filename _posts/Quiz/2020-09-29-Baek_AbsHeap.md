---
title: "[BaekJoon] 백준 11286번 : 절댓값 힙"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 11286번 : 절댓값 힙

<center><img width="1155" alt="ABS HEAP" src="https://user-images.githubusercontent.com/54533309/94535631-c2109900-027c-11eb-84d4-0041ba9f7f45.png">
</center>

<br>

주어진 값 중 양수만 저장하는 최소 힙, 음수만 저장하는 최대 힙 두 개를 가지고 문제를 해결 할 수 있다.

대략적인 알고리즘을 말해보자면 각 힙의 top 중 작은 값을 먼저 출력하고 top 이 같다면 음수를 먼저 출력하면 된다.

또 힙이 비어있는 경우 0 을 출력한다고 했으니 그건 따로 처리하면 된다.

---

```python
import heapq
import sys

positive_heap = []
negative_heap = []
for _ in range(int(input())):
	data = int(sys.stdin.readline().rsplit()[0])

	if data > 0:
		heapq.heappush(positive_heap, data)
	elif data < 0:
		heapq.heappush(negative_heap, -data)
	else:
		if positive_heap and negative_heap:
			if positive_heap[0] < negative_heap[0]:
				print(heapq.heappop(positive_heap))
			else:
				print(-heapq.heappop(negative_heap))
		else:
			if positive_heap:
				print(heapq.heappop(positive_heap))
			elif negative_heap:
				print(-heapq.heappop(negative_heap))
			else:
				print(0)
```

<br>