---
title:  "[BaekJoon] 백준 1018번 : 체스판 다시 칠하기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1018번 : 체스판 다시 칠하기

<center><img src="https://nam-ki-bok.github.io/assets/images/baekjoon/chess1.png" style="zoom:50%;" /></center>

다시 칠해야 하는 정사각형의 최소 개수를 구해야 하기 때문에 모든 경우를 다 검사 해 봐야 한다.

**BBBBBBBBWBWBW  
BBBBBBBBBWBWB  
BBBBBBBBWBWBW  
BBBBBBBBBWBWB  
BBBBBBBBWBWBW  
BBBBBBBBBWBWB  
BBBBBBBBWBWBW  
BBBBBBBBBWBWB  
WWWWWWWWWWBWB  
WWWWWWWWWWBWB**

전체 보드가 주어진다면 **8 * 8** 로 만들 수 있는 모든 보드로 나눈 뒤 계산하기 쉽게 배열이 아닌 문자열로 합쳤다.

그리고 문자열을 8 문자 단위로 끊어 가며 검사를 했다.

이때 B 로 먼저 시작하는 경우, W 로 먼저 시작하는 경우를 구해 둘 중 작은 값을 **answer** 배열에 담는다.

**8 * 8** 로 나눌 수 있는 모든 경우를 반복하고 나서 **answer** 에 있는 최솟값을 반환하면 원하는 답을 구할 수 있다.

---

```python
def B_first(arr):
	change = 0
	idx = 0
	for i in range(8):
		for _ in range(8):
			if i % 2 == 0:
				if idx % 2 == 0 and arr[idx] == 'W':
					change += 1
				if idx % 2 != 0 and arr[idx] == 'B':
					change += 1
			else:
				if idx % 2 == 0 and arr[idx] == 'B':
					change += 1
				if idx % 2 != 0 and arr[idx] == 'W':
					change += 1
			idx += 1
	return change


def W_first(arr):
	change = 0
	idx = 0
	for i in range(8):
		for _ in range(8):
			if i % 2 == 0:
				if idx % 2 == 0 and arr[idx] == 'B':
					change += 1
				if idx % 2 != 0 and arr[idx] == 'W':
					change += 1
			else:
				if idx % 2 == 0 and arr[idx] == 'W':
					change += 1
				if idx % 2 != 0 and arr[idx] == 'B':
					change += 1
			idx += 1
	return change


answer = []
n, m = map(int, input().split())

chess = []
for i in range(n):
	tmp = input()
	chess.append(tmp)

for i in range(n - 7):
	for j in range(m - 7):
		cut_chess = []
		start_i = i
		start_j = j
		for k in range(8):
			tmp = chess[start_i][start_j:start_j + 8]
			start_i += 1
			cut_chess.append(tmp)

		_join = ''.join(cut_chess)
		answer.append(min(W_first(_join), B_first(_join)))

print(min(answer))
```

