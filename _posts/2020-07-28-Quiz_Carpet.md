---
title:  "[Programmers] 카펫"
excerpt: ""

categories:
  - Quiz

tags:


---

## 카펫

<a href="https://programmers.co.kr/learn/courses/30/lessons/42842" style="color:#0FA678" target="_blank">카펫</a> 을 클릭하면 바로 이동한다.

brown은 한 겹만 둘러 쌓여있기 때문에 yellow를 통해 brown 의 개수를 구하는 식만 만들면 금방 풀 수 있는 문제였다.

---

이 문제는 yellow 가 어떤 식으로 배치 되어있는가? 를 따져서 그 경우를 모두 계산 해봐야하는 문제다.

예를들어 yellow 가 27개 있었다면 27 * 1 , 12 * 2, 8 * 3, 6 * 4, 4 * 6, 3 * 8, 2 * 12, 1 * 27 의 모양으로 있을 수 있다.

물론 카펫의 가로 길이가 세로 길이보다 크거나 같다고 하였기 때문에

yellow 의 배치도 가로가 세로 길이보다 크거나 같은 경우만 따져보면 된다.

```python
def solution(brown, yellow):

	for i in reversed(range(yellow + 1)):

		if yellow % i == 0 and i >= yellow // i:
			brown_cnt = (i + yellow // i) * 2 + 4

			if brown_cnt == brown:
				return [i + 2, yellow // i + 2]
```

하지만 brown 이 여러 겹 둘러 쌓여 있는 경우는 위 코드로 해결을 하지 못한다.

여러 겹인 경우도 계산하고 싶다면 첫 번째 if 문에서 가로, 세로 길이를 2씩 늘려가며 계산하면 되지 않을까 싶다.

