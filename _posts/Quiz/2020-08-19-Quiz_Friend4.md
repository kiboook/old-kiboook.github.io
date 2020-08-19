---
title:  "[Programmers] 프렌즈4블록"
excerpt: ""

categories:
  - Quiz

tags:
---

## 프렌즈4블록

<a href="https://programmers.co.kr/learn/courses/30/lessons/17679" style="color:#0FA678" target="_blank">프렌즈4블록</a> 을 클릭하면 바로 이동한다.

같은 캐릭터로 이루어진 블록이 2X2 모양으로 있는 경우 지워지고 그 위에 있는 블록이 떨어져 빈 공간을 채운다.

이 과정을 반복했을때 지워지는 블록의 개수를 반환하면 된다.

**A A** B B

**A A A** B

B **A A** B 같은 블록은 여러 2X2 에 포함 될 수 있기 때문에 여기서 A 는 모두 지워진다.

<br>

0 0 0 B

0 0 0 B

B 0 B B 이렇게 지울 블록이 없을 때 까지 반복하면 된다.

<br>

우선 (1, 1) 부터 시작하여 상, 좌, 좌상 부분을 비교해 같다면 대문자를 소문자로 바꾸어 지운다는 의미를 주었다.

하지만 위 처럼 겹치는 부분도 체크해야하기 때문에 비교를 할땐 대소문자 구분 없이 했다.

이렇게 처음부터 끝 까지 한 번 순회를 해 지울 블록을 정한 뒤 삭제와 블록 떨어트리기 작업을 했다.

이때는 각 열을 순회하면서 지워야 할 블록은 '-' 로 바꾼 뒤 lower 큐에, 살아남은 블록은 upper 큐에 넣었다.

그리고 다시 해당 열을 lower 큐와 upper 큐 순서로 채워 넣는다. 그렇게 되면 살아남은 블록이 지워진 블록의 자리에 채워지는 형태가 된다.

이 작업을 한 뒤 아까 저장 해 두었던 지워야 할 블록 개수를 더해준다. 이때 값의 변화가 없다면 종료한다.

---

```python
from collections import deque


def solution(m, n, board):
	answer = 0
	board = [[val for val in low] for low in board]

	while True:
		for i in range(1, m):  # 가로로 검사해 지울 곳을 찾는 반복문
			for j in range(1, n):
				if board[i - 1][j - 1].upper() == board[i][j].upper() and board[i - 1][j].upper() == board[i][j].upper() \
						and board[i][j - 1].upper() == board[i][j].upper():

					board[i - 1][j - 1] = board[i - 1][j - 1].lower()
					board[i - 1][j] = board[i - 1][j].lower()
					board[i][j - 1] = board[i][j - 1].lower()
					board[i][j] = board[i][j].lower()

		break_point = answer
		for i in range(n):  # 세로로 검사해 내려갈 칸 수를 찾는 반복문
			low_cnt = 0
			lower_box = deque()
			upper_box = deque()
			for j in range(m):
				if board[j][i].islower():
					board[j][i] = '-'
					low_cnt += 1

			for j in range(m):
				if board[j][i] == '-':
					lower_box.append(board[j][i])
				else:
					upper_box.append(board[j][i])

			idx = 0
			while lower_box:
				board[idx][i] = lower_box.popleft()
				idx += 1

			while upper_box:
				board[idx][i] = upper_box.popleft()
				idx += 1

			answer += low_cnt

		if break_point == answer:
			break

	return answer
```

