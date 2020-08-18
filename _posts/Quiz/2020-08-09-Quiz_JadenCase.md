---
title:  "[Programmers] JadenCase 문자열 만들기"
excerpt: ""

categories:
  - Quiz

tags:
---

## JadenCase 문자열 만들기

<a href="https://programmers.co.kr/learn/courses/30/lessons/12951" style="color:#0FA678" target="_blank">JadenCase 문자열 만들기</a> 를 클릭하면 바로 이동한다.

주어진 문자열을 단어로 나누어 맨 앞 문자만 대문자로 바꾸어 주면 된다.

파이썬에는 이 기능을 담당하는 내장함수가 있다.

---

```python
def solution(s):

	box = list(s.split(' '))
	
	for idx, val in enumerate(box):
		box[idx] = val.capitalize()

	return ' '.join(box)
```

split 을 통해 단어를 분류 한 뒤 capitalize 함수를 사용하면 된다.

capitalize 함수는 문자열의 맨 앞 문자는 대문자로, 나머지 문자는 소문자로 바꾸어준다.

---

```python
def solution(s):
  
	return ' '.join([word.capitalize() for word in s.split(' ')])
```

comprehesion 을 이용해 한 번에 처리 할 수 도 있다.