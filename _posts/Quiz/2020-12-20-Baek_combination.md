---
title: "[BaekJoon] 백준 2407번 : 조합"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 백준 2407번 : 조합

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/102714617-37878500-4313-11eb-926a-14ab68e957cc.png">
</center>


<br>

**nCm = n! / (m! * (n-m)!)** 을 구하면 되는 문제이다..

팩토리얼을 계속 구하면 시간초과가 걸리기 때문에 다이나믹 프로그래밍을 이용하여 먼저 팩토리얼 배열을 만들어 주자..

그리고 100! 은 수가 굉장히 크기 때문에 다른언어라면 오버플로우가 생기지 않게 큰 자료형을 사용해야한다.

하지만 파이썬은 int 형 최대값을 넘어가면 자동으로 변환을 해주기 때문에 그냥 사용하면 된다.

또 주의할 부분은 **int(fac[n] / (fac[m] * fac[n - m]))** 이런 식으로 구하게 되면 오류가 발생한다.

/ 로 나누게 되면 소수로 변환이 될때 오차가 생긴다고 한다..

예를 들어 n = 100, m = 50 인 경우 답은 100891344545564193334812497256 이지만

출력은 100891344545564202071714955264 이 나와 틀리게 된다.

때문에 int 형으로 계산하고 뒤에 소수만 떼주는 // 연산자를 사용하도록 하자.

---

```python
import sys


fac = [1, 1, 2]
n, m = map(int, sys.stdin.readline().rsplit())

for i in range(3, n + 1):
	fac.append(fac[i - 1] * i)

print(fac[n] // (fac[m] * fac[n - m]))
```

---

```python
import sys
from math import factorial


n, m = map(int, sys.stdin.readline().rsplit())
print(factorial(n) / (factorial(n) * factorial(n - m)))
```

math 모듈을 사용하면 더 간단히 풀 수 있다.

<br>

