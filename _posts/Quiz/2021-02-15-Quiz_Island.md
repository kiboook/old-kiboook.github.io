---
title:  "[Programmers] 섬 연결하기"
excerpt: ""

categories:
  - Quiz

tags:
---

## 섬 연결하기

<a href="https://programmers.co.kr/learn/courses/30/lessons/42861" style="color:#0FA678">섬 연결하기</a> 를 클릭하면 바로 이동한다.

최소한의 비용을 사용해 모든 그래프를 연결하는 문제이다.

최소 스패닝 트리를 만들 때 사용하는 크루스칼 알고리즘을 사용하면 된다.

사이클 형성 여부를 확인하는 방법은 다양하게 있는데 이 방법이 제일 간단하다.

만약 이렇게 해서 시간초과가 발생한다면 사전을 이용해 사이클 형성 여부를 확인해도 된다.

---

```python
def solution(n, costs):
	answer = 0
	costs.sort(key=lambda x: x[2])
	connection = [0]

	while len(connection) != n:
		for i in costs:
			start, end, cost = i
			if start in connection and end in connection:
				continue

			if start in connection or end in connection:
				connection.append(start)
				connection.append(end)
				connection = list(set(connection))
				answer += cost
				break

	return answer
```

 <br>
