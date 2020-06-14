---
title:  "[Programmers] 예산"
excerpt: ""

categories:
  - Quiz

tags:
---

## Programmers 코딩테스트 연습

이제 학기도 끝나가니 예전에 목표했던 하루 한 문제 풀기를 시작해야겠다.

물론 C 를 통해 푸는게 가장 익숙하지만 코딩테스트는 더이상 C 로 풀지 않기로 결정했다.

현재 파이썬을 공부하고 있으니 파이썬을 사용하여 풀도록 하고

방학에는 C++을 공부해서 하반기에는 C++로도 코딩테스트를 풀 수 있는 실력까지 올리는게 목표..

우선 <a href="https://programmers.co.kr/learn/challenges" style="color:#0FA678">프로그래머스</a>에 있는 Summer/Winter Coding(~2018) 문제를 풀 것이다.

Level1 부터 차근차근! 원래 백준을 풀려고 했으나 백준에서 파이썬은 입출력을 받는데 있어서

문법을 조금 다르게 해서 함수만 작성하면 되는 프로그래머스에서 시작하기로 했다.

## 예산

서론이 길었는데 Summer/Winter Coding(~2018) 에서 Level1 문제를 풀어봤다.

진짜 이런 문제를 푸는게 너무 오랜만이라서 이 문제도 쪼금 고민했다.

<a href="https://programmers.co.kr/learn/courses/30/lessons/12982" style="color:#0FA678">예산</a> 을 클릭하면 바로 이동한다.

최대 예산이 있고 예산을 요청하는 각 부서가 있는데, 이때 최대 몇 개의 부서까지 지원해 줄 수 있을까?

| d               | budget | result |
| --------------- | ------ | ------ |
| [1, 3, 2, 5, 4] | 9      | 3      |
| [2, 2, 3, 3]    | 10     | 4      |

위의 예시처럼 각 부서가 1, 3, 2, 5, 4원을 요청했고 최대 예산은 9원이다.

그렇다면 최대 3개의 부서에 지원을 해 줄 수 있다.

어떻게 해결하면 될까?

정말 간단하다 ! 해당 리스트를 정렬 후, 최대 예산을 넘지 않을 때 까지 더해가며 부서 개수를 세면 된다.

```python
def solution(d, budget):
	answer = 0
	dSum = 0
	d.sort()

	for cur in d:
		dSum += cur
		if dSum <= budget:
			answer += 1
		else:
			break;
	return answer
```

프로그래머스는 문제를 풀면 다른 사람의 코드도 보여주는데 이게 아주 공부하기에 쏠쏠한 것 같다.

내가 생각하지 못한 부분도 보이고 그래서 아주 좋다.

이게 처음이자 마지막 Level1 문제이다.

이제 Level2 문제 풀어야지!