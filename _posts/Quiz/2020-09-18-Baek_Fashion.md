---
title: "[BaekJoon] 백준 9375번 : 패션왕 신해빈"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 9375번 : 패션왕 신해빈

<center><img width="1157" alt="Fashion" src="https://user-images.githubusercontent.com/54533309/93614681-6852d800-fa0d-11ea-9c9b-8127d20e6670.png">
</center>


<br>

<a href="https://nam-ki-bok.github.io/quiz/Quiz_Camouflage/" style="color:#0FA678">[Programmers] 위장</a> 과 똑같은 문제이다. 거의 두 달만에 똑같은 문제를 풀어봤는데 풀이가 생각나 잘 풀었다..

근데 역시 이런 수학 100% 문제는 진짜 어렵다.. 두 달 전에 풀었던 코드를 보면 Counter 를 사용해 더 쉽게 풀었다.

이번에 풀 땐 Counter 생각을 하지 못 했다. 기본 모듈을 잘 사용하도록 노력..

---

```python
import sys

test = int(input())
for _ in range(test):
	cloth_num = int(input())
	cloth = dict()

	for _ in range(cloth_num):
		item, cloth_type = sys.stdin.readline().rsplit()
		try:
			cloth[cloth_type] += 1
		except KeyError:
			cloth[cloth_type] = 1

	answer = 1
	for val in cloth.values():
		answer *= val + 1

	print(answer - 1)
```

<br>