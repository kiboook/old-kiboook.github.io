---
title:  "[Programmers] 숫자의 표현"
excerpt: ""

categories:
  - Quiz

tags:
---

## 숫자의 표현

<a href="https://programmers.co.kr/learn/courses/30/lessons/12924" style="color:#0FA678" target="_blank">숫자의 표현</a> 을 클릭하면 바로 이동한다.

그냥 대놓고 수학 문제였다.

주어진 예시가 어떻게 구해졌을까 를 생각하면서 규칙을 찾아내면 보인다.

먼저 연속하는 자연수의 합을 통해 원하는 숫자를 만들어야 한다.

그렇기 때문에 연속하는 자연수를 더한 식을 먼저 만들어 보면 된다.

n , 2n+1, 3n+3, 4n+6, 5n+10, 6n+15 ... 가 나올 것 이다.

이때 n 은 시작하는 숫자를 의미한다. n 이 1 이라면 1, 1+2, 1+2+3, 1+2+3+4 ... 를 의미한다.

여기서 해결책을 찾을 수 있다.

<img src="https://nam-ki-bok.github.io/assets/images/programmers/ExpressNum.jpeg" style="zoom:30%;" />

이제 관건은 0, 1, 3, 6, 10, 15 의 일반항을 구하는 것이다.

이 수열은 초항이 0 이고 공차가 1 인 계차수열이다. 일반항은 다음과 같다.

<img src="https://nam-ki-bok.github.io/assets/images/programmers/ExpressNum2.png" style="zoom:60%;" />

b<sub>k</sub> 는 n 이기 때문에 시그마를 n * (n-1) / 2 로 바꿀수 있다.

---

```python
def solution(num):
	answer = 0

	for n in range(1, num + 1):
		check = n

		k = 1
		while check < num:
			check = k * n + k * (k - 1) / 2
			k += 1

		if check == num:
			answer += 1

	return answer
```

사진을 코드로 옮긴 것 이다.

효율성 테스트도 무난히 통과했다.

---

다른 사람의 풀이를 보니 주어진 숫자의 약수중 홀수의 개수를 반환해도 답이 된다.

하지만 절대 이해가 가지 않는다.. 라고 쓰고 계속 생각을 해봤는데

주어진 숫자의 약수 중 홀수의 갯수를 반환하면 답이 된다 !!

홀수는 무조건 연속된 자연수로 나타 낼 수 있다.

i

i -1 + i + i + 1 = 3i

i - 2 + i -1 + i + i + 1 + i + 2 = 5i

7i, 9i, 11i ... 그렇기 때문에 주어진 숫자의 약수 중 홀수의 갯수만 구하면 된다.