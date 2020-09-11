---
title: "[BaekJoon] 백준 1931번 : 회의실배정"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1931번 : 회의실배정

<center><img width="1158" alt="Conference" src="https://user-images.githubusercontent.com/54533309/92914887-03284100-f467-11ea-9069-94f6d60806c8.png">
</center>



<br>

먼저 회의를 가장 많이 하려면 어떻게 해야할까를 생각해본다..

나는 회의시간이 짧고 시작시간이 빠른 회의를 먼저 한다.. 이렇게 생각을 했었다.

시작 시간을 기준으로 정렬을 한 뒤 회의시간이 가장 짧으면서 시작시간이 빠른 회의를 찾게 해보려고 했다.

그러니 불필요한 반복 작업을 너무 많이 했다.

그런데 반대로 생각해보면 종료 시간이 가장 빠른 회의를 먼저 하면 된다.

결국 종료 시간이 빠르면 다음에 할 수 있는 회의가 더 많아지기 때문이다.

문제에서 시작 시간과 종료 시간이 같은 경우가 있을 수 도 있다.

따라서 시작 시간을 기준으로 먼저 정렬을 하고 종료 시간을 기준으로 한 번 더 정렬을 하면 된다.

---

```python
from typing import List
import sys


def solution(conference: List) -> int:
	answer = 0
	end = 0

	for cur in conference:
		if cur[0] >= end:
			answer += 1
			end = cur[1]

	return answer


num = int(input())
_list = []

for _ in range(num):
	_list.append(list(map(int, sys.stdin.readline().rsplit())))

_list = sorted(_list, key=lambda a: (a[0], a[1]))
print(solution(_list))
```

