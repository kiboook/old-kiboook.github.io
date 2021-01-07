---
title: "[BaekJoon] 백준 2096번 : 내려가기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2096번 : 내려가기

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103868992-08dc1d80-510d-11eb-8f4e-99ac825f9180.png">
</center>


<br>

다른 DP 문제와 다르게 메모리 제한을 빡빡하게 두고있다.

그래서 일반적인 DP 해결 방법을 통해 풀면 메모리 초과가 발생한다.

메모리 초과가 발생할 것을 알고는 있지만 그래도 안해보면 굉장히 찝찝하다.

```python
import sys


n = int(input())
arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]

dp = [[0] * 3 for _ in range(n - 1)]
dp.insert(0, arr[0])

smalldp = [[0] * 3 for _ in range(n - 1)]
min_dp.insert(0, arr[0])

for i in range(1, n):
   first = arr[i][0]
   second = arr[i][1]
   third = arr[i][2]

   dp[i][0] = max(dp[i - 1][0] + first, dp[i - 1][1] + first)
   dp[i][1] = max(dp[i - 1][0] + second, dp[i - 1][1] + second, dp[i - 1][2] + second)
   dp[i][2] = max(dp[i - 1][1] + third, dp[i - 1][2] + third)

   min_dp[i][0] = min(min_dp[i - 1][0] + first, min_dp[i - 1][1] + first)
   min_dp[i][1] = min(min_dp[i - 1][0] + second, min_dp[i - 1][1] + second, min_dp[i - 1][2] + second)
   min_dp[i][2] = min(min_dp[i - 1][1] + third, min_dp[i - 1][2] + third)

print(max(dp[n - 1]), min(min_dp[n - 1]))
```

처음 접근한 방식은 Max 값, Min 값을 저장하는 DP 배열을 arr 과 같은 크기로 만들었다.

배열을 같은 크기로 두 개나 더 만들었으니.. 당연히 메모리 초과가 발생한다.

<br>

```python
import sys


n = int(input())
arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]

dp = [[[0, 0]] * 3 for _ in range(n - 1)]
dp.insert(0, [[i, i] for i in arr[0]])

for i in range(1, n):
   first = arr[i][0]
   second = arr[i][1]
   third = arr[i][2]

   dp[i][0][0] = max(dp[i - 1][0][0] + first, dp[i - 1][1][0] + first)
   dp[i][1][0] = max(dp[i - 1][0][0] + second, dp[i - 1][1][0] + second, dp[i - 1][2][0] + second)
   dp[i][2][0] = max(dp[i - 1][1][0] + third, dp[i - 1][2][0] + third)

   dp[i][0][1] = min(dp[i - 1][0][1] + first, dp[i - 1][1][1] + first)
   dp[i][1][1] = min(dp[i - 1][0][1] + second, dp[i - 1][1][1] + second, dp[i - 1][2][1] + second)
   dp[i][2][1] = min(dp[i - 1][1][1] + third, dp[i - 1][2][1] + third)

print(dp)
```

그래서 DP 배열을 하나로 합쳐봤다.

결과는 이렇게 해도 메모리 초과가 발생한다.

<br>

```python
import sys

n = int(input())
arr = []
for _ in range(n):
   data = list(map(int, sys.stdin.readline().rsplit()))
   arr.append([[i, i] for i in data])

for i in range(1, n):
   first = arr[i][0][0]
   second = arr[i][1][0]
   third = arr[i][2][0]

   arr[i][0][0] = max(arr[i - 1][0][0] + first, arr[i - 1][1][0] + first)
   arr[i][1][0] = max(arr[i - 1][0][0] + second, arr[i - 1][1][0] + second, arr[i - 1][2][0] + second)
   arr[i][2][0] = max(arr[i - 1][1][0] + third, arr[i - 1][2][0] + third)

   arr[i][0][1] = min(arr[i - 1][0][1] + first, arr[i - 1][1][1] + first)
   arr[i][1][1] = min(arr[i - 1][0][1] + second, arr[i - 1][1][1] + second, arr[i - 1][2][1] + second)
   arr[i][2][1] = min(arr[i - 1][1][1] + third, arr[i - 1][2][1] + third)

print(max(arr[n - 1])[0], min(arr[n - 1])[1])
```

이번엔 처음 입력받은 배열 그 자체를 DP 배열로 사용했다.

솔직히 이 때는 통과 할 줄 알았는데 메모리 초과가 발생했다.

<br>

이 문제를 풀기위한 알고리즘에 DP 뿐 만 아니라 윈도우 슬라이딩 이라는 알고리즘이 있었다.

컴퓨터 네트워크 때 배우는 슬라이딩 윈도우 프로토콜을 생각하면 된다.

값을 저장하는 배열을 1 행으로만 만들어 윈도우 처럼 밀고 내려가면 된다.

이렇게 풀게 되면 메모리 초과가 발생하지 않는다.

---

```python
import sys

n = int(input())
arr = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]
small, large = arr[0], arr[0]

for i in range(1, n):
   large = [max(large[0], large[1]) + arr[i][0],
          max(large[0], large[1], large[2]) + arr[i][1],
          max(large[1], large[2]) + arr[i][2]]

   small = [min(small[0], small[1]) + arr[i][0],
          min(small[0], small[1], small[2]) + arr[i][1],
          min(small[1], small[2]) + arr[i][2]]

print(max(large), min(small))
```

<br>