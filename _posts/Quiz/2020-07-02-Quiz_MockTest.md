---
title:  "[Programmers] 모의고사"
excerpt: ""

categories:
  - Quiz

tags:

---

## 모의고사

<a href="https://programmers.co.kr/learn/courses/30/lessons/42840" style="color:#0FA678" target="_blank">모의고사</a> 를 클릭하면 바로 이동한다.

프로그래머스 에서 제공하는 코딩테스트 기출문제중 Level 1 문제는 다 풀어서 Level 2 를 풀기 전에

일단 기초 튼튼 Level 1 문제를 전부 풀고 가려고 한다.

그 중 첫 번째는 완전탐색을 사용하는 모의고사 문제.

```python
def check_answer(answers, checkList, checkCnt):

	for index,value in enumerate(answers):
		if checkList[index % len(checkList)] == value:
			checkCnt += 1
	return checkCnt

def solution(answers):
	answer = []
	answerCnt = []

	one = [1, 2, 3, 4, 5]
	two = [2, 1, 2, 3, 2, 4, 2, 5]
	three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

	oneCnt = twoCnt = threeCnt = 0
	answerCnt.append(check_answer(answers, one, oneCnt))
	answerCnt.append(check_answer(answers, two, twoCnt))
	answerCnt.append(check_answer(answers, three, threeCnt))

	for index, value in enumerate(answerCnt):
		if max(answerCnt) == value:
			answer.append(index+1)

	return answer
```

Level 2 문제를 풀기 전에 개념을 더 튼튼히 하고 코드로 바꿀 수 있을 수준으로 올린 뒤에 다른 응용문제를 풀어야 겠다.