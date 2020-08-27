---
title:  "[BaekJoon] 백준 1920번 : 수 찾기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1920번 : 수 찾기

<center><img src="https://nam-ki-bok.github.io/assets/images/baekjoon/findnum.png" style="zoom:50%;" /></center>

정수의 범위가 -2^31 에서 2^31 이기 때문에 효율적인 알고리즘을 짜야한다.

숫자를 하나 씩 뽑아서 **if  num in A** 로 한다면 바로 시간초과에 걸린다. 이럴땐 **이진 탐색** 알고리즘을 사용하면 된다.

**이진 탐색**은 정렬 된 배열에서 동작하기 때문에 A 를 정렬 한 뒤 시작한다.

**start, mid, end** 를 정한 뒤 **mid** 값 보다 찾고자 하는 값이 작다면 **end** 를 **mid - 1** 로 바꾸어 똑같이 탐색한다.

만약 찾고자 하는 값이 **mid** 보다 크다면 **start** 를 **mid + 1** 로 바꾸어 탐색한다.

---

```python
N = input()
a = sorted(list(map(int, input().split())))

M = input()
b = list(map(int, input().split()))


def find_num(a, start, end, num):

	while start <= end:
		mid = (start + end) // 2

		if a[mid] == num:
			print(1)
			break
		elif a[mid] < num:
			start = mid + 1
		elif a[mid] > num:
			end = mid - 1
	else:
		print(0)


for num in b:
	find_num(a, 0, len(a) - 1, num)
```

