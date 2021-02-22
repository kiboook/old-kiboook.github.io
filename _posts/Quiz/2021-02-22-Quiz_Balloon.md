---
title:  "[Programmers] 풍선 터트리기"
excerpt: ""

categories:
  - Quiz

tags:
---

## 풍선 터트리기

<a href="https://programmers.co.kr/learn/courses/30/lessons/68646" style="color:#0FA678">풍선 터트리기</a> 를 클릭하면 바로 이동한다.

프로그래머스에서 진행했던 월간 코드 챌린지 문제이다.

챌린지 참여 당시에는 못 풀었던 기억이 있다..

풀이 방법은 현재 자신의 위치를 기준으로 왼쪽, 오른쪽에 모두 나보다 작은 값이 있으면 안된다.

인접한 두 풍선 중에서 번호가 더 작은 풍선을 터트리는 행동은 한 번 밖에 할 수 없기 때문이다.



가장 먼저 생각나는 방법은 풍선을 탐색하면서 자신의 왼쪽, 오른쪽에 있는 최솟값을 찾아 비교하는 것이다.

하지만 풍선의 최대 개수는 1,000,000 개 이기 때문에 시간초과가 발생한다.



다음으론 최소 힙을 사용하는 방법을 생각 해보았다.

이 방법도 왼쪽에 있는 최소값은 빠르게 찾을 수 있지만 오른쪽에 있는 최소값을 다루는데 시간 초과가 발생했다.



답은 나를 기준으로 왼쪽, 오른쪽 최솟값을 미리 구해 저장 해두는 것이다.

<img src="https://user-images.githubusercontent.com/54533309/108673463-0f8ceb80-7527-11eb-9be0-5099cf3cb788.png" alt="image" width=600 />

이렇게 왼쪽, 오른쪽 최솟값을 미리 구한 뒤 둘 중 하나라도 나보다 같거나 큰 값을 가지고 있으면 된다.

---

```python
def solution(a):
	answer = 0
	left, right = a[0], a[-1]
	left_min, right_min = [0] * len(a), [0] * len(a)

	for i in range(len(a)):
		if a[i] < left:
			left = a[i]
		left_min[i] = left

	for i in reversed(range(len(a))):
		if a[i] < right:
			right = a[i]
		right_min[i] = right

	for i in range(len(a)):
		if left_min[i] >= a[i] or right_min[i] >= a[i]:
			answer += 1

	return answer
```

 <br>

