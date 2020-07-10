---
title:  "[Programmers] 탑"
excerpt: ""

categories:
  - Quiz

tags:

---

## 탑

<a href="https://programmers.co.kr/learn/courses/30/lessons/42588" style="color:#0FA678" target="_blank">탑</a> 을 클릭하면 바로 이동한다.

생각보다 고전했던 문제다..

엄청 간단할 줄 알고 풀었는데 예상치 못한 예외가 조금 있었다.

같은 높이의 탑이 송신한 탑 사이에 있거나.. 송신한 탑 앞에 쭈루룩 있거나..

list.index(val) 을 하면 중복 값 중 맨 앞에 있는 index 를 가져온다.

여기서 코드가 꼬이고 내 머리도 꼬여서 조금 시간이 걸렸다.

```python
from collections import deque


def solution(height):
	answer = []
	height_rev = deque(height[::-1])

	for loop in height:
		check = height_rev.popleft()
		for val in height_rev:
			if val > check:
				answer.append(len(height_rev) - height_rev.index(val))
				break
		else:
			answer.append(0)

	return answer[::-1]
```

문제가 맨 끝의 탑 부터 송신을 해 체크를 하는 방식이라서 뒤집어 놓은 큐를 만든 후 시작했다.

여기서 송신한 탑보다 높이가 높은 탑을 만난 경우 그 탑이 몇 번째 위치에 있는지만 알면 됐다!

12번째 줄이 핵심인데 val 의 index 값을 엄한 곳에서 가져오고 있었다..

처음에도 이 방법으로 접근을 했다가 안돼서 numpy 도 써보고.. lambda 도 사용할까 생각해보고..

별의별짓을 다했다.

역시 느끼는 것 이지만 머리로 생각만 하면서 풀려고 하면 절대 절대 안된다!!!

여러 예시가 돌아가는 과정을 써 놓고 보면 분명히 규칙이 보인다 명심!!