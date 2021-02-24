---
title:  "[Programmers] N으로 표현"
excerpt: ""

categories:
  - Quiz

tags:
---

## N으로 표현

<a href="https://programmers.co.kr/learn/courses/30/lessons/42895" style="color:#0FA678">N으로 표현</a> 을 클릭하면 바로 이동한다.

처음엔 간단해 보였는데 정말 어려웠던 문제였다.

문제 해결의 아이디어는 N 을 n 개를 사용해 만들 수 있는 수를 n 이 1일 때 부터 저장해 나가는 것이다.

N 이 5 일때 예를 들어보자면 5 를 1 개 가지고 **5[1] = 5** 를 만들 수 있다.

5 를 2 개 가지고서는 **5[2] = (5 + 5), (5 - 5), (5 * 5), (5 // 5) , 55** 를 만들 수 있다.

즉 **5[2] = 5[1] 사칙연산 5[1]** 이다.

**5[3] = 5[1] 사칙연산 5[2], 5[2] 사칙연산 5[1]** 이다.

**5[4] =  5[1] 사칙연산 5[3],  5[2] 사칙연산 5[2],  5[3] 사칙연산 5[1]** 이다.

여기서 5[1] 사칙연산 5[3], 5[3] 사칙연산 5[1] 을 해주는 이유는 덧셈, 곱셈은 순서가 바뀌어도 결과가 같지만

나눗셈, 뺄셈은 순서가 바뀌면 답도 바뀌기 때문이다.

이렇게 계산을 하다가 내가 찾고자 하는 숫자가 있으면 몇 개의 N 을 사용했는지 출력하면 된다.

<a href="https://gurumee92.tistory.com/164" style="color:#0FA678">참조 - 프로그래머스 문제 풀이 N으로 표현</a>

---

```python
def solution(N, number):
	if N == number:
		return 1

	dp = [set() for _ in range(9)]
	for i in range(1, 9):
		dp[i].add(int(str(N) * i))

	for i in range(2, 9):
		for j in range(1, i):
			for a in dp[j]:
				for b in dp[i - j]:
					dp[i].add(a + b)
					dp[i].add(a * b)
					dp[i].add(a - b)
					if b:
						dp[i].add(a // b)
		if number in dp[i]:
			return i

	return -1
```

 <br>

