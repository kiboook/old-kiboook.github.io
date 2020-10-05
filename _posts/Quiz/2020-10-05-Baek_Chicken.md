---
title: "[BaekJoon] 백준 15686번 : 치킨 배달"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 15686번 : 치킨 배달

<center><img width="1150" alt="스크린샷 2020-10-05 오후 4 27 47" src="https://user-images.githubusercontent.com/54533309/95051128-b5ca8700-0727-11eb-8e91-0a3959d17851.png">
</center>

<center><img width="1150" alt="스크린샷 2020-10-05 오후 4 28 03" src="https://user-images.githubusercontent.com/54533309/95051153-bf53ef00-0727-11eb-958f-64ff210c33df.png">
</center>

<br>

배열의 크기도 작고 치킨 집의 갯수도 13개가 최대이기 때문에 브루트포스를 사용 해 모든 경우를 따져보면 된다.

집 좌표와 치킨 집 좌표를 따로 저장 한 뒤 폐업 시키지 않을 치킨집 경우를 모두 구해 치킨거리를 구하고, 도시의 치킨거리를 구하면 된다.

예를들어 집 좌표가 **(1, 1), (2, 1), (3, 1), (4, 1), (5, 1)** 이고 치킨집 좌표가 **(1, 2), (2, 2), (3, 2), (4, 2), (5, 2)** 이고

폐업 시키지 않을 치킨집이 두 가게라고 하자.

**combination** 을 이용해 남아있는 치킨집 좌표의 경우를 모두 구하고

집 마다 치킨거리의 최솟값을 더해 도시의 치킨거리를 만든다.

이 도시의 치킨거리를 또 모든 경우를 비교 해 최솟값을 정하게 된다면 답이 된다.

반복에 반복에 반복문을 사용해서 조금 헷갈렸던 문제이다..

---

```python
import sys
from itertools import combinations


def solution(arr, N, M):
	home = []
	chicken = []

	for i in range(N):
		for j in range(N):
			if arr[i][j] == 1:
				home.append([i, j])
			elif arr[i][j] == 2:
				chicken.append([i, j])

	answer = 1_000_000
	for i in combinations(chicken, M):
		min_chicken = 0
		for j in home:
			tmp = 1_000_000
			for k in i:
				dist = abs(j[0] - k[0]) + abs(j[1] - k[1])
				if dist < tmp:
					tmp = dist
			min_chicken += tmp
		if min_chicken < answer:
			answer = min_chicken

	return answer


N, M = map(int, input().split())
arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(N)]
print(solution(arr, N, M))
```

<br>