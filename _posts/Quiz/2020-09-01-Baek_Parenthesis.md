---
title:  "[BaekJoon] 백준 9012번 : 괄호"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 9012번 : 괄호

<center><img src="https://nam-ki-bok.github.io/assets/images/baekjoon/parenthesis.png" style="zoom:50%;" /></center>

<br>

<a href="https://nam-ki-bok.github.io/quiz/Quiz_CorrectPart/" style="color:#0FA678">[Programmers] 올바른 괄호</a> 와 똑같은 문제이다. 괄호의 종류가 한 가지이기 때문에 스택을 통해 검사를 하면 된다.

**(** 가 오는 경우는 무조건 스택에 넣고 **)** 가 오는 경우에는 스택이 비어있지 않은 경우 pop 하면 된다.

스택이 비어있는데 pop 을 시도하는 경우 올바르지 않은 괄호이다.

프로그래머스 문제를 풀 땐 try 문 안에 여러 코드가 있었는데 try 안에는 한 개의 명령만 오도록 하자.

---

```python
def check_VPS(val):
	_stack = []
	output = ''

	for i in val:
		if i == '(':
			_stack.append(i)
		elif i == ')':
			try:
				_stack.pop()
			except IndexError:
				output = 'NO'
				return print(output)

	if _stack:
		output = 'NO'
	else:
		output = 'YES'

	return print(output)


n = int(input())
parenthesis = []

for i in range(n):
	parenthesis.append(input())

for val in parenthesis:
	check_VPS(val)
```

