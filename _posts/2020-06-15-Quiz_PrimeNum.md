---
title:  "[Programmers] 소수 만들기"
excerpt: ""

categories:
  - Quiz

tags:
---

## 스킬트리

<a href="https://programmers.co.kr/learn/courses/30/lessons/12977" style="color:#0FA678">소수 만들기</a> 를 클릭하면 바로 이동한다.

이번 문제는 예전에 코딩을 처음 배울 때 많이 풀어보던 형식의 문제였다.

3개 이상 50개 이하의 숫자 리스트가 주어졌을때 세 개 씩 뽑아 더했을때 소수가 되는 경우의 수를 구하는 문제이다.

파이썬은 수학을 다루는 함수가 아주 많아 혹시 조합 관련 함수가 있나 검색을 해 보았는데 진짜 있었다..

덕분에 아주 간단하고 쉬운 (?) 문제가 되었다.

```python
from itertools import combinations

def solution(nums):
	answer = 0
	combSum = 0
	comb = list(combinations(nums, 3))

	for cur in comb:
		for cur2 in cur:
			combSum += cur2
		for i in range(2,combSum):
			if(combSum % i == 0):
				break
		else:
			answer += 1
		combSum = 0
	return answer
```

그래도 뭔가 찝찝하고.. 이중포문 불편하고.. 그렇다..

위 코드를 보면 알겠지만 세 개씩 뽑은 수 를 더할때도 for 문을 통해 더해줬다.

그런데 list의 숫자를 전부 더해주는 함수가 있었다..

바로 sum 함수인데 만약 nums = [1, 2, 3, 4] 라는 리스트가 있으면 sum(nums) 만 해도 10을 반환해준다.

진짜 진짜 너무 편한거 아닌가 싶다..

각설하고 그래서 코드가 아주 간단해졌다.

소수를 판별하는 부분도 함수로 만들어 구분을 해줬다.

정석대로라면 에라토스테네스의 체를 만들어 소수를 판별해야겠지만..

다 까먹고 말았다.. 그래서 직관적인 소수 판별기를 만들었다..

그래서 그런지 테스트케이스에 따라 0.04ms 가 걸리는게 있는 반면 190ms 가 걸리는 케이스도 있었다 !

최종적으로 정리 한 코드는

```python
from itertools import combinations

def isPrime(num):
	for i in range(2,num):
		if(num % i == 0):
			return False
	return True

def solution(nums):
	answer = 0
	comb = list(combinations(nums, 3))

	for i in comb:
		if(isPrime(sum(i))):
			answer += 1

	return answer
```

처음 코딩했을때의 코드보다 아주아주 깔끔하고 눈에 확 들어오게 바뀌었다 !