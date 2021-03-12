---
title: "[BaekJoon] 백준 12865번 : 평범한 배낭"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 12865번 : 평범한 배낭

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/103434881-c1581c00-4c4a-11eb-9636-2c559bf4d221.png">
</center>

어려운 다이나믹 프로그래밍 문제는 정말 시작조차 못 할정도로 어려운 것 같다..

분명히 DP 인건 알았는데 어떻게 시작해야 할지 몰랐다..

> <a href="https://claude-u.tistory.com/208" style="color:#0FA678">#159 백준 파이썬 [12865] 평범한 배낭 - 냅색 알고리즘</a>
>
> <a href="https://suri78.tistory.com/2" style="color:#0FA678">[백준알고리즘] 12865번: 평범한 배낭 -Python</a>

위 글들을 참고하여 풀었는데 처음엔 이해가 잘 가지 않아 표를 여러번 그려봤다.

<a href="https://nam-ki-bok.github.io/baekjoon/Baek_LCS/" style="color:#0FA678">[BaekJoon] 백준 9251번 : LCS</a> 이런 문제도 그렇고 좀 어려운 DP 문제는 표를 그려서 풀어야 잘 되는 것 같다.

| 아이템 / 무게 |  0   |  1   |  2   |  3   |  4   |  5   |  6   |  7   |
| :-----------: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
|    (0, 0)     |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |
|    (6, 13)    |  0   |  0   |  0   |  0   |  0   |  0   |  13  |  13  |
|    (4, 8)     |  0   |  0   |  0   |  0   |  8   |  8   |  13  |  13  |
|    (3, 6)     |      |      |      |      |      |      |      |      |
|    (5, 12)    |      |      |      |      |      |      |      |      |

먼저 (6, 13) 을 가방에 넣고 싶은 경우 무게가 6일때와 7일때 넣을 수 있다.

그 다음으로 (4, 8) 을 가방에 넣고 싶은 경우 무게가 4, 5 일때는 (6, 3) 을 넣을 수 없으므로 8 이 된다.

이렇게 진행을 해 가면서 이 알고리즘을 이해하기 가장 좋은 예시가 있다.

| 아이템 / 무게 |  0   |  1   |  2   |  3   |  4   |  5   |  6   |  7   |
| :-----------: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
|    (0, 0)     |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |
|    (6, 13)    |  0   |  0   |  0   |  0   |  0   |  0   |  13  |  13  |
|    (4, 8)     |  0   |  0   |  0   |  0   |  8   |  8   |  13  |  13  |
|    (3, 6)     |  0   |  0   |  0   |  6   |  8   |  8   |  13  |  14  |
|    (5, 12)    |      |      |      |      |      |      |      |      |

(3,6) 아이템을 가지고 무게가 7 인경우 14가 된다. 어떻게 해서 14를 알았을까?

바로 내가 현재 다루는 아이템을 가방에 넣었을 경우와 넣지 않았을 경우의 최대값을 넣으면 된다.

코드로 나타내자면 **dp\[i][j] = max(dp\[i - 1][j], dp\[i - 1][j - weight] + value)** 이렇게 된다.

이 코드가 처음에 이해가 안 가 엄청 고생했다.. 하지만 처음부터 손으로 따라 그리다보면 이해가 간다.

이렇게 해서 표를 채우고 dp\[n][k] 를 출력하면 된다.

**[21.03.12] 복습**

1월에 풀었던 방법을 보면서 느꼈지만 역시 변수명을 잘 짓는게 가장 최선이다..

i, j 로 만 했을때 정확히 이해가 안됐던 반면 변수명을 알아 볼 수 있도록 하니까 디버깅 과정에서도 이해가 잘 갔다.

---

**[21.03.12] 복습 코드**

```python
import sys


def solution():
    items = [(0, 0)]
    for _ in range(N):
        weight, value = map(int, sys.stdin.readline().rsplit())
        items.append((weight, value))

    for item in range(1, N + 1):
        for total_weigth in range(K + 1):
            item_weight, item_value = items[item]
            if item_weight <= total_weigth:
                dp[item][total_weigth] = max(dp[item - 1][total_weigth],
                                             dp[item - 1][total_weigth - item_weight] + item_value)
            else:
                dp[item][total_weigth] = dp[item - 1][total_weigth]

    return dp[N][K]


if __name__ == "__main__":
    N, K = map(int, input().split())
    dp = [[0 for _ in range(K + 1)] for _ in range(N + 1)]
    print(solution())
```

---

```python
import sys


n, k = map(int, input().split())
data = [list(map(int, sys.stdin.readline().rsplit())) for _ in range(n)]
data.insert(0, [0, 0])
dp = [[0] * (k + 1) for _ in range(n + 1)]

for i in range(1, n + 1):
	for j in range(1, k + 1):
		weight = data[i][0]
		value = data[i][1]

		if j < weight:
			dp[i][j] = dp[i - 1][j]
		else:
			dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - weight] + value)

print(dp[n][k])
```

<br>