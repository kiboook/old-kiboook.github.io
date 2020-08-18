---
title:  "[Programmers] 타겟넘버"
excerpt: ""

categories:
  - Quiz

tags:


---

## 타겟넘버

<a href="https://programmers.co.kr/learn/courses/30/lessons/43165" style="color:#0FA678" target="_blank">타겟넘버</a> 를 클릭하면 바로 이동한다.

DFS / BFS 카테고리에 있어서 덕분에 개념도 다시 공부하고 파이썬으로 코딩 하는 방법도 익혔다.

---

```python
answer = 0


def DFS(nums, target, idx, sum):
	global answer
	if idx == len(nums):
		if sum == target:
			answer += 1
		return

	DFS(nums, target, idx + 1, sum + nums[idx])
	DFS(nums, target, idx + 1, sum - nums[idx])


def solution(nums, target):
	DFS(nums, target, 0, 0)
	return answer
```

모든 경우의 수를 다 구해 값을 비교 해 주면 된다. 이때 재귀를 이용하면 간단하게 구현 할 수 있다.

문제를 풀고 다른 사람 코드를 보는데 진짜 대단한 코드가 있어서 소개해본다.

```python
from itertools import product


def solution(numbers, target):
    _list = [(x, -x) for x in numbers]
    result = list(map(sum, product(*_list)))
    return result.count(target)
```

이 코드를 보고 진짜 진짜 엄청 똑똑하고 대단하다고 느꼈다..

product 는 두 개 이상의 리스트의 모든 조합을 반환한다.

예를들어 [(1, -1), (2, -2)] 라는 리스트를 product 한다면 [(1, 2), (1, -2), (-1, 2), (-1, -2)] 이렇게 반환된다.

입력받은 숫자를 (+, -) 로 묶어 리스트를 만들고 그 리스트를 가지고 모든 조합을 만들어 계산한뒤 target 개수를 센 것이다..

