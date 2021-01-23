---
title: "[BaekJoon] 백준 2641번 : 다각형그리기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2641번 : 다각형그리기

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/105572649-cf0d4700-5d9b-11eb-9be8-ea33c33cab31.png">
</center>

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/105572654-d6cceb80-5d9b-11eb-9b88-d28fe5132cf8.png">
</center>


<br>

표본 모양수열을 그릴 수 있는 모든 경우를 구하고 주어지는 모양수열이 같은 다각형인지 판별하면 된다.

예시를 가지고 설명을 해 보자면 이 표본 수열을 그릴 수 있는 방법은 총 20가지 이다.

정방향으로 그리는 경우 10가지, 역방향으로 그리는 경우 10가지가 있다.

주어진 표본 모양수열을 그리는 방법을 가지고 앞에서 부터 하나 씩 잘라 뒤에 붙여주면 된다.

역방향도 마찬가지로 주어진 표본 모양수열을 역방향으로 바꾼뒤 똑같이 반복하면 된다.

테스트 데이터 최대 갯수가 작아 별 차이는 없겠지만 리스트에 넣지 않고 사전에 넣어 검색 속도를 높였다.

---

```python
import sys


if __name__ == '__main__':
	n = int(input())
	standard = ''.join(sys.stdin.readline().rsplit())

	m = int(input())
	check_list = list()
	for _ in range(m):
		check_list.append(''.join(sys.stdin.readline().rsplit()))

	standard_list = dict()
	for i in range(len(standard)):
		standard_list[standard[i:] + standard[:i]] = 1

	reverse = list(reversed(standard))
	for i in range(n):
		if reverse[i] == '1':
			reverse[i] = '3'
		elif reverse[i] == '2':
			reverse[i] = '4'
		elif reverse[i] == '3':
			reverse[i] = '1'
		elif reverse[i] == '4':
			reverse[i] = '2'

	reverse_standard = ''.join(reverse)
	for i in range(len(reverse_standard)):
		standard_list[reverse_standard[i:] + reverse_standard[:i]] = 1

	answer = list()
	for check in check_list:
		if check in standard_list:
			answer.append(' '.join(check))

	print(len(answer))
	for val in answer:
		print(val)
```

<br>