---
title:  "[Programmers] 큰 수 만들기"
excerpt: ""

categories:
  - Quiz

tags:

---

## 큰 수 만들기

<a href="https://programmers.co.kr/learn/courses/30/lessons/42883" style="color:#0FA678" target="_blank">큰 수 만들기</a> 를 클릭하면 바로 이동한다.

Level 2 문제가 아닌 것 같은 문제들이 많이 있는 것 같다...

진짜 진짜 진짜 제일 어려웠던 문제..

처음엔 정말 단순하게 접근했다가 낭패를 봤다.

주어진 숫자 - k 를 통해 만들고자 하는 수의 길이를 얻고 조합을 구해 제일 큰 수를 반환하도록 했다.

하지만 테스트케이스의 제일 큰 값은  백 만 이다 !!! 시간초과에 걸려버렸다..

정말 최적의 방법이라고 생각했는데 막혀버리니 더이상 어떻게 풀어야할지 감이 오지 않았다..

---

스택을 이용하면 해결 할 수 있다.

맨 앞자리부터 스택에 넣으면서 스택에 넣을 때 자기보다 작은 수가 스택에 있다면 전부 빼버리고 넣으면 된다.

하지만 무턱대고 빼버리고 넣는다면 내가 원하는 자리 수를 구할 수 없다.

따라서 자기보다 작은 수를 빼면서 버린 숫자의 개수를 센다.

이 때 버린 숫자의 개수가 k 개를 넘으면 더 이상 버릴 필요가 없다 !

```python
from collections import deque


def solution(num, k):
	garbage_num = 0
	check_len = len(num) - k
	num = deque(num)
	answer = list()

	answer.append(num.popleft())
	for val in num:
		while answer[-1] < val and garbage_num < k:
			answer.pop()
			garbage_num += 1
			if not answer:
				break
		answer.append(val)

	for cur in range(len(answer) - check_len):
		answer.pop()

	return ''.join(answer)
```

다 풀고 나니 마지막 케이스가 실패였다..

이렇게 다 맞고 한 두개의 케이스가 틀리는 경우 항상 극한의 값이나 특수한 값을 넣어봐야한다 !!

이 문제의 경우 백 만자리의 숫자라고 해서 오류가 있을 경우는 드물고 숫자가 특이한 경우 오류가 있을 확률이 높다 !!

그래서 숫자에 7777, k = 2 를 대입 해 보니 77 이 return 되야하는데 7777 이 그대로 return 되었다.

생각을 해보니 연속된 숫자가 계속 오는 경우 while 문으로 들어가지 못하고 계속 append 만 한다.

그래서 내가 원하는 길이보다 긴 경우 초과하는 길이만큼 수를 버렸다 !