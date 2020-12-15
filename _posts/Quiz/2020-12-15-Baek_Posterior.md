---
title: "[BaekJoon] 백준 1918번 : 후위 표기식"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1918번 : 후위 표기식

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/102189553-28ab6780-3efa-11eb-873c-1f6b89e015fb.png">
</center>

<br>

학교 공부하느라 백준 문제를 안푼지 한 달이 넘었었다.. 마지막 풀었던게 11월 1일이었는데 이제 다시 시작하려고 한다.

겨우 한 달 쉬었다고 까먹은 부분이 너무 많았다.. 낮은 티어 문제부터 다시 풀어야 하나 생각 중..

이 문제는 중위수식을 후위수식으로 바꾸는 문제이다. 학교에서 C 실습문제로 풀었던 기억이 있는 문제다.

스택을 사용해서 풀어주면 되는데, 연산자가 왔을 경우 스택에서 자신보다 우선순위가 높거나 같은 연산자만 빼서 붙이면 된다.

예를들어 곱셈이나 나눗셈이 오는 경우 스택의 탑이 더하기나 빼기가 나올 때 까지 pop 한 뒤 답에 붙여주면 된다.

덧셈이나 뺄셈이 오는 경우에는 스택이 비거나 **(** 여는 괄호가 올때 까지 pop 한 뒤 답에 붙여주면 된다.

여는 괄호가 나올때는 스택에 넣어주기만 하면 되고 닫는 괄호가 나오는 경우 스택의 탑이 여는 괄호가 나올 때 까지 작업 하면 된다.

**참조** <a href="https://jaimemin.tistory.com/828" style="color:#0FA678">백준 1918번 후위표기식</a>

---

```python
my_str = input()
answer = ""
stack = []

for val in my_str:
	if 'A' <= val <= 'Z':
		answer += val
	elif val == '(':
		stack.append(val)
	elif val == ')':
		while stack and stack[-1] != '(':
			answer += stack.pop()
		stack.pop()
	elif val == '*' or val == '/':
		while stack and (stack[-1] == '*' or stack[-1] == '/'):
			answer += stack.pop()
		stack.append(val)
	elif val == '+' or val == '-':
		while stack and stack[-1] != '(':
			answer += stack.pop()
		stack.append(val)

while stack:
	answer += stack.pop()

print(answer)
```

<br>