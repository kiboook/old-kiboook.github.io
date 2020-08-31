---
title:  "[BaekJoon] 백준 4949번 : 균형잡힌 세상"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 4949번 : 균형잡힌 세상

<center><img src="https://nam-ki-bok.github.io/assets/images/baekjoon/balance.png" style="zoom:50%;" /></center>

<br>

<a href="https://nam-ki-bok.github.io/quiz/Quiz_CorrectPart/" style="color:#0FA678">[Programmers] 올바른 괄호</a> 와 비슷한 문제인데 괄호의 종류가 두 개로 늘었다.

똑같이 스택에 넣어주며 닫히는 괄호가 나오면 스택의 top 부분과 비교하며 연산하면 된다.

소괄호가 왔을때 top 부분에도 소괄호가 있어야 하고 대괄호가 왔을때 top 부분에도 대괄호가 있어야 한다.

또 모든 연산을 마쳤을 때 스택이 비어있어야 한다.

---

```python
def check_balance(_str):
	_stack = []
	output = 'yes'

	for i in _str:
		if i == '(' or i == '[':
			_stack.append(i)

		elif i == ')':
			if not _stack:
				output = 'no'
				break
			if _stack[-1] == '(':
				_stack.pop()
			else:
				output = 'no'
				break

		elif i == ']':
			if not _stack:
				output = 'no'
				break
			if _stack[-1] == '[':
				_stack.pop()
			else:
				output = 'no'
				break

	if _stack:
		output = 'no'

	return print(output)


input_str = []
while True:
	tmp = input()
	if tmp == '.':
		break
	else:
		input_str.append(tmp)

for val in input_str:
	check_balance(val)
```

