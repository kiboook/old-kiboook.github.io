---
title:  "[Programmers] 후보키"
excerpt: ""

categories:
  - Quiz

tags:
---

## 후보키

<a href="https://programmers.co.kr/learn/courses/30/lessons/42890" style="color:#0FA678" target="_blank">후보키</a> 를 클릭하면 바로 이동한다.

릴레이션이 주어지면 해당 릴레이션에서 몇 개의 후보키를 만들 수 있는지 반환하면 되는 문제.

속성을 가지고 모든 키 조합을 만든 뒤 유일성, 최소성을 모두 만족하는지 확인하면 된다.

튜플로 주어지기 때문에 map, zip 을 이용해 속성끼리 묶은 뒤 시작했다.

---

만약 속성이 네 가지가 있는 릴레이션이 주어진다면 만들 수 있는 모든 키 조합은

(0), (1), (2), (3), (0, 1), (0, 2), (0, 3), (0, 1, 2), (0, 1, 3), (1, 2, 3), (0, 1, 2, 3) 이 있다.

최소성을 확인해야하기 때문에 조합의 크기가 작은 순서부터 체크하면 된다.

우선 각 속성이 키가 될 수 있는지 검사 한다. 키가 될 수 있는 경우 candidate 리스트에 담는다.

만약 검사하는 키 조합에 일부가 이미 candidate 리스트에 있다면 제외한다. 최소성에 위반 되기 때문이다.

이렇게 모든 키 조합을 검사 한 뒤 candidate 리스트 길이를 반환 하면 된다.

```python
from itertools import combinations


def solution(relation):
	attribute = list(map(list, zip(*relation)))
	candidate = []

	for i in range(1, len(attribute) + 1):
		attribute_num = map(list, combinations([val for val in range(len(attribute))], i))
		for j in attribute_num:
			check = []
			for k in j:
				check.append(attribute[k])
			if len(set(zip(*check))) == len(attribute[0]):
				for cur in candidate:
					if cur.issubset(set(j)):
						break
				else:
					candidate.append(set(j))

	return len(candidate)
```





