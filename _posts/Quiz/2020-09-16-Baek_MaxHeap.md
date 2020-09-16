---
title: "[BaekJoon] 백준 11279번 : 최대 힙"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 11279번 : 최대 힙

<center><img width="1148" alt="Max Heap" src="https://user-images.githubusercontent.com/54533309/93345819-3bb48a00-f86e-11ea-8dbf-4ed3f97f0f35.png">
</center>

<br>

파이썬은 기본 모듈로 heap 을 지원한다. 하지만 최소힙만 지원 하는 사실..

따라서 약간의 작업을 거치면 최대힙으로 구현 할 수 있다.

모든 값을 음수로 바꾸어 넣는다면 최솟값이 최댓값이 되기 때문에 출력 할 때만 다시 양수로 바꿔주면 된다.

---

```python
import heapq
import sys

N = int(input())
heap = []

for _ in range(N):
	data = int(sys.stdin.readline().rsplit()[0])

	if data == 0:
		if heap:
			print(heapq.heappop(heap) * -1)
		else:
			print(0)

	else:
		heapq.heappush(heap, data * -1)
```
