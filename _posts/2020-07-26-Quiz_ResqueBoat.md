---
title:  "[Programmers] 구명보트"
excerpt: ""

categories:
  - Quiz

tags:


---

## 구명보트

<a href="https://programmers.co.kr/learn/courses/30/lessons/42885" style="color:#0FA678" target="_blank">구명보트</a> 를 클릭하면 바로 이동한다.

한 번에 두 명 밖에 못 타고 무게 제한이 있는 구명보트를 이용해 사람들을 구할 때, 최소한의 운행 횟수를 구하는 문제이다.

사람들의 몸무게가 주어지면 정렬 한 뒤 리스트의 맨 왼쪽, 맨 오른쪽 에서 시작해 비교하면 된다.

---

```python
def solution(people, limit):
	answer = 0
	people = sorted(people)

	left_idx = 0
	right_idx = len(people) - 1

	while left_idx <= right_idx:
		if people[left_idx] + people[right_idx] <= limit:
			left_idx += 1
			right_idx -= 1
			answer += 1
		else:
			right_idx -= 1
			answer += 1

	return answer
```

제일 가벼운 무게와 제일 무거운 무게를 더했을때 제한 무게를 넘지 않으면 왼쪽, 오른쪽 index 를 모두 이동 시킨다.

만약 제일 가벼운 무게와 제일 무거운 무게를 더했을때 제한 무게를 넘는다면 제일 무거운 사람은 혼자 탈 수 밖에 없다.

때문에 오른쪽 index 만 이동시키고 배의 운행 횟수를 올려주면 된다.