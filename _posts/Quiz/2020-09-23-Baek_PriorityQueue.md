---
title: "[BaekJoon] 백준 7662번 : 이중 우선순위 큐"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 7662번 : 이중 우선순위 큐

<center><img width="1158" alt="PriorityQueue" src="https://user-images.githubusercontent.com/54533309/93995329-d27fca00-fdcb-11ea-8397-70d8dcdf336c.png">
</center>

<br>

우선 최소 힙, 최대 힙을 이용 해 풀어보려고 했는데 동기화 과정에서 시간 복잡도를 줄일 방법이 생각이 안나 포기했었다.

그리고 이중 연결리스트로 풀어보려고 했지만 시간초과가 발생했다.

삭제는 **O(1)** 삽입은 **O(N)** 이었는데 말이다..

이 방법이 제일 낫다고 생각했는데 막혀버려 질문글을 조금 보니 삽입을 **O(logN)** 까지 줄여야 통과를 한다고 했다.

고민을 해보았는데 도저히 답이 안나와서 다른 분의 풀이를 보고 이해를 했다..

파이썬은 최소 힙만 지원을 하기 때문에 삽입하는 값에 - 를 붙여 최대 힙 마냥 사용 할 수 있다.

이렇게 두 개의 힙을 만든 뒤 어떤 값을 다른 힙에서 삭제했는지 알기 위해 값 마다 key 를 붙여준다.

그리고 삭제를 진행 할 때 마다 이미 다른 힙에서 지우는 과정을 수행했던 값은 바로바로 지워준다.

이 과정이 처음에 이해가 안갔는데 그림을 그려서 일일이 해보니 이해가 갔다.

<br>

**참조**

<a href="https://neomindstd.github.io/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4/boj7662/" style="color:#0FA678" target="_blank">[백준/파이썬] 7662번 이중 우선순위 큐 풀이</a>

---

```python
import sys
import heapq


test = int(input())
for _ in range(test):
	max_heap, min_heap = [], []
	visit = [False] * 1_000_001

	order_num = int(input())
	for key in range(order_num):
		order = sys.stdin.readline().rsplit()
		if order[0] == 'I':
			heapq.heappush(min_heap, (int(order[1]), key))
			heapq.heappush(max_heap, (int(order[1]) * -1, key))
			visit[key] = True

		elif order[0] == 'D':
			if order[1] == '-1':
				while min_heap and not visit[min_heap[0][1]]:
					heapq.heappop(min_heap)
				if min_heap:
					visit[min_heap[0][1]] = False
					heapq.heappop(min_heap)
			elif order[1] == '1':
				while max_heap and not visit[max_heap[0][1]]:
					heapq.heappop(max_heap)
				if max_heap:
					visit[max_heap[0][1]] = False
					heapq.heappop(max_heap)

	while min_heap and not visit[min_heap[0][1]]:
		heapq.heappop(min_heap)
	while max_heap and not visit[max_heap[0][1]]:
		heapq.heappop(max_heap)

	if min_heap and max_heap:
		print(max_heap[0] * -1, min_heap[0])
	else:
		print('EMPTY')
```

<br>