---
title:  "[Programmers] 2 x n 타일링"
excerpt: ""

categories:
  - Quiz

tags:
---

## 2 x n 타일링

<a href="https://programmers.co.kr/learn/courses/30/lessons/12900" style="color:#0FA678">2 x n 타일링</a> 을 클릭하면 바로 이동한다.

세 네가지 예시를 가지고 문제 답을 찾다보면 규칙이 보인다.

이 문제는 다행히 쉬워서 규칙을 금방 발견할 수 있지만 무턱대고 풀어놓고 보면 규칙을 찾기 어려울 수도 있다.

때문에 이전 계산 결과를 이용하는 방법을 잘 찾아봐야 한다.

<img src="https://user-images.githubusercontent.com/54533309/108617328-cec6a100-7458-11eb-8265-9e245dd40616.png" alt="image" width=500 />

가로 길이가 N-1 인경우 세로로 한 칸을 추가하면 N 길이를 만들 수 있다.

또 가로 길이가 N-2 인 경우 가로 타일을 두 개 추가하면 N 길이를 만들 수 있다.

<img src="https://user-images.githubusercontent.com/54533309/108617435-996e8300-7459-11eb-9b39-ccb52bc3fe5e.png" alt="image" width=280 />

이 경우는 N-1 에 포함되기 때문에 더하지 않는다.

따라서 점화식은 **dp[i] = dp[i - 1] + dp[i - 2]** 가 된다.

---

```python
def solution(n):
	dp = [0 for _ in range(60001)]
	dp[1] = 1
	dp[2] = 2

	for i in range(3, n + 1):
		dp[i] = (dp[i - 1] + dp[i - 2]) % 1_000_000_007

	return dp[n]
```

 <br>

