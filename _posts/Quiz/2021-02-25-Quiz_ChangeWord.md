---
title:  "[Programmers] 단어 변환"
excerpt: ""

categories:
  - Quiz

tags:
---

## 단어 변환

<a href="https://programmers.co.kr/learn/courses/30/lessons/43163" style="color:#0FA678">단어 변환</a> 을 클릭하면 바로 이동한다.

현재 기준 단어와 한 글자만 다른 단어들을 전부 큐에 넣고 빼며 찾고자 하는 단어가 나올 때 까지 반복하면 된다.

만들 수 없는 경우는 words 에 단어가 없는 경우이므로 처음에 체크해 준다.

한 글자만 다른 단어를 찾기 위해 처음엔 차집합을 사용했으나 생각이 짧았다.

같은 문자로 이루어진 단어라면 에러가 발생한다.

따라서 zip 을 통해 동시에 순환하며 비교를 해주었다.

---

```python
from collections import deque


def is_another_one(pivot, check):
	diff_cnt = 0

	# 단어를 비교해 다른 부분 갯수 검색
	for a, b in zip(pivot, check):
		if a != b:
			diff_cnt += 1

	if diff_cnt != 1:
		return False
	else:
		return True


def solution(begin, target, words):
	# 변환할 수 없는 경우
	if target not in words:
		return 0

	queue = deque([])
	# 큐 초기화
	for word in words:
		if is_another_one(begin, word):
			queue.append([word, 1])

	# BFS
	while queue:
		word, work = queue.popleft()
		if word == target:
			return work
		for check in words:
			if is_another_one(word, check):
				queue.append([check, work + 1])
```

 <br>

