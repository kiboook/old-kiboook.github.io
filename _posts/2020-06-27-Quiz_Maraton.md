---
title:  "[Programmers] 완주하지 못한 선수"
excerpt: ""

categories:
  - Quiz

tags:
---

## 완주하지 못한 선수

<a href="https://programmers.co.kr/learn/courses/30/lessons/42576" style="color:#0FA678" target="_blank">완주하지 못한 선수</a> 를 클릭하면 바로 이동한다.

처음 풀었던 방법은 그냥 바로 생각나서 짰던 코드였지만 효율성에서 오답처리 되어버렸다.

completion 을 for 문으로 돌리면서 in 구문을 사용해 participant 에 있으면 remove 하는 형식으로

코드를 짰는데 정답은 맞췄지만 효율성에서 다 틀렸다..

최대 데이터 개수가 100,000 개 인데 그럼 최악의 경우 50억 번 연산을 수행한다..

그래서 participant 에 있는 선수 이름을 key, 이 이름을 가진 선수가 몇 명있는지를 value 로 하는 dict를 사용했다.

그리고 completion 과 dict 를 비교해 value 값을 지워나갔다

그렇게 된다면 결국 마지막에 value 값이 1인 key 가 완주하지 못한 선수가 된다.

```python
def solution(participant, completion):
	answer = dict()

	for cur in participant:
		answer[cur] = 0

	for cur in participant:
		answer[cur] += 1

	for cur in completion:
		answer[cur] -= 1

	for cur in answer:
		if answer[cur] == 1:
			return cur
```

이렇게 된다면 최악의 경우 399,999 번 연산을 하게 된다 50억 번에 비해 아주아주아주 줄어들었다.

앞으로는 무작정 정답만 맞추려 하지말고 효율성도 따져봐야겠다.