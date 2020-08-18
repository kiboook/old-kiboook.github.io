---
title:  "[Programmers] 캐시"
excerpt: ""

categories:
  - Quiz

tags:
---

## 캐시

<a href="https://programmers.co.kr/learn/courses/30/lessons/17680" style="color:#0FA678" target="_blank">캐시</a> 를 클릭하면 바로 이동한다.

우선 캐시의 개념과 캐시를 교체 할 때 의 알고리즘을 알고 있어야 한다.

이 문제에선 LRU (Least Recently Used) 알고리즘을 사용하라고 했다.

저번 학기에 운영체제를 배우면서 페이지 교체를 할 때 알고리즘을 배웠는데 똑같은 개념이었다.

---

LRU 는 말 그대로 가장 오래전에 사용 된 캐시를 바꾸면 된다.

deque 의 Maxlen 을 사용하여 원형 큐 처럼 사용 하면 구현 할 수 있다.

그렇게 된다면 무조건 index 0 에 있는 캐시가 가장 오래전에 사용 된 캐시이다.

하지만 나는 최근 사용 한 캐시를 따로 저장해 관리했다. 캐시를 고정 시켜 놓은 뒤 가장 오래 된 캐시의 index 를 찾아 바꾼 것 이다.

이렇게 된다면 캐시 사이즈가 다를 때 마다 최근 사용 한 캐시 목록의 크기도 달라지고 신경 써야할게 많아진다.

deque 를 사용했으면서 deque 의 성질을 사용하지 못했다는 것이 조금 아쉽다.

```python
from collections import deque


def solution(cacheSize, cities):
	total = 0
	cache = deque()
	cities = [val.title() for val in cities]

	if cacheSize == 0:
		return len(cities) * 5

	for idx, val in enumerate(cities):
		if len(cache) < cacheSize:
			if val in cache:
				total += 1
			else:
				cache.append(val)
				total += 5
		elif len(cache) == cacheSize:
			if val in cache:
				total += 1
			else:
				lately_used = []
				lately_idx = idx - 1
				while len(lately_used) < cacheSize - 1:
					if cities[lately_idx] not in lately_used:
						lately_used.append(cities[lately_idx])
					lately_idx -= 1

				chance_val = ''
				for j in cache:
					if j not in lately_used:
						chance_val = j

				input_idx = cache.index(chance_val)
				cache.insert(input_idx, val)
				cache.remove(chance_val)
				total += 5

	return total
```

---

이 코드가 deque 성질을 완벽히 이용해 LRU 를 구현했다고 생각한다.

```python
import collections


def solution(cacheSize, cities):

	cache = collections.deque(maxlen=cacheSize)
	time = 0
	
	for cur in cities:
		val = cur.lower()
		if val in cache:
			cache.remove(val)
			cache.append(val)
			time += 1
		else:
			cache.append(val)
			time += 5
		print(cache)
	return time
```

