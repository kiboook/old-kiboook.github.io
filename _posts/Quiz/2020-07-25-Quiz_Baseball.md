---
title:  "[Programmers] 숫자야구"
excerpt: ""

categories:
  - Quiz

tags:


---

## 숫자야구

<a href="https://programmers.co.kr/learn/courses/30/lessons/42841" style="color:#0FA678" target="_blank">숫자야구</a> 를 클릭하면 바로 이동한다.

질문이 1개에서 100개 사이로 주어지면 이때 답이 될 수 있는 모든 숫자의 개수를 반환하면 된다.

[ [123, 1, 1], [356, 1, 0], [327, 2, 0], [489, 0, 1] ] 이 주어진다면 가능한 답은 324, 328 이 된다.

해결방법은 123부터 987까지 반복하면서 모든 질문의 Strike, Ball 과 답이 같은지 비교하면 된다.

324의 경우 123과 비교했을 때 1S 1B, 356과 비교했을 때 2S 0B, 327과 비교했을 때 2S 0B, 489와 비교했을 때 0S 1B 가 된다.

문제 조건에서 1 ~ 9 까지의 중복되지 않는 숫자가 오기 때문에 0이 있거나 중복이 되는 경우는 체크를 하지 않는다.

---

```python
def solution(baseball):
	answer = 0

	for check_num in range(123, 988):
		check_num = str(check_num)
		if '0' in check_num or len(set(list(check_num))) < 3:  # 숫자에 0이 있거나 중복 된 숫자가 있으면 넘어간다
			continue

		answer_check = 0
		for cur in baseball:
			strike = 0
			ball = 0
			answer_num = str(cur[0])
			for val in check_num:
				try:
					if check_num.index(val) == answer_num.index(val):
						strike += 1
					else:
						ball += 1
				except ValueError:
					pass

			if cur[1] == strike and cur[2] == ball:
				answer_check += 1
			else:
				pass

		if answer_check == len(baseball):
			print(check_num)
			answer += 1

	return answer
```

