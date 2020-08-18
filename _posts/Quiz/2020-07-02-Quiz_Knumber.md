---
title:  "[Programmers] K번째 수"
excerpt: ""

categories:
  - Quiz

tags:

---

## K번째 수

<a href="https://programmers.co.kr/learn/courses/30/lessons/42748" style="color:#0FA678" target="_blank">K번째 수</a> 를 클릭하면 바로 이동한다.

이 문제는 굉장히 쉬운 문제인데 코드를 줄이는 과정이 인상적이라서 글로 남긴다.

주어진 배열을 주어진 index 에 맞게 자른 후 정렬하고 특정 값을 뽑아내는 것이다.

```python
def solution(array, commands):
	answer = []
	for val in commands:
		i = val[0]
		j = val[1]
		k = val[2]
		temp = array[i-1:j]
		temp.sort()
		answer.append(temp[k-1])
	return answer

def solution(array, commands):
	answer = []
	for val in commands:
		i, j, k = val
		temp = list(sorted(array[i-1:j]))
		answer.append(temp[k-1])
	return answer

def solution(array, commands):
	answer = []
	for val in commands:
		i, j, k = val
		answer.append(list(sorted(array[i-1:j]))[k-1])
	return answer
```

맨 처음 solution 함수가 내가 풀었던 함수이다.

그런데 정말 편하고 신기했던게 두 번째 solution 을 보면 i, j, k 변수를 한번에 대입해줄 수 있다.

그리고 마지막 solution 을 보면 배열을 자르고, 정렬해서 특정 index 값을 추출해 append 해주는 과정이 모두 한번에

이루어 진다..

앞서 풀었던 문제들도 여러 줄을 더 짧게 줄일 수 있는게 많이 있었다

계속 줄일 수 있도록 연습 해야겠다.