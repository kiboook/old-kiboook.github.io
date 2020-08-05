---
title:  "[Programmers] 폰켓몬"
excerpt: ""

categories:
  - Quiz

tags:
---

## 폰켓몬

<a href="https://programmers.co.kr/learn/courses/30/lessons/1845" style="color:#0FA678" target="_blank">폰켓몬</a> 을 클릭하면 바로 이동한다.

생각보다 쉽게 풀려 당황했던 문제..

문제를 읽다보면 뭔가 복잡해보이고.. 길어보이고.. 특이한 예외 케이스가 있을 것 같고 그런다

하지만 N/2 마리를 가져 갈 수 있는데 최대로 다양한 종류를 가져간다 라고 생각하고 일단 풀어보니 정답이다!

주어진 리스트의 길이를 반으로 나눈 값 과 set 으로 바뀐 뒤 길이를 비교 해 더 작은 값을 반환하면 된다.

---

```python
def solution(nums):
	half_len = len(nums) // 2
	set_len = len(set(nums))

	if half_len < set_len:
		answer = half_len
	else:
		answer = set_len

	return answer


def solution(nums):
	return len(nums) // 2 if len(nums) // 2 < len(set(nums)) else len(set(nums))


def solution(nums):
	return min(len(nums) // 2, len(set(nums)))
```

처음 풀었던 코드는 첫 번째 솔루션이다.

두 번째 솔루션은 파이썬에도 삼항연산자가 있다는 것을 알게되어 사용해보았는데 가독성이 떨어지는 것 같다.

세 번째 솔루션이 정석이라고 할 수 있을 것 같다. 딱 보면 코드의 의미가 바로 와닿는다.

더 작은 값을 반환해야 한다는 생각으로 다른 고민도 해보지 않고 if 문으로 비교를 했다.

다음 부턴 더 가독성이 좋고 간결한 코드로 바꿀 순 없는지 한 번 더 생각해봐야겠다.