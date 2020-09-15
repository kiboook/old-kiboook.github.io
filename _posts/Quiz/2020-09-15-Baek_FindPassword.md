---
title: "[BaekJoon] 백준 17219번 : 비밀번호 찾기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 17219번 : 비밀번호 찾기

<center><img width="1169" alt="Find Password" src="https://user-images.githubusercontent.com/54533309/93189685-67a41280-f77d-11ea-80a2-5e726bede945.png">
</center>
<br>

많은 데이터를 저장 한 뒤 특정 데이터를 찾고 싶다면 사전을 사용하는게 가장 빠르다.

리스트로 저장한 뒤 탐색한다면 O(N) 시간이 걸리지만 사전으로 찾게 된다면 O(1) 이 걸린다.

사이트 주소와 비밀번호가 공백으로 구분되어있기 때문에 입력을 받고 공백으로 split 을 하면 된다.

input() 을 통해 입력을 받으면 시간초과가 발생할 수 도 있다. 때문에 sys.stdin.readline() 을 통해 입력을 받자.

---

```python
import sys

N, M = map(int, sys.stdin.readline().rsplit())
info = dict()

for _ in range(N):
	URL, password = sys.stdin.readline().rsplit()
	info[URL] = password

for _ in range(M):
	find = sys.stdin.readline().rsplit()[0]
	print(info[find])
```
