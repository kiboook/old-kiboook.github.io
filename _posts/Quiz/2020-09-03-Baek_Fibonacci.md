---
title:  "[BaekJoon] 백준 1003번 : 피보나치 함수"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1003번 : 피보나치 함수

<center><img width="1151" alt="fibo" src="https://user-images.githubusercontent.com/54533309/92079208-7fcd7680-edfa-11ea-9d68-2ade7df6f70e.png">
</center>

<br>

일반적인 피보나치 구하기 이지만 피보나치 값을 구하는게 아니라 구하는 과정에서 0과 1이 몇 번 나오는지 구하는 문제이다.

예를들어 **f(2) = f(1) + f(0)** 인데 **f(1) = 1, f(0) = 0** 이기 때문에 출력은 **[1, 1]** 을 하면 된다.

재귀를 사용한다면 시간제한 0.25초를 통과하지 못한다. 때문에 DP 를 사용하면 된다.

각 피보나치 숫자마다 0, 1이 몇 번 나오는지 사전을 이용해 저장을 한 뒤 구하면 된다.

문제는 0.25 초를 주고 피보나치 수를 40 까지만 주었지만 DP 로 구현하면 30000 까지 해도 통과한다.

---

```python
def make_fibo():
	fibo = dict()
	fibo[0], fibo[1] = [1, 0], [0, 1]

	for i in range(2, 41):
		fibo[i] = [fibo[i - 1][0] + fibo[i - 2][0], fibo[i - 1][1] + fibo[i - 2][1]]
	return fibo


n = int(input())
arr = []
for _ in range(n):
	arr.append(int(input()))

fibo = make_fibo()
for num in arr:
	print(fibo[num][0], fibo[num][1])
```
