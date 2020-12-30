---
title: "[BaekJoon] 백준 9663번 : N-Queen"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 9663번 : N-Queen

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103359424-416f6c00-4afb-11eb-9a13-f8a8240f315f.png">
</center>

쉬워보이는 것 같으면서 엄청 어려웠던 문제였다..

백트래킹을 이용 해 다음 퀸이 올 자리가 올 수 없는 자리면 되돌아가 다시 작업 하는 방식으로 코딩을 하였다.

<img src="https://user-images.githubusercontent.com/54533309/103359750-cce8fd00-4afb-11eb-810b-26111821fd85.png" alt="image" style="zoom:40%;" />

이런식으로 재귀를 통해 모든 가능성을 따져가면 된다..

그런데 Python3 으로 제출을 하니까 시간초과가 발생했다.

아마 지금까지 방문했던 모든 좌표와 지금 방문해야 하는 좌표가 대각선 위치인지 파악을 하느라 그런 것 같다.

PyPy3 으로 제출하면 통과는 된다.

내일 할 일은 다른 문제를 푸는게 아니라 이 코드를 Python3 으로 제출했을 경우에도 통과하게 하는 것..

---

```python
def search(i, j, visitNode, visitCol):
	global res

	if i == (n - 1):
		res += 1
		return

	for col in range(n):
		if abs(j - col) >= 2 and col not in visitCol:
			check = 0
			for cur in visitNode:
				if abs(cur[0] - (i + 1)) == abs(cur[1] - col):
					check = 1
					break

			if check == 0:
				visitNode.append([i, j])
				visitCol.append(j)
				search(i + 1, col, visitNode, visitCol)
				visitNode.pop()
				visitCol.pop()
		else:
			continue


res = 0
n = int(input())
visitNode = []
visitCol = []

for j in range(n):
	search(0, j, visitNode, visitCol)

print(res)
```

<br>