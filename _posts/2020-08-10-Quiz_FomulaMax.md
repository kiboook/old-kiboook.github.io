---
title:  "[Programmers] 수식 최대화"
excerpt: ""

categories:
  - Quiz

tags:
---

## 수식 최대화

<a href="https://programmers.co.kr/learn/courses/30/lessons/67257" style="color:#0FA678" target="_blank">수식 최대화</a> 를 클릭하면 바로 이동한다.

주어진 수식에 연산자가 +, - 만 왔다고 하더라도 없는 연산자는 계산에서 무시되기 때문에

세 가지 연산자에 있어서 6가지 경우의 우선순위를 가지고 전부 계산을 한 뒤 값을 비교하면 된다.

---

풀긴 풀었는데 딱히 마음에 드는 풀이는 아니다.

우선 문자열로 주어진 경우 숫자와 연산자로 나누어야 하는데 그 방법이 파이썬 답지 않다고 생각한다.

다음으로는 우선순위 6가지 조합을 가지고 계산을 할 때 index 처리가 조금 난잡하다.

만약 100 - 90 - 80 + 10 + 20 +30 이 주어지고 + 의 우선순위가 더 높은 경우 index 가 맨 처음 + 에 도착 하면

계산한 값인 90 을 80 자리에 넣어주고 +, 10 을 pop 한다. 그 뒤 index 를 더하지 않고 그대로 둔다.

이렇게 한게 내 생각과 똑같이 동작하는 코드이지만.. 뭔가 맘에 안든다.

내일은 다른 문제를 풀기보다 이 문제를 푼 다른 사람들 코드를 보며 공부 좀 해야겠다.

```python
from itertools import permutations as per
from copy import deepcopy


def solution(string):
	cal = ['-', '+', '*']
	priority = list(map(list, per(cal)))
	input_list = []
	answer = []

	tmp = ''
	for cur in string:
		if cur in cal:
			input_list.append(int(tmp))
			input_list.append(cur)
			tmp = ''
		else:
			tmp += cur
	input_list.append(int(tmp))

	for cur in priority:
		tmp_list = deepcopy(input_list)
		for cal in cur:
			idx = 0
			while idx < len(tmp_list):
				if tmp_list[idx] == cal:
					if tmp_list[idx] == '-':
						tmp = tmp_list[idx - 1] - tmp_list[idx + 1]
					elif tmp_list[idx] == '+':
						tmp = tmp_list[idx - 1] + tmp_list[idx + 1]
					elif tmp_list[idx] == '*':
						tmp = tmp_list[idx - 1] * tmp_list[idx + 1]
					tmp_list[idx - 1] = tmp
					tmp_list.pop(idx)
					tmp_list.pop(idx)
					continue

				idx += 1
		answer.append(abs(tmp_list[0]))
	return max(answer)
```

