---
title:  "[Programmers] 키패드 누르기"
excerpt: ""

categories:
  - Quiz

tags:

---

## 키패드 누르기

<a href="https://programmers.co.kr/learn/courses/30/lessons/67256" style="color:#0FA678" target="_blank">키패드 누르기</a> 을 클릭하면 바로 이동한다.

앞서 풀었던 문제 중 처리하기 어려운 부분이 있으면 쉽게 치환 후 푸는 방식이 있었다.

이 문제도 그렇게 해서 푸니 꽤 쉽게 접근할 수 있었다.

주요 해결 문제는 가운데에 있는 번호를 누를때 현재 왼쪽 손가락 위치, 오른쪽 손가락 위치를 통해 거리를 계산하는 것이다.

그런데 거창한 알고리즘 보다 케이스가 얼마 없어서 숫자 차이를 이용해 거리를 구했다.

여기서 0이 예외처리가 굉장히 난감했는데 11로 바꾸어 풀면 전부 적용이 된다 !

```python
def solution(numbers, hand):
	for index, value in enumerate(numbers):
		if value == 0:
			numbers[index] = 11

	answer = ''
	curLeft = 10
	curRight = 12

	left = [1, 4, 7]
	center = [2, 5, 8, 11]
	right = [3, 6, 9]

	for pinger in numbers:
		if pinger in left:
			answer += 'L'
			curLeft = pinger

		elif pinger in right:
			answer += 'R'
			curRight = pinger

		elif pinger in center:
			leftDistance = abs(pinger - curLeft)
			rightDistance = abs(pinger - curRight)

			if leftDistance == 1 or leftDistance == 3:
				leftDistance = 1
			elif leftDistance == 2 or leftDistance == 4 or leftDistance == 6:
				leftDistance = 2
			elif leftDistance == 5 or leftDistance == 7 or leftDistance == 9:
				leftDistance = 3
			elif leftDistance == 8 or leftDistance == 10:
				leftDistance = 4

			if rightDistance == 1 or rightDistance == 3:
				rightDistance = 1
			elif rightDistance == 2 or rightDistance == 4 or rightDistance == 6:
				rightDistance = 2
			elif rightDistance == 5 or rightDistance == 7 or rightDistance == 9:
				rightDistance = 3
			elif rightDistance == 8 or rightDistance == 10:
				rightDistance = 4

			if leftDistance < rightDistance:
				answer += 'L'
				curLeft = pinger
			elif leftDistance > rightDistance:
				answer += 'R'
				curRight = pinger
			elif leftDistance == rightDistance:
				if hand == 'right':
					answer += 'R'
					curRight = pinger
				elif hand == 'left':
					answer += 'L'
					curLeft = pinger

	return answer
```

그런데 정말 의문점이 있다. 24, 25 번 째 코드를 보면 leftDistance, rightDistance 를 활용해 전부 계산을 했다.

하지만 <a href="https://github.com/Nam-Ki-Bok/Programmers" style="color:#0FA678" target="_blank">Github</a> 에 가서 Keypad.py 파일을 보자.. 밑에 주석처리된 코드를 보면 checkLeft, checkRight 를 통해 계산을 한 후

비교를 해 대입을 했다.. 달라진 건 변수 명 밖에 없고 로직은 똑같다고 생각이 드는데 주석 처리 된 코드는 정답률 65% 이다..

얼른 이유를 찾아서 밑에다 써야겠다.

