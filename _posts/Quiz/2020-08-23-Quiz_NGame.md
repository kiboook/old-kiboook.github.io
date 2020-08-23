---
title:  "[Programmers] n진수 게임"
excerpt: ""

categories:
  - Quiz

tags:
---

## n진수 게임

<a href="https://programmers.co.kr/learn/courses/30/lessons/17687" style="color:#0FA678" target="_blank">n진수 게임</a> 을 클릭하면 바로 이동한다.

이 문제에서 요구하는 조건은 숫자를 주어진 진수에 맞게 바꿀 수 있는가 ? 반복문을 잘 활용 할 수 있는가 ? 를 물어보는 문제인 것 같다.

m 명의 사람이 있고 0 부터 게임이 끝날 때 까지 숫자를 1 씩 늘려가며 주어진 진수에 맞는 수를 한자리 씩 말하고 넘어가면 된다.

예를들어 5명의 사람이 있고 2진수로 게임을 하는 경우 0 / 1 / 1 / 0 / 1 / 1 / 1 / 0 / 0 .. 이렇게 말하면 된다.

파이썬에는 2, 8, 10, 16 진수로 변환해주는 기본 함수가 있다.

하지만 문제에선 2 이상 16 이하의 진수가 주어진다고 했으니 진수로 바꿔주는 함수를 만들었다.

바꾸고 싶은 숫자와 진수를 나머지 계산을 통해 나온 나머지를 전부 이어 붙여주면 된다.

10 ~ 15 는 A, B, C, D, E, F, G 로 바뀌게 처리를 한 뒤 마지막에 이어붙인 문자열을 뒤집어 반환한다.

또 자기 차례가 올 때 그에 맞는 숫자를 정답에 이어 붙이면 된다.

turn 을 계속 진행하면서 turn 과 p가 같아지면 답을 추가해주고 다시 p에 m 을 더한다.

---

```python
def change_num(num, n):
	output = ''
	if num == 0:
		output = '0'

	while num:
		if num % n == 10:
			output += 'A'
		elif num % n == 11:
			output += 'B'
		elif num % n == 12:
			output += 'C'
		elif num % n == 13:
			output += 'D'
		elif num % n == 14:
			output += 'E'
		elif num % n == 15:
			output += 'F'
		else:
			output += str(num % n)
		num = int(num / n)

	return output[::-1]


def solution(n, t, m, p):
	answer = ''
	start = 0
	turn = 1
	while True:
		change = change_num(start, n)
		for i in change:
			if turn == p:
				answer += i
				p += m
				if len(answer) == t:
					return answer
			turn += 1
		start += 1
```

