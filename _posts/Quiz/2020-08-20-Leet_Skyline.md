---
title:  "[LeetCode] Max Increase to Keep City Skyline "
excerpt: ""

categories:
  - LeetCode

tags:
---

## Max Increase to Keep City Skyline

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/skyline1.png" style="zoom:50%;" /></center>

n * n 크기의 땅에 각자 높이가 다른 빌딩이 있다. 기존의 스카이라인이 바뀌지 않게 빌딩들의 층 수를 올리려고 한다.

각 빌딩들은 최대 몇 층 까지 올릴 수 있을까 ? 이때 모든 빌딩의 추가 층 수 를 더해서 반환 하면 된다.

예시에서 보자면 왼쪽에서 봤을때 스카이라인은 <font style="color:red">[8, 7, 9, 3]</font> 이고 밑에서 봤을 때 스카이라인은 <font style="color:blue">[9, 4, 8, 7]</font> 이다.

조건을 만족하면서 빌딩 층 을 높여보면 일정한 규칙이 보인다.

바로 각 index 에서 왼쪽에서의 스카이라인, 밑에서의 스카이라인 값 중 작은 값을 넣으면 된다.

**(<font style="color:red">0</font>, <font style="color:blue">0</font>)** **(<font style="color:red">0</font>, <font style="color:blue">1</font>)** **(<font style="color:red">0</font>, <font style="color:blue">2</font>)** **(<font style="color:red">0</font>, <font style="color:blue">3</font>)**

**(<font style="color:red">1</font>, <font style="color:blue">0</font>)** **(<font style="color:red">1</font>, <font style="color:blue">1</font>)** **(<font style="color:red">1</font>, <font style="color:blue">2</font>)** **(<font style="color:red">1</font>, <font style="color:blue">3</font>)**

**(<font style="color:red">2</font>, <font style="color:blue">0</font>)** **(<font style="color:red">2</font>, <font style="color:blue">1</font>)** **(<font style="color:red">2</font>, <font style="color:blue">2</font>)** **(<font style="color:red">2</font>, <font style="color:blue">3</font>)**

**(<font style="color:red">3</font>, <font style="color:blue">0</font>)** **(<font style="color:red">3</font>, <font style="color:blue">1</font>)** **(<font style="color:red">3</font>, <font style="color:blue">2</font>)** **(<font style="color:red">3</font>, <font style="color:blue">3</font>)** 이렇게 index 를 비교하면 된다.

---

```python
class Solution:
	def maxIncreaseKeepingSkyline(self, grid: List[List[int]]) -> int:
		row = [max(val) for val in grid]
		col = [max(val) for val in zip(*grid)]

		increase = []
		for i in range(len(row)):
			tmp = []
			for j in range(len(col)):
				tmp.append(min(row[i], col[j]))
			increase.append(tmp)

		answer = 0
		for origin, up in zip(grid, increase):
			answer += sum(up) - sum(origin)

		return answer
```

행렬을 90도 돌리고 싶다면 **zip(*arr)** 을 사용하자 아주 유용하다.