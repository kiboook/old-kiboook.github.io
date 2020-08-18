---
title:  "[Programmers] 다음 큰 숫자"
excerpt: ""

categories:
  - Quiz

tags:
---

## 다음 큰 숫자

<a href="https://programmers.co.kr/learn/courses/30/lessons/12911" style="color:#0FA678" target="_blank">다음 큰 숫자</a> 를 클릭하면 바로 이동한다.

같은 난이도 안에서도 문제마다 갭이 심한 것 같다..

엄청 어려운 Level 2 문제가 있는가 하면 Level1 수준의 문제도 더러 있다!

---

주어진 숫자보다 크고 2진수로 바꿨을 때 1의 갯수가 같은 숫자들 중 가장 작은 수를 return 하면 된다.

```python
def solution(num):
	num_one_cnt = bin(num)[2:].count('1')

	for val in range(num + 1, 1000001):
		if num_one_cnt == bin(val)[2:].count('1'):
			return val
```

오늘은 덕분에 힐링했다..