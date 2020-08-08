---
title:  "[Programmers] 행렬의 곱셈"
excerpt: ""

categories:
  - Quiz

tags:
---

## 행렬의 곱셈

<a href="https://programmers.co.kr/learn/courses/30/lessons/12949" style="color:#0FA678" target="_blank">행렬의 곱셈</a> 을 클릭하면 바로 이동한다.

수학에서 정의한 행렬의 곱셈을 구현하면 된다.

처음엔 numpy 를 이용해서 만들었는데 numpy 는 파이썬이 기본으로 제공하는 라이브러리가 아니라

코딩테스트 때 사용 할 수 없다고 한다.

```python
import numpy as np


def solution(arr1, arr2):
	result = []

	for cur in list(np.dot(arr1, arr2)):
		result.append(list(cur))

	return result
```

---

```python
def solution(arr1, arr2):
	spin_arr2 = []
	result = []

	for i in range(len(arr2[0])):
		tmp = []
		for j in range(len(arr2)):
			tmp.append(arr2[j][i])
		spin_arr2.append(tmp)

	for cur1 in arr1:
		tmp = []
		for cur2 in spin_arr2:
			tmp_val = 0
			for val1, val2 in zip(cur1, cur2):
				tmp_val += val1 * val2
			tmp.append(tmp_val)
		result.append(tmp)

	return result
```

첫번째 반복문을 통해 두 번째 배열의 행, 열 을 서로 바꾸었다.

그리고 일반적인 행렬의 곱을 구현했다.

하지만.. 다른 사람의 풀이를 보니 엄청난 코드가 있었다.

나는 zip 함수를 단순히 길이가 같은 두 개 이상의 리스트를 동시에 순회 할 때 사용하는 줄로만 알고 있었다.

그런데 arr2 를 unpacking 한 뒤 zip 으로 묶으면 행, 열이 바뀐 결과가 나온다.

```python
def solution(A, B):

	return [[sum(a * b for a, b in zip(A_row, B_col)) for B_col in zip(*B)] for A_row in A]
```

