---
title:  "[Programmers] 짝지어 제거하기"
excerpt: ""

categories:
  - Quiz

tags:
---

## 짝지어 제거하기

<a href="https://programmers.co.kr/learn/courses/30/lessons/12973" style="color:#0FA678" target="_blank">짝지어 제거하기</a> 를 클릭하면 바로 이동한다.

처음 풀었던 코드는 효율성과 정확성에서 모두 시간초과가 발생했다.

모두 연속 된 문자가 나오면 제거하고 이어 붙인 다음 다시 처음부터 검사 해 제거하는 방식으로 했다.

replace 의 Big O 는 O(n) 이다. 주어진 문자열 최대 길이가 1,000,000 인데 잘못하면 시간이 엄청 오래 걸릴 수 도 있다.

```python
def solution(input_str):
	idx = 0
	while idx < len(input_str) - 1:
		if input_str[idx] == input_str[idx + 1]:
			remove_str = input_str[idx] + input_str[idx + 1]
			input_str = input_str.replace(remove_str, '')
			idx = 0
			continue
		idx += 1

	if input_str:
		return 0
	else:
		return 1
```

----

답은 스택이었다. 스택을 이용하면 O(n) 만에 문제를 풀 수 있다.

너무 내장함수에 의존하지말고 다른 방법도 생각해봐야겠다.

```python
def solution(input_str):
	_stack = []

	for val in input_str:
		if _stack:
			if _stack[-1] == val:
				_stack.pop()
			else:
				_stack.append(val)
		else:
			_stack.append(val)

	if _stack:
		return 0
	else:
		return 1
```