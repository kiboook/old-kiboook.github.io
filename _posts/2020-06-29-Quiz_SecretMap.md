---
title:  "[Programmers] 비밀지도"
excerpt: ""

categories:
  - Quiz

tags:
---

## 비밀지도

<a href="https://programmers.co.kr/learn/courses/30/lessons/17681" style="color:#0FA678" target="_blank">비밀지도</a> 를 클릭하면 바로 이동한다.

두 배열을 2진수로 바꾼 뒤, or 계산을 통해 나온 값을 가지고

공백과 벽을 만들어 주는 문제이다.

문제 풀이 과정은 쉬운데 또 느끼지만 코드를 짜고 보니 너무 C 같은 느낌이 난다.

```python
def solution(n, arr1, arr2):
	answer = [''for i in range(n)]
	
	bitCal = []
	for i in range(len(arr1)):
		bitCal.append(bin(arr1[i]|arr2[i])[2:])
	print(bitCal)

	index = 0
	for cur in bitCal:
		inputMap = ''
		for i in range(len(cur)):
			if cur[i] == '1':
				inputMap += '#'
			elif cur[i] == '0':
				inputMap += ' '

		if len(inputMap) != n:
			extraSpace = ''
			for i in range(n-len(inputMap)):
				extraSpace += ' '
			inputMap = extraSpace + inputMap
		answer[index] = inputMap
		index += 1

	return answer
```

이렇게 풀고 다른 사람의 코드를 보니 내가 일일이 만든 기능이

파이썬에선 이미 전부 함수로 존재하는 기능이었다..

또 많은 걸 배워 간다..