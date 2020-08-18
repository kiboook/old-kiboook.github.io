---
title:  "[Programmers] 체육복"
excerpt: ""

categories:
  - Quiz

tags:

---

## 체육복

<a href="https://programmers.co.kr/learn/courses/30/lessons/42862" style="color:#0FA678" target="_blank">체육복</a> 을 클릭하면 바로 이동한다.

아직 코드의 반 정도만 파이썬 다운 느낌이 든다 !!

comprehension 기능이 아주 강력하고 편한 걸 알게 되었다.

원래 내가 원하는 방식대로 dict 를 만들려면 for 문 안에 조건문을 써서 dict 를 만들어야 했을 것 이다.

```python
def giveAndTakeCloth(perDict, key, n):
	if key == 1:
		if perDict[key+1] == 2:
			perDict[key+1] -= 1
			perDict[key] += 1

	elif key == n:
		if perDict[key-1] == 2:
			perDict[key-1] -= 1
			perDict[key] += 1

	else:
		if perDict[key-1] == 2:
			perDict[key-1] -= 1
			perDict[key] += 1

		if perDict[key+1] == 2:
			perDict[key+1] -= 1
			perDict[key] += 1

def solution (n, lost, reserve):
	answer = 0
	perDict = {i+1:(1 if i+1 in reserve and i+1 in lost else 2 if i+1 in reserve else 0 if i+1 in lost else 1) for i in range(n)}

	for key, val in zip(perDict.keys(), perDict.values()):
		if val == 0:
			giveAndTakeCloth(perDict, key, n)

	for val in perDict.values():
		if val >= 1:
			answer += 1

	return answer
```

reserve, lost 를 가지고 맨 처음 옷을 가지고 있는 상태인 dict 를 만들고 계산을 했다.

무조건 왼쪽먼저 주는 방향으로 코딩을 했다.

그런데 그렇게 하면 맨 왼쪽 사람, 맨 오른쪽 사람의 경우 key 오류가 발생 해 따로 경우를 나누어 줬다.

분명~히 더 좋은 방법으로 줄일 수 있을 것 같은데 아직 생각이 안난다..

그리고 다른 사람들의 코드를 보니까 사람 번호 자체를 통해 옷을 주고, 받아서 lost, reverse 에서 remove 하는 방식으로 구했다.

진짜 멋있는 사람들..