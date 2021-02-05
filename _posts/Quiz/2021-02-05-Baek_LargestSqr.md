---
title: "[BaekJoon] 1915번 : 가장 큰 정사각형"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1915번 : 가장 큰 정사각형

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/107005152-a3924f80-67d2-11eb-8991-522a1798e6a9.png">
</center>



<br>

**(1, 1)** 부터 **(n-1, m-1)** 까지 이동하면서 DP 를 이용해 정사각형 개수를 세는 문제이다.

현재 위치를 기준으로 현재 위치, 왼쪽, 위쪽, 왼쪽 위 대각선의 값이 모두 0 보다 크면 정사각형이 되는 것을 알 수 있다.

정사각형이 되는 것은 알았으니 크기를 정할 차례인데 세 위치 중 가장 작은 값의 제곱근을 구한 뒤 1을 더해 제곱을 해주면 된다.

<img src="https://user-images.githubusercontent.com/54533309/107005985-d721a980-67d3-11eb-8561-b6a69b6cc719.png" alt="image" width="300" />

---

```python
def solution():
	global arr
	up = [-1, 0]
	left = [0, -1]
	left_up = [-1, -1]

	for i in range(1, n):
		for j in range(1, m):
			up_val = arr[i + up[0]][j + up[1]]
			left_val = arr[i + left[0]][j + left[1]]
			left_up_val = arr[i + left_up[0]][j + left_up[1]]
			if 0 < up_val and 0 < left_val and 0 < left_up_val and 0 < arr[i][j]:
				arr[i][j] = (int(min(up_val, left_val, left_up_val) ** 0.5) + 1) ** 2

	return max(sum(arr, []))


if __name__ == '__main__':
	n, m = map(int, input().split())
	arr = [list(map(int, input())) for _ in range(n)]

	print(solution())
```

<br>