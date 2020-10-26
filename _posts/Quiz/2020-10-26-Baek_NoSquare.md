---
title: "[BaekJoon] 백준 1016번 : 제곱 ㄴㄴ수"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1016번 : 제곱 ㄴㄴ수

<center><img width="1149" alt="스크린샷 2020-10-26 오후 4 43 51" src="https://user-images.githubusercontent.com/54533309/97145970-6f0e0100-17aa-11eb-9fff-1e7ff9c70649.png">
</center>

<br>

골드1 문제에 수학 문제라 진짜 엄청 어려웠다..

처음엔 에라토스테네스의 체를 이용 해 소수를 구한 뒤 소수 제곱의 수를 통해 답을 구했다.

하지만 시간초과가 발생 했고 다른 사람들의 풀이를 통해 공부했다..

이 문제는 에라토스테네스의 체 원리를 응용 해 푸는 문제였다.

소수의 배수들을 모두 지워나가는 에라토스테네스의 체 처럼 max 보다 작은 제곱 수 들의 배수들을 모두 지워나가면 된다.

만약 min = 19, max = 50 이라면 4, 9, 16, 25, 36, 49 의 배수를 모두 지워주면 된다.

무조건 1 부터 구하는 문제라면 index 를 신경쓰지 않아도 되는데 min 값을 정할 수 있어 index 처리를 해주어야 한다.

예를들어 25 의 배수를 지워주고 싶다면 index = 6, 31 을 지워줘야 한다.

이때 6 을 구할 수 있어야 하는데 min 보다 큰 제곱수의 배수의 최솟값 - min 을 해주면 된다.

**cur_idx = math.ceil(min_num / square) * square - min_num**

<a href="https://nerogarret.tistory.com/32" style="color:#0FA678">[백준 알고리즘: python 3\] #1016 - 제곱 ㄴㄴ수</a>

---

```python
import math


min_num, max_num = map(int, input().split())
result = [1 for i in range(max_num - min_num + 1)]
squares = [i ** 2 for i in range(2, int(math.sqrt(max_num)) + 1)]

for square in squares:
	cur_idx = math.ceil(min_num / square) * square - min_num

	while cur_idx <= max_num - min_num:
		result[cur_idx] = 0
		cur_idx += square

print(sum(result))
```

<br>