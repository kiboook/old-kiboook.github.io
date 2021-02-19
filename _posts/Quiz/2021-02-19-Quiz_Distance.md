---
title:  "[Programmers] 방문 길이 2"
excerpt: ""

categories:
  - Quiz

tags:
---

## 방문 길이

<a href="https://programmers.co.kr/learn/courses/30/lessons/49994" style="color:#0FA678">방문 길이</a> 를 클릭하면 바로 이동한다.

문제를 풀면서 예전에 풀었던 문제였던 것 같은 기분이 들어 검색을 해보았더니

<a href="https://nam-ki-bok.github.io/quiz/Quiz_Coordinate/" style="color:#0FA678">[Programmers] 방문 길이</a> 작년 6월 19일에 풀었던 문제였다.

알고리즘 문제를 처음 풀기 시작할 때 였는데 그때 코드와 비교를 하니 많이 나아진 것 같다..

해결 방법은 3차원 배열을 사용한다.

각 위치마다 상, 하, 좌, 우로 가는 길의 사용 여부를 표시한다.

만약 [5, 5] 에서 [4, 5] 로 올라간다면 [5, 5] 의 올라가는 길과 [4, 5] 의 내려가는 길을 사용 했다고 체크하는 것이다.

주어진 명령대로 좌표를 탐색하면서 길을 처음 사용하는 경우에만 처음 걸어본 길의 길이에 더하면 된다.

사용 한 길을 체크하는 코드를 줄일 수 있을 것 같기도 한데.. 그건 생각해 봐야겠다.

---

```python
def solution(dirs):
	answer = 0
	road = [[[0, 0, 0, 0] for _ in range(11)] for _ in range(11)]
	move = {
		'U': [-1, 0],
		'R': [0, 1],
		'D': [1, 0],
		'L': [0, -1]
	}

	cur_i, cur_j = 5, 5
	for val in dirs:
		visit_i, visit_j = cur_i + move[val][0], cur_j + move[val][1]
		if 0 <= visit_i <= 10 and 0 <= visit_j <= 10:
			if val == 'U':
				if road[cur_i][cur_j][0] == 0 and road[visit_i][visit_j][2] == 0:
					answer += 1
					road[cur_i][cur_j][0] = 1
					road[visit_i][visit_j][2] = 1
			if val == 'R':
				if road[cur_i][cur_j][1] == 0 and road[visit_i][visit_j][3] == 0:
					answer += 1
					road[cur_i][cur_j][1] = 1
					road[visit_i][visit_j][3] = 1
			if val == 'D':
				if road[cur_i][cur_j][2] == 0 and road[visit_i][visit_j][0] == 0:
					answer += 1
					road[cur_i][cur_j][2] = 1
					road[visit_i][visit_j][0] = 1
			if val == 'L':
				if road[cur_i][cur_j][3] == 0 and road[visit_i][visit_j][1] == 0:
					answer += 1
					road[cur_i][cur_j][3] = 1
					road[visit_i][visit_j][1] = 1
			cur_i = visit_i
			cur_j = visit_j

	return answer
```

 <br>
