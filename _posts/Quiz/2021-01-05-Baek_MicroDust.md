---
title: "[BaekJoon] 백준 17144번 : 미세먼지 안녕!"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 17144번 : 미세먼지 안녕!

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103622154-a0a90280-4f79-11eb-8beb-aaa5a8949d72.png">
</center>
<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103622192-adc5f180-4f79-11eb-9c33-fc2baee3dc5a.png">
</center>

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103622236-bd453a80-4f79-11eb-9761-c2725ada33ed.png">
</center>


<br>

구현 문제는 우선 내가 생각한 대로 코딩을 해보는 게 중요한 것 같다.

1. 배열을 순회하면서 미세먼지 확산
2. 확산 된 먼지를 임시 배열에 저장
3. 배열 순회를 마치면 임시 배열과 본 배열 더하기
4. 공기청정기 작동

확산 된 먼지를 임시 배열에 저장하는 이유는 문제에서 먼지들이 동시에 확산이 되기 때문이다.

대망의 공기청정기 작동..

정말 다른 방법 없이 인덱스를 통해 자리를 바꿔줘야한다.

원래 인덱스 문제에 약한데 진짜 어려웠다.. 손으로 엄청 그려보고 써보고 해서 풀었다.

---

```python
import sys


def air_conditional():
  
	top = fresh_index[0]
	# 오른쪽 바람
	right_tmp = arr[top[0]][c - 1]
	for i in range(c - 1, 1, -1):
		arr[top[0]][i] = arr[top[0]][i - 1]
	arr[top[0]][top[1] + 1] = 0

	# 위쪽 바람
	top_tmp = arr[0][c - 1]
	for i in range(top[0] - 1):
		arr[i][c - 1] = arr[i + 1][c - 1]
	arr[top[0] - 1][c - 1] = right_tmp

	# 왼쪽 바람
	left_tmp = arr[0][0]
	for i in range(c - 1):
		arr[0][i] = arr[0][i + 1]
	arr[0][c - 2] = top_tmp

	# 아래쪽 바람
	for i in range(top[0] - 1, 1, -1):
		arr[i][0] = arr[i - 1][0]
	arr[1][0] = left_tmp

  
	bottom = fresh_index[1]
	# 오른쪽 바람
	right_tmp = arr[bottom[0]][c - 1]
	for i in range(c - 1, 1, -1):
		arr[bottom[0]][i] = arr[bottom[0]][i - 1]
	arr[bottom[0]][bottom[1] + 1] = 0

	# 아래쪽 바람
	bottom_tmp = arr[r - 1][c - 1]
	for i in range(r - 1, bottom[0] + 1, - 1):
		arr[i][c - 1] = arr[i - 1][c - 1]
	arr[bottom[0] + 1][c - 1] = right_tmp

	# 왼쪽 바람
	left_tmp = arr[r - 1][0]
	for i in range(c - 1):
		arr[r - 1][i] = arr[r - 1][i + 1]
	arr[r - 1][c - 2] = bottom_tmp

	# 위쪽 바람
	for i in range(bottom[0] + 1, r - 2):
		arr[i][0] = arr[i + 1][0]
	arr[r - 2][0] = left_tmp

	arr[top[0]][top[1]] = -1
	arr[bottom[0]][bottom[1]] = -1
	return


def sum_dust(arr, tmp_arr):
	return [[arr[i][j] + tmp_arr[i][j] for j in range(c)] for i in range(r)]


def dust():
	global arr

	tmp_arr = [[0] * c for _ in range(r)]
	visit = [[-1, 0], [0, 1], [1, 0], [0, -1]]

	for i in range(r):
		for j in range(c):
			if arr[i][j] > 0:
				# 먼지 확산
				spread_area = 0
				spread_dust = arr[i][j] // 5
				for cur in visit:
					visit_i = cur[0] + i
					visit_j = cur[1] + j
					if 0 <= visit_i < r and 0 <= visit_j < c and [visit_i, visit_j] not in fresh_index:
						tmp_arr[visit_i][visit_j] += spread_dust
						spread_area += 1

				arr[i][j] = arr[i][j] - (spread_dust * spread_area)

	arr = sum_dust(arr, tmp_arr)
	air_conditional()
	return


if __name__ == '__main__':
	res = 0
	r, c, t = map(int, input().split())
	arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(r)]

	fresh_index = []
	for i in range(r):
		for j in range(c):
			if arr[i][j] == -1:
				fresh_index.append([i, j])

	for _ in range(t):
		dust()

	print(sum(sum(arr, [])) + 2)
```

<br>