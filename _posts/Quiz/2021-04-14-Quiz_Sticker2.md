---
title:  "[Programmers] 스티커 모으기 (2)"
excerpt: ""

categories:
  - Quiz

tags:
---

## 스티커 모으기 (2)

<a href="https://programmers.co.kr/learn/courses/30/lessons/12971" style="color:#0FA678">스티커 모으기 (2)</a> 를 클릭하면 바로 이동한다.

<center><img width="650" alt="" src="https://user-images.githubusercontent.com/54533309/114658261-7dd27b00-9d2c-11eb-8098-4fec6962c05d.png">
</center>

<br>

처음 문제를 풀 땐 규칙이 있어 보여 그 규칙으로 문제를 풀었다.

그런데 역시나 예외 케이스가 있었다..

예외 케이스를 빨리 알았더라면 수고를 덜 했을텐데 내가 생각한 풀이가 적용이 안되는 케이스를 잘 생각해야겠다..

두 가지 경우를 나누어 DP 를 수행하면 된다.

원형배열로 이루어져있기 때문에 첫 번째 스티커를 떼는 경우와 떼지 않는 경우로 나누어 계산한다.

첫 번째 스티커를 떼는 경우 마지막 스티커를 떼지 못 하기 때문에 마지막 스티커는 제외하고 계산한다.

첫 번째 스티커를 떼지 않는 경우 마지막 스티커를 뗼 수 있기 때문에 마지막 스티커도 포함하고 계산한다.

점화식은 **dp[i] = max(dp[i - 1], dp[i - 2] + sticker[i])** 가 된다.

즉 바로 왼쪽의 스티커를 뗄지, 왼쪽에서 두 번째 스티커와 현재 위치의 스티커를 뗄지 계산을 하면 된다.

DP 점화식 세우는게 가장 어려운 것 같다..

---

```python
def solution(sticker):
    N = len(sticker)
    if N == 1:
        return max(sticker)

    dp1 = [0 for _ in range(N)]
    dp1[0] = dp1[1] = sticker[0]
    for i in range(2, N - 1):
        dp1[i] = max(dp1[i - 1], dp1[i - 2] + sticker[i])

    dp2 = [0 for _ in range(N)]
    dp2[1] = sticker[1]
    for i in range(2, N):
        dp2[i] = max(dp2[i - 1], dp2[i - 2] + sticker[i])

    return max(max(dp1), max(dp2))


if __name__ == "__main__":
    sticker = [14, 6, 5, 11, 3, 9, 2, 10]
    print(solution(sticker))
```

 <br>
