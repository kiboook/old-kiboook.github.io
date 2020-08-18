---
title:  "[Programmers] 조이스틱"
excerpt: ""

categories:
  - Quiz

tags:

---

## 조이스틱

<a href="https://programmers.co.kr/learn/courses/30/lessons/42860" style="color:#0FA678" target="_blank">조이스틱</a> 을 클릭하면 바로 이동한다.

이 문제는 여러가지 테스트케이스를 해놓고 손으로 하다보면 규칙이 보인다.

1. 'A' 가 아닌 경우 조이스틱을 위로 올리거나 아래로 내려 원하는 알파벳을 만들 조작 횟수를 구한 뒤 'A' 로 변경.
2. 'A' 가 아닐 때 까지 오른쪽 이동, 왼쪽 이동 횟수를 구해 비교 후 작은 값의 위치로 이동 해 1번을 반복한다.
3. 입력 받은 name 이 모두 'A' 로 바뀌면 종료.

---

```python
from string import ascii_uppercase


def make_alpha(val):
	alpha = list(ascii_uppercase)
	value = alpha.index(val)

	if value <= 13:
		pass
	else:
		value = 26 - value

	return value


def right_move(name, idx):
	cur_idx = idx
	move_cnt = 0
	while name[cur_idx] == 'A':
		cur_idx = (cur_idx + 1) % len(name)
		move_cnt += 1

	return move_cnt


def left_move(name, idx):
	cur_idx = idx
	move_cnt = 0

	while name[cur_idx] == 'A':
		cur_idx = (cur_idx - 1)
		if cur_idx < 0:
			cur_idx = len(name) - 1
		move_cnt += 1

	return move_cnt


def solution(name):
	answer = 0
	idx = 0
	finish_check = 'A' * len(name)

	while True:
		if name[idx] != 'A':
			answer += make_alpha(name[idx])
			name = name.replace(name[idx], 'A', 1)

		if name == finish_check:
			break

		right_move_cnt = right_move(name, idx)
		left_move_cnt = left_move(name, idx)

		if right_move_cnt <= left_move_cnt:
			answer += right_move_cnt
			idx += right_move_cnt

		else:
			answer += left_move_cnt
			idx -= left_move_cnt
			if idx < 0:
				idx = len(name) - left_move_cnt

	return answer
```

알파벳을 만들 조작 횟수를 구하는 방법은 아주 간단했다.

A ~ M 까지는 위로, O ~ Z 까지는 아래로 내리면 된다.

N 은 알파벳에서 중간에 위치하기 때문에 위로 올려 만들던 아래로 올려 만들던 상관없다.

원하는 알파벳으로 바꾼 뒤 왼쪽으로 갈지 오른쪽으로 갈지를 정하면 되는데

이것도 단순히 'A' 가 아닐 때 까지 왼쪽, 오른쪽으로 이동 후 이동 횟수를 반환했다.

여기서 오른쪽으로 이동하는 경우는 index 가 name 을 초과하는 경우를 대비해 나머지로 계산을 했다.

왼쪽으로 이동하는 경우는 -1 이 되면 최대 index 로 바꾸어 줬다.

마지막으로 이동 횟수를 통해 index 를 옮긴 후 똑같이 반복하면 된다 !