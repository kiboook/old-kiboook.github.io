---
title:  "[Programmers] n진수 게임"
excerpt: ""

categories:
  - Quiz

tags:
---

## n진수 게임

<a href="https://programmers.co.kr/learn/courses/30/lessons/17687" style="color:#0FA678" target="_blank">n진수 게임</a> 을 클릭하면 바로 이동한다.

이 문제에서 요구하는 조건은 10진수 수를 주어진 진수에 맞게 바꿀 수 있는가 ? 를 물어 봤던 것 같다.

m 명의 사람이 있고 0 부터 게임이 끝날 때 까지 숫자를 1 씩 늘려가며 주어진 진수에 맞는 수를 한자리 씩 말하고 넘어가면 된다.

예를들어 5명의 사람이 있고 2진수로 게임을 하는 경우 0 / 1 / 1 / 0 / 1 / 1 / 1 / 0 / 0 .. 이렇게 말하면 된다.

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

