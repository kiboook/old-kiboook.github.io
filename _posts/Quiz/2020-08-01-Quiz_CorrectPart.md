---
title:  "[Programmers] 올바른 괄호"
excerpt: ""

categories:
  - Quiz

tags:
---

## 올바른 괄호

<a href="https://programmers.co.kr/learn/courses/30/lessons/12909" style="color:#0FA678" target="_blank">올바른 괄호</a> 를 클릭하면 바로 이동한다.

<a href="https://nam-ki-bok.github.io/quiz/Quiz_ChangePart/" style="color:#0FA678" target="_blank">[Programmers] 괄호 변환</a> 의 새끼 문제라고 생각하면 된다.

괄호 변환 문제는 올바르지 않다면 올바른 괄호로 바꾸어 반환하는 문제이고

이 문제는 올바른지 아닌지만 반환하면 된다.

자료구조를 처음 배울 때 스택 부분에서 다뤘던 문제이기 때문에 아주 쉽게 풀었다 !

---

```python
def solution(s):
	stack = list()

	for cur in s:
		try:
			if cur == '(':
				stack.append(cur)
			elif cur == ')':
				stack.pop()
		except IndexError:
			return False

	return len(stack) == 0
```

```python
def solution(s):
	stack = list()
	answer = True

	for cur in s:
		try:
			if cur == '(':
				stack.append(cur)
			elif cur == ')':
				stack.pop()
		except IndexError:
			answer = False

	if len(stack) > 0:
		answer = False

	return answer
```

```python
def solution(s):
	stack = list()
	answer = True

	for cur in s:
		try:
			if cur == '(':
				stack.append(cur)
			elif cur == ')':
				stack.pop()
		except IndexError:
			return False

	if len(stack) > 0:
		answer = False

	return answer
```

다음 중 어떤 코드가 가장 나은 코드인지 고민 중 이다.

첫 번째 코드는 제일 간결하다. 하지만 파이써닉 한 코드는 함수에 return 을 한 번만 사용하도록 권유하고 있다.

또 return 문을 변수가 아닌 조건문을 넣어 반환한다.

한 눈에 봤을때 이게 더 직관적일지 아님 변수에 값을 저장하여 반환하는게 직관적일지 고민중 ..

두 번째 코드는 따라서 return 을 마지막에 한번 사용하고 변수에 값을 저장하여 반환한다.

대신 코드에 if 문이 추가 되었다.

세 번째 코드는 첫 번째 코드와 두 번째 코드를 섞어 보았다. 뭔가 정신이 없어보이긴 한다..

---

피드백을 받아보았는데 1번 스타일이 제일 나은 것 같다.

하지만 try except 문은 되도록 지양하고 사용해야한다면 try 안에는 한 가지 기능만 넣자.

try 안에 여러 명령이 있다면 어떤 명령에서 에러가 발생했는지 모른다.