---
title: "[BaekJoon] 백준 2638번 : 치즈"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2638번 : 치즈

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104090007-e128b900-52b6-11eb-8faf-70aeb0610193.png">
</center>

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/104090037-1df4b000-52b7-11eb-889e-b1bfe1430b70.png">
</center>

<br>

문제 푸는 아이디어를 생각하는 능력이 정말 중요하다고 느꼈던 문제이다.

처음 문제를 접근 할 땐 치즈 마다 치즈를 시작점으로 BFS 를 수행하며 이 치즈는 녹는 치즈인지 아닌지를 판단하려고 했다.

이렇게 하니 녹는 치즈 인지 아닌지 여부를 따져주기가 굉장히 어려움은 물론 매번 모든 치즈를 돌아야하기 때문에

시간적인 부분에서 굉장히 좋지 않을 것 이라고 생각했다.

이렇게 하니 도저히 해결방법이 생각이 안나 알고리즘 적으로 도움을 받으려고 검색을 해보았다.

그랬더니.. 나의 풀이 방법과 완전히 반대의 방법으로 풀면 해결이 가능하다.

문제에서 각 모서리에는 치즈를 두지 않는다고 했기 때문에 (0, 0) 에서 BFS 를 수행한다.

탐색을 하다가 치즈를 만나게 되면 그 위치의 값을 1 올려준다.

그렇게 되면 자연스럽게 외부 공기와 두 변이 만나는 치즈는 값이 3 이상이 된다.

물론 치즈 내부 공기까지 제외시켜 줄 수 있다.

BFS 를 수행한 뒤 3 이상의 값을 가지는 곳은 녹여야 하는 치즈로 두고

1, 2 를 가지는 곳은 다시 1 로 되돌려 준다.

마지막으로 녹여야 하는 치즈가 있는 경우 다시 BFS 를 반복하면 된다.

결국 BFS 를 수행한 횟수가 치즈가 다 녹는 시간이 된다.

---

```python
import sys
from collections import deque


def findRoad(start):
	queue = deque([start])
	visit = [[0] * m for _ in range(n)]
	visit[start[0]][start[1]] = 1
	remove_cheese = 0

	dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]]
	while queue:
		cur_i, cur_j = queue.popleft()

		for val in dirs:
			visit_i = cur_i + val[0]
			visit_j = cur_j + val[1]
			if 0 <= visit_i < n and 0 <= visit_j < m:
				if data[visit_i][visit_j] == 0 and visit[visit_i][visit_j] == 0:
					visit[visit_i][visit_j] = 1
					queue.append([visit_i, visit_j])

				if data[visit_i][visit_j] > 0:
					data[visit_i][visit_j] += 1

	for i in range(n):
		for j in range(m):
			if data[i][j] >= 3:
				data[i][j] = 0
				remove_cheese += 1
			elif data[i][j] == 2:
				data[i][j] = 1

	if remove_cheese > 0:
		return True
	else:
		return False


if __name__ == '__main__':
	res = 0
	n, m = map(int, input().split())
	data = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]

	while findRoad([0, 0]):
		res += 1

	print(res)
```

<br>