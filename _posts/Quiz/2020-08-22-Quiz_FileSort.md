---
title:  "[Programmers] 파일명 정렬"
excerpt: ""

categories:
  - Quiz

tags:
---

## 파일명 정렬

<a href="https://programmers.co.kr/learn/courses/30/lessons/17686" style="color:#0FA678" target="_blank">파일명 정렬</a> 을 클릭하면 바로 이동한다.

파일명이 주어지면 Head, Number, Tail 로 나누고 Head, Number 을 기준으로 정렬을 하는 문제이다.

예전에 <a href="https://nam-ki-bok.github.io/quiz/Quiz_FomulaMax2/" style="color:#0FA678">[Programmers] 수식 최대화 코드 분석</a> 문제를 풀면서 정규식을 조금 공부해뒀는데 도움이 됐다.

물론 다른 사람 풀이를 보니 정규식을 조금 더 이용하면 깔끔하게 분리 할 수 도 있었다..

처음엔 **re.split('([^0-9])', file)** 로 했는데 Tail 부분에 숫자가 또 나올 수 있다는 부분을 간과했다.

때문에 **match** 를 이용해 Head, Number, Tail 을 분리 해 주었다. 분리를 다 했다면 sorted 와 key 를 이용 해 정렬을 하면 된다.

key 를 두 개 이상으로도 할 수 있다는 사실을 오늘 알았다. 여러 개의 키 들을 괄호로 묶어주면 된다.

Head, Number 을 키로 묶어 두었을때, Head 부분이 같다면 Number 을 기준으로 정렬을 한다.

---

```python
import re


def solution(files):
	head = []
	num = []
	tail = []
	
	for cur in files:
		head_input = num_input = tail_input = ''
		for val in cur:
			if len(head_input) > 0 and len(num_input) > 0:
				if re.match('[^0-9]', val):
					break

			if re.match('[^0-9]', val):
				head_input += val
			else:
				num_input += val

		head.append(head_input)
		num.append(num_input)
		tail.append(cur[len(head_input) + len(num_input):len(cur)])

	_split = list(zip(head, num, tail))
	box = sorted(_split, key=lambda file: (file[0].upper(), int(file[1])))
	answer = []
	for val in box:
		answer.append(''.join(val))

	return answer
```

