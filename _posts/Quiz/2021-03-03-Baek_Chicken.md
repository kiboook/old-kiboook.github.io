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

집 좌표와 치킨 집 좌표를 따로 저장 한 뒤 폐업 시키지 않을 치킨집의 조합을 통해 치킨거리를 구하고, 도시의 치킨거리를 구하면 된다.

치킨 집을 M 개 보다 더 폐업 시키면 도시의 치킨거리가 더 늘어나면 늘어났지 줄어들 일은 없으므로

M 개의 원소를 가지는 조합만 가지고 치킨거리를 계산해도 무방하다.

살아남은 치킨 집을 가지고 도시의 치킨거리를 구한 뒤 그것들 중 가장 작은 도시의 치킨거리를 가져오면 된다.

---

**[2021.03.03] 복습**

```python
import sys
from itertools import combinations


def initHousesAndChickens(n, field):
   houses = []
   chickens = []

   for i in range(n):
      for j in range(n):
         if field[i][j] == 1:
            houses.append([i, j])
         elif field[i][j] == 2:
            chickens.append([i, j])

   return [houses, chickens]


def calcChickenDist(house, chicken):
   return abs(house[0] - chicken[0]) + abs(house[1] - chicken[1])


def solution(n, m, field):
   houses, chickens = initHousesAndChickens(n, field)

   answer = float('inf')
   for chickens in combinations(chickens, m):
      city_chicken_dist = 0
      for house in houses:
         chicken_dist = float("inf")
         for chicken in chickens:
            chicken_dist = min(chicken_dist, calcChickenDist(house, chicken))
         city_chicken_dist += chicken_dist
      answer = min(answer, city_chicken_dist)

   return answer


if __name__ == '__main__':
   n, m = map(int, input().split())
   field = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]

   print(solution(n, m, field))
```

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