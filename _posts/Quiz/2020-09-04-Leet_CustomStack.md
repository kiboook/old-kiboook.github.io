---
title:  "[LeetCode] 1381. Design a Stack With Increment Operation"
excerpt: ""

categories:
  - LeetCode

tags:
---

## 1381. Design a Stack With Increment Operation

<center><img width="968" alt="스크린샷 2020-09-04 오후 11 52 52" src="https://user-images.githubusercontent.com/54533309/92252836-bfcf4f00-ef09-11ea-951f-ebf529da6236.png"></center>

객체를 이용해 스택을 구현하는 문제.

나머지는 스택 기능과 똑같고 increment 기능만 구현 하면 된다.

k 가 maxsize 보다 크게 주어질 수 도 있고 k 가 현재 스택에 있는 데이터 보다 더 많이 줄 수도 있어 예외처리를 해주어야 한다.

---

```python
class CustomStack:

	def __init__(self, maxSize: int):
		self.my_maxsize = maxSize
		self.my_stack = []

	def push(self, x: int) -> None:
		if len(self.my_stack) < self.my_maxsize:
			self.my_stack.append(x)

	def pop(self) -> int:
		if self.my_stack:
			return self.my_stack.pop()
		else:
			return -1

	def increment(self, k: int, val: int) -> None:
		idx = 0
		while idx < min(k, self.my_maxsize):
			try:
				self.my_stack[idx] += val
			except IndexError:
				break
			idx += 1
```

