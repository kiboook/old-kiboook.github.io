---
title: "[BaekJoon] 백준 18870번 : 좌표 압축"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 18870번 : 좌표 압축

<center><img width="1160" alt="스크린샷 2020-10-08 오전 10 39 19" src="https://user-images.githubusercontent.com/54533309/95405354-864b9280-0952-11eb-8e0b-97fa14fc51ff.png">
</center>

<br>

중복을 제거 한 상태에서 자신보다 작은 데이터 개수를 반환하면 되는 문제이다.

**2, 4, -10, 4, -9** 가 주어졌을 때, 중복을 제거 한 뒤 정렬을 하면 **-10, -9, 2, 4** 가 된다.

이 때, 각 index 를 살펴보면 자신보다 작은 데이터 개수가 된다.

이 상태로 계속 index 를 찾아 반환해도 되지만 주어지는 수의 최대 개수가 1,000,000 개 이기 때문에 굉장히 비효율적이다.

따라서 해시테이블을 이용해 O(1) 시간에 찾을 수 있도록 하였다.

---

```python
import sys


def solution(arr):
	sort_arr = sorted(list(set(arr)))
	store_index = dict()

	for idx, val in enumerate(sort_arr):
		store_index[val] = idx

	answer = []
	for num in arr:
		answer.append(store_index[num])

	for cur in answer:
		print(cur, end=' ')


N = int(input())
input_arr = list(map(int, sys.stdin.readline().rsplit()))
solution(input_arr)
```

<br>