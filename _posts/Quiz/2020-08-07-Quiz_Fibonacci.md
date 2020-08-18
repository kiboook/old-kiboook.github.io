---
title:  "[Programmers] 피보나치 수"
excerpt: ""

categories:
  - Quiz

tags:
---

## 피보나치 수

<a href="https://programmers.co.kr/learn/courses/30/lessons/12945" style="color:#0FA678" target="_blank">피보나치 수</a> 를 클릭하면 바로 이동한다.

n 번째 피보나치 수를 구해 1234567 로 나눈 나머지를 구하면 된다.

피보나치 수를 구하는데 여러가지 방법이 있겠지만 나는 DP 를 사용했다.

재귀로 구하는 방식을 택했다면 이 문제에는 효율성 답은 없지만 있다면 효율성에서 틀렸을 수 도 있다.

---

```python
def solution(n):
	fibo = [0 for i in range(n + 1)]
	fibo[1] = 1
	fibo[2] = 1

	for i in range(3, n + 1):
		fibo[i] = fibo[i - 1] + fibo[i - 2]

	return fibo[n] % 1234567
```

배열의 index 는 0 부터 시작하니 첫 번째 피보나치 수, 두 번째 피보나치 수를 찾을때 헷갈릴 수 있다.

따라서 index 0 은 비워두고 index 1 부터 시작했다.