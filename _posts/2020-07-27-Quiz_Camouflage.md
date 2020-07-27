---
title:  "[Programmers] 위장"
excerpt: ""

categories:
  - Quiz

tags:


---

## 위장

<a href="https://programmers.co.kr/learn/courses/30/lessons/42578" style="color:#0FA678" target="_blank">위장</a> 을 클릭하면 바로 이동한다.

이 문제는 그냥 정말 순수 100% 수학 문제..

그게 아니면 아무리 생각해도 효율성에서 통과를 할 수 없을 것 같다.

---

먼저 2시간을 넘게 고민 해 봤지만 더 이상 빠르게 할 수없었던 코드를 설명해야겠다.

```python
from itertools import combinations
from collections import Counter

def multi(arr):
	result = 1
	for val in arr:
		result *= val
	return result


def solution(clothes):
	answer = 0
	clothes_cnt = [val[1] for val in clothes]
	clothes_dict = dict(Counter(clothes_cnt))

	_list = list()

	for i in range(1, len(clothes_dict) + 1):
		_list += list(combinations(clothes_dict.values(), i))

	for cur in _list:
		answer += multi(cur)

	return answer
```

예를 들어 상의, 하의, 모자가 각각 3, 2, 2 개 씩 있었다고 한다면 경우의 수는

3 + 2 + 2 + (3 * 2) + (3 * 2) + (2 * 2) + (3 * 2 * 2) 가 된다.

내가 생각 한 문제의 풀이 방법은 이 방법이 최선이였다.

어떤 방식으로 하던 조합을 구해서 계산을 해야 했기 때문에 combination 은 꼭 필요했다.

<img src="https://nam-ki-bok.github.io/assets/images/programmers/Camouflage.png" style="zoom:35%;" />

하지만 결과는 시간초과.. 아무리 생각해도 이 방법 보다 최선의 방법을 찾지 못했다.

그래서 결국 질문하기를 통해 다른 해결책을 알게 되었는데 정말 수학을 잘해야겠다는 생각이 들었다..

---

우선 아까 말한 3, 2, 2 를 A, B, C 로 치환 해 보자 그렇다면 내가 구하고 싶은 식은 A + B + C + AB + AC + BC + ABC 가 된다.

이 식은 (A + 1) * (B + 1) * (C + 1) - 1 과 같다. 이것만 알았다면 문제는 정말 쉬워진다.

```python
from collections import Counter


def solution(clothes):
	answer = 1
	clothes_cnt = [val[1] for val in clothes]
	clothes_dict = dict(Counter(clothes_cnt))

	for val in clothes_dict.values():
		answer *= val + 1

	return answer - 1
```

결국 종류 별 옷의 개수를 전부 1 씩 더해준뒤, 값을 전부 곱하고, 1을 빼주면 답이 된다.

정말 정말 수학적 센스를 많이 키워야겠다는 느낌을 받은 문제이다 !!!

