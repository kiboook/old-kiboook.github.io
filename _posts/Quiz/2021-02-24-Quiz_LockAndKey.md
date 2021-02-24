---
title:  "[Programmers] 자물쇠와 열쇠"
excerpt: ""

categories:
  - Quiz

tags:
---

## 자물쇠와 열쇠

<a href="https://programmers.co.kr/learn/courses/30/lessons/60059" style="color:#0FA678">자물쇠와 열쇠</a> 를 클릭하면 바로 이동한다.

키를 90도로 네 번 회전 시켜 모든 경우를 확인하면 된다.

키를 90도로 회전을 했는데 일일이 키와 자물쇠를 대보는 과정이 막막했다.

처음엔 키를 잘라서 계속 확장해나가며 비교해 봐야 하는가 했는데 아니었다.

애초에 자물쇠 배열을 세 배 정도 확장하고 자물쇠를 가운데 넣어주면 키를 넣기 쉬워진다.

<img src="https://user-images.githubusercontent.com/54533309/109017907-f5a40200-76fa-11eb-9817-6733419427b8.png" alt="image" width=350 />

키를 처음부터 한 칸씩 옮겨가며 계속 열리는지 여부를 확인하면 된다.

역시 구현 문제를 풀 때마다 느끼지만 배열 인덱스를 가지고 푸는 문제는.. 정말.. 정말.. 어렵고 머리아프다..

---

```python
def is_unlock(lock_map, lock_len):
	for i in range(lock_len):
		for j in range(lock_len):
			if lock_map[i + lock_len][j + lock_len] == 0 or lock_map[i + lock_len][j + lock_len] == 2:
				return False
	return True


def push_key(start, lock_map, key):
	for i in range(len(key)):
		for j in range(len(key)):
			lock_map[start[0] + i][start[1] + j] += key[i][j]
	return


def pop_key(start, lock_map, key):
	for i in range(len(key)):
		for j in range(len(key)):
			lock_map[start[0] + i][start[1] + j] -= key[i][j]
	return


def solution(key, lock):
	lock_len = len(lock)
	lock_map = [[0 for _ in range(lock_len * 3)] for _ in range(lock_len * 3)]

	# 자물쇠 확장
	for i in range(lock_len):
		for j in range(lock_len):
			lock_map[i + lock_len][j + lock_len] = lock[i][j]

	for _ in range(4):
		# 90도 시계방향 회전
		for idx, spin in enumerate(zip(*key)):
			key[idx] = list(reversed(spin))

		for i in range(len(lock_map) - lock_len + 1):
			for j in range(len(lock_map) - lock_len + 1):
				push_key([i, j], lock_map, key)
				if is_unlock(lock_map, lock_len):
					return True
				pop_key([i, j], lock_map, key)

	return False
```

 <br>

