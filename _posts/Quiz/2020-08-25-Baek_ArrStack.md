---
title:  "[BaekJoon] 백준 1874번 : 스택 수열"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1874번 : 스택 수열

<center><img src="https://nam-ki-bok.github.io/assets/images/baekjoon/arrsort.png" style="zoom:50%;" /></center>

**arr = [4, 3, 6, 8, 7, 5, 2, 1]** 이 입력 되면 1부터 8까지 의 숫자를 오름차순으로 스택에 push, pop 을 하며

**arr** 을 만들 수 있는지 답하는 문제이다. 만약 가능하다면 push, pop 순서를, 불가능하다면 NO 를 반환한다.

내가 생각한 알고리즘은 1부터 8까지를 내림차순로 **num_stack** 에 담은 뒤 pop 을 해 배열을 만들 **make_stack** 에 넣어 주었다.

그 다음 **make_stack** 의 **top** 이 **arr** 의 첫 번째 원소와 다를 때 까지 **arr.popleft(), make_stack.pop()** 을 한다.

이 과정을 반복하다 **num_stack** 이 빈 상태가 되는경우 push, pop 순서를 반환할지 NO 를 반환할지 결정한다.

**num_stack** 이 비어있지만 **make_stack** 이 남아있는 경우 push, pop 을 이용해 **arr** 을 만들 수 없는 경우이다.

그 반대로 **make_stack** 도 비어있는 경우 push, pop 을 이용해 **arr** 을 만들 수 있다.

---

```python
from collections import deque


def make_arr(arr, num_make_stack):
	make_stack = []
	answer = []

	while True:

		if make_stack:
			while make_stack and make_stack[-1] == arr[0]:
				make_stack.pop()
				arr.popleft()
				answer.append('-')

		if not num_make_stack:
			if make_stack:
				return print('NO')
			else:
				break
		else:
			make_stack.append(num_make_stack.pop())
			answer.append('+')

	for val in answer:
		print(val)


n = int(input())
num_stack = [i for i in reversed(range(1, n + 1))]
arr = deque([int(input()) for i in range(n)])

make_arr(arr, num_stack)
```



