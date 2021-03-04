---
title:  "[Programmers] 괄호 변환"
excerpt: ""

categories:
  - Quiz

tags:


---

## 괄호 변환

<a href="https://programmers.co.kr/learn/courses/30/lessons/60058" style="color:#0FA678" target="_blank">괄호 변환</a> 을 클릭하면 바로 이동한다.

이 문제는 '(', ')' 로만 이루어진 문자열이 주어졌을 때 짝에 맞게 올바른 괄호 문자열을 만들어 반환하는 문제이다.

예를들어 ')(' 가 주어진다면 '()' 로 반환해야 한다.

그런데 특이하게 알고리즘을 전부 알려준다.

우리는 보고 코드로 옮기기만 하면 된다.

```python
'''
1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
  3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
  4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
  4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
  4-3. ')'를 다시 붙입니다.
  4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
  4-5. 생성된 문자열을 반환합니다.
'''
```

---

**[2021.03.04] 복습**

```python
def is_collect(u):
   stack = []
   for i in u:
      if i == '(':
         stack.append('(')
      if i == ')':
         try:
            stack.pop()
         except IndexError:
            return False
   if stack:
      return False
   return True


def split_U_V(p):
   u, v = '', ''

   left, right = 0, 0
   for i in p:
      if i == '(':
         left += 1
      elif i == ')':
         right += 1

      if left == right:
         return p[:left * 2], p[left * 2:]


def solution(p):
   if not p:
      return p

   u, v = split_U_V(p)
   if is_collect(u):
      return u + solution(v)
   else:
      empty = '(' + solution(v) + ')'
      u = u[1:-1]
      u = u.replace('(', '0')
      u = u.replace(')', '1')
      u = u.replace('0', ')')
      u = u.replace('1', '(')

   return empty + u


if __name__ == '__main__':
   p = input()
   print(solution(p))
```

---

```python
def make_u_v(p):  # 문자열 w를 두 '균형잡힌 괄호 문자열' u, v로 분리하는 함수
	left_cnt = 0
	right_cnt = 0

	for val in p:
		if val == '(':
			left_cnt += 1
		elif val == ')':
			right_cnt += 1

		if left_cnt == right_cnt:
			u = p[:left_cnt + right_cnt]
			v = p[left_cnt + right_cnt:len(p)]
			break

	return u, v


def is_collect(p):  # 올바른 괄호 문자열인지 여부를 반환하는 함수
	_stack = list()

	for val in p:
		try:
			if val == '(':
				_stack.append(val)
			elif val == ')':
				_stack.pop()
		except IndexError:
			return False

	if _stack:
		result = False
    
	else:
		result = True

	return result


def solution(p):
	if not p:
		return p

	u, v = make_u_v(p)
	if is_collect(u):
		return u + solution(v)
  
	else:
		tmp = '(' + solution(v) + ')'

		u = u[1:-1]
		u = u.replace('(', '0')
		u = u.replace(')', '1')
		u = u.replace('0', ')')
		u = u.replace('1', '(')

		return tmp + u
```

올바른 괄호인지 판단 해주는 함수, 문자열 w 를 u, v 로 나누어주는 함수, 메인 재귀함수 총 세 가지 함수를 만들었다.

- 올바른 괄호인지 판단해주는 함수는 열림 괄호를 스택에 넣고 닫힘 괄호가 나올 때 마다 pop 을 해주었다.

  이때, 닫힘 괄호가 나왔는데 스택이 비어있거나 모든 괄호를 반복 후 스택이 비어있지않으면 올바르지 않은 괄호이다.

- 문자열 w 를 u, v 로 나누어주는 함수는 열림, 닫힘 괄호 개수를 세주면서 개수가 같은 경우 괄호 개수만큼 잘라 u를 만들고

  나머지를 v 로 만들어 준다. u 는 더이상 균형잡힌 괄호로 나눌 수 없기 때문에 처음 괄호 개수가 같아질때  자르고 멈춘다.

- 메인 재귀함수는 정말 주어진 알고리즘 대로 짜면 된다. 문자열이 비어있다면 비어있는 문자열을 반환하고

  u, v 를 만들어 u 가 올바른 괄호라면 v 를 다시 반복하고, 그 결과를 u 와 붙이고..

  u 가 올바르지 않은 괄호라면 주어진 방법을 그대로 하면 된다.

  하지만 여기서 착각했던 부분이 있는데 바로

  **4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.**

  이 부분이다. 처음에는 괄호 방향을 뒤집어서 뒤에 붙인다는 의미가 u[::-1] 로 해서 붙이라는 의미인 줄 알았다.

  하지만 문자열을 뒤집는게 아니라 괄호 방향을 뒤집는 것 이었다.

  그래서 replace 를 통해 열림, 닫힘을 반대로 바꾸어줬다.