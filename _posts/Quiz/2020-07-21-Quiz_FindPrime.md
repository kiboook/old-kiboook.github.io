---
title:  "[Programmers] 소수 찾기"
excerpt: ""

categories:
  - Quiz

tags:

---

## 소수 찾기

<a href="https://programmers.co.kr/learn/courses/30/lessons/42839" style="color:#0FA678" target="_blank">소수 찾기</a> 를 클릭하면 바로 이동한다.

이 문제는 주어진 숫자 카드를 통해 만들 수 있는 모든 숫자의 경우를 구하는게 주요 문제였다.

만약 '017' 이 주어진다면 만들 수 있는 수는 1, 7, 10, 17, 70, 71, 107, 170, 701, 710 이 있다.

permutation 과 조건을 통해 만들 수 있는 수 를 구했다.

'017' 이 입력된다면 최대로 만들 수 있는 숫자의 크기는 세 자리 수 이다.

따라서 1 자리 수, 2 자리 수, 3 자리 수 의 순열을 만들어 만들어 진 수가 자리수와 같으면 리스트에 넣어줬다.

예를들어 3 자리 수 의 순열을 만들면 ('0', '1', '7') 이 만들어 질 수 도 있다.

이때 join 을 통해 숫자 17 로 바꾼다면 2 자리 수의 숫자이기 때문에 리스트에 들어가지 않는다.

또 만약 '0170' 이 입력된다면 ('1', '0', '0') 이 두 번 만들어진다.

이렇게 중복 되는 수를 거르기 위해 마지막에 set 으로 바꾼뒤 append 해주었다.

---

```python
def solution(numbers):
	answer = 0
	_num = list(numbers)
	make_num = list()

	for idx in range(1, len(_num) + 1):
		tmp = [int(''.join(val)) for val in permutations(_num, idx) if len_num(int(''.join(val))) == idx]
		make_num.append((set(tmp))

	for cur in make_num:
		for val in cur:
			if is_prime(val):
				answer += 1
			else:
				pass

	return answer
```

숫자의 자리 수를 구하는 함수와 소수 판별 함수는 일반적인 알고리즘을 통해 구현했다.

set 을 이용해 에라토스테네스를 구현 하는 방법도 있다고 하는데..

나중에 공부 해 봐야겠다.