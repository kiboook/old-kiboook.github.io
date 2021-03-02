---
title: "[BaekJoon] 백준 3190번 : 뱀"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 3190번 : 뱀

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/106113946-5d197100-6192-11eb-9fb5-b0861c631fe9.png">
</center>


<br>

적절한 자료구조를 이용하여 구현하는 문제이다.

뱀의 위치를 저장하기 위해 deque 를 사용했다.

사과를 먹는 경우 머리만 추가해 주면 되고 사과가 아닌 경우 머리를 추가해 준 뒤 popleft 를 통해 꼬리를 떼 준다.

방향을 바꾸는 경우도 현재 진행 중인 방향에 따라 왼쪽 오른쪽이 다르기 때문에 구분해 주었다.

---

**[2021.03.02] 복습**

```python
import sys
from collections import deque


def move(field, snake):
   next_i, next_j, time, head = snake[-1]
   if head == 'U':
      next_i -= 1
   if head == 'R':
      next_j += 1
   if head == 'D':
      next_i += 1
   if head == 'L':
      next_j -= 1

   if 0 <= next_i < len(field) and 0 <= next_j < len(field) and field[next_i][next_j] <= 1:
      # 이동 한 곳에 사과가 없는 경우
      if field[next_i][next_j] != 1:
         tail = snake.popleft()
         field[tail[0]][tail[1]] = 0

      field[next_i][next_j] = 9
      snake.append([next_i, next_j, time + 1, head])
      return True
   else:
      return False


def solution(field, orders):
   # i, j, time, head
   snake = deque([[0, 0, 0, 'R']])
   field[0][0] = 9

   sec = 0
   while True:
      sec += 1
      if not move(field, snake):
         return sec

      if orders:
         if snake[-1][2] == orders[-1][0]:
            time, dire = orders.pop()
            if snake[-1][3] == 'U':
               if dire == 'D':
                  snake[-1][3] = 'R'
               elif dire == 'L':
                  snake[-1][3] = 'L'
            elif snake[-1][3] == 'R':
               if dire == 'D':
                  snake[-1][3] = 'D'
               elif dire == 'L':
                  snake[-1][3] = 'U'
            elif snake[-1][3] == 'D':
               if dire == 'D':
                  snake[-1][3] = 'L'
               elif dire == 'L':
                  snake[-1][3] = 'R'
            elif snake[-1][3] == 'L':
               if dire == 'D':
                  snake[-1][3] = 'U'
               elif dire == 'L':
                  snake[-1][3] = 'D'


if __name__ == '__main__':
   n = int(input())
   field = [[0 for _ in range(n)] for _ in range(n)]

   for _ in range(int(input())):
      i, j = map(int, sys.stdin.readline().rsplit())
      field[i - 1][j - 1] = 1

   orders = []
   for _ in range(int(input())):
      order = list(sys.stdin.readline().rsplit())
      order[0] = int(order[0])
      orders.append(order)
   orders.sort(reverse=True)

   print(solution(field, orders))
```

---

```python
from collections import deque


def solution():
	global arr
	snake_body = deque([[0, 0]])
	snake_dir = deque([[0, 0, 'right']])

	sec = 1
	while True:
		head_loc = []
		snake_head = snake_dir[-1]

		if move_list and int(move_list[0][0]) == sec - 1:  # 방향전환을 해야하는 경우
			if snake_head[2] == 'right':
				if move_list[0][1] == 'D':
					head_loc = [snake_head[0] + 1, snake_head[1], 'down']
				elif move_list[0][1] == 'L':
					head_loc = [snake_head[0] - 1, snake_head[1], 'up']
			elif snake_head[2] == 'down':
				if move_list[0][1] == 'D':
					head_loc = [snake_head[0], snake_head[1] - 1, 'left']
				elif move_list[0][1] == 'L':
					head_loc = [snake_head[0], snake_head[1] + 1, 'right']
			elif snake_head[2] == 'left':
				if move_list[0][1] == 'D':
					head_loc = [snake_head[0] - 1, snake_head[1], 'up']
				elif move_list[0][1] == 'L':
					head_loc = [snake_head[0] + 1, snake_head[1], 'down']
			elif snake_head[2] == 'up':
				if move_list[0][1] == 'D':
					head_loc = [snake_head[0], snake_head[1] + 1, 'right']
				elif move_list[0][1] == 'L':
					head_loc = [snake_head[0], snake_head[1] - 1, 'left']
			move_list.popleft()
		else:  # 직진하는 경우
			if snake_head[2] == 'up':
				head_loc = [snake_head[0] - 1, snake_head[1], 'up']
			elif snake_head[2] == 'right':
				head_loc = [snake_head[0], snake_head[1] + 1, 'right']
			elif snake_head[2] == 'down':
				head_loc = [snake_head[0] + 1, snake_head[1], 'down']
			elif snake_head[2] == 'left':
				head_loc = [snake_head[0], snake_head[1] - 1, 'left']

		if (head_loc[:2] in snake_body or
				head_loc[0] < 0 or head_loc[0] >= arr_size or
				head_loc[1] < 0 or head_loc[1] >= arr_size):
			return sec

		if head_loc[:2] in apple_loc:
			apple_loc.remove(head_loc[:2])
			snake_dir.append(head_loc)
			snake_body.append(head_loc[:2])
		else:
			snake_dir.popleft()
			snake_body.popleft()
			snake_dir.append(head_loc)
			snake_body.append(head_loc[:2])

		sec += 1


if __name__ == '__main__':
	arr_size = int(input())
	arr = [[0] * arr_size for _ in range(arr_size)]

	apple_cnt = int(input())
	apple_loc = [list(map(int, input().rsplit())) for _ in range(apple_cnt)]
	for i in range(apple_cnt):
		apple_loc[i][0] -= 1
		apple_loc[i][1] -= 1

	move_cnt = int(input())
	move_list = deque([list(input().rsplit()) for _ in range(move_cnt)])
	print(solution())
```

<br>