---
title: "[BaekJoon] 백준 2660번 : 회장뽑기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2660번 : 회장뽑기

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/105321444-cdf8e000-5c0a-11eb-9a4e-4371ea9d7394.png">
</center>


<br>

회원의 점수는 가장 멀리 떨어져있는 회원과의 거리가 된다.

이 점수를 가지고 회장이 될 조건을 가진 회원들을 골라내면 된다.

최대 회원 수가 50명 이기 때문에 플로이드-워셜을 통해 거리를 구하면 된다.

---

```python
def solution():

	for k in range(n):
		for i in range(n):
			for j in range(n):
				graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
				if i == j:
					graph[i][j] = 0

	score_list = [max(row) for row in graph]
	min_score = min(score_list)
	norminate = list()

	for i in range(len(score_list)):
		if score_list[i] == min_score:
			norminate.append(i + 1)

	print(min_score, len(norminate))
	print(*norminate)

	return


if __name__ == '__main__':
	n = int(input())
	graph = [[1_000_000] * n for _ in range(n)]

	while True:
		start, end = map(int, input().rsplit())
		if start == -1 and end == -1:
			break

		graph[start - 1][end - 1] = 1
		graph[end - 1][start - 1] = 1

	solution()
```

<br>