---
title:  "[Programmers] 정수 삼각형"
excerpt: ""

categories:
  - Quiz

tags:
---

## 정수 삼각형

<a href="https://programmers.co.kr/learn/courses/30/lessons/43105" style="color:#0FA678">정수 삼각형</a> 을 클릭하면 바로 이동한다.

DP 를 사용해야하는 문제는 직접 풀다보면 DP 를 사용해야겠다는 느낌이 온다.

물론 느낌은 오는데 어떻게 식을 세워야 할지 모르는 경우가 많다..

이 문제는 쉬운편이라 점화식이 금방 보인다.

내 위치의 값은 왼쪽 위, 오른쪽 위 에서 올 수 있다.

즉 왼쪽 위 오른쪽 위 두 값을 비교 해 큰 값을 가져오면 된다.

**a\[i][j] += max(a\[i - 1][j], a\[i - 1][j - 1])** 의 식을 구할 수 있다.

왼쪽 끝과 오른쪽 끝인 경우만 따로 처리하면 된다.

---

```python
def solution(triangle):
	height = len(triangle)
	for i in range(1, height):
		for j in range(i + 1):
			if j == 0:
				triangle[i][j] += triangle[i - 1][j]
			elif i == j:
				triangle[i][j] += triangle[i - 1][j - 1]
			else:
				triangle[i][j] += max(triangle[i - 1][j], 
									  triangle[i - 1][j - 1])

	return max(triangle[-1])
```

 <br>

