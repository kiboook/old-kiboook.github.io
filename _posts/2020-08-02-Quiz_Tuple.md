---
title:  "[Programmers] 튜플"
excerpt: ""

categories:
  - Quiz

tags:
---

## 튜플

<a href="https://programmers.co.kr/learn/courses/30/lessons/64065" style="color:#0FA678" target="_blank">튜플</a> 을 클릭하면 바로 이동한다.

이 문제는 두 가지를 해결해야 하는 문제이다.

첫 번째는 문자열로 주어진 집합을 내가 원하는 자료형으로 바꾸는 것!

두 번째는 원하는 자료형으로 바꾸고 난 뒤 문제에서 요구하는 답을 도출해 낼 것!

---

문자열이 주어지면 나는 그것을 리스트로 바꾸길 원했다.

그래서 처음 생각한 방법은 s[1:-1] 을 통해 맨 처음과 마지막 괄호는 떼고 반복문을 돌리면서 '{' 가 나오면 데이터를 저장하고

'}' 가 나오면 저장 된 데이터를 리스트로 옮기는 작업을 했다.

[[1, 2, 3], [2, 1], [1, 2, 4, 3], [2]] 로 만든 뒤 해당 이차원 리스트를 길이 순으로 정렬을 했다.

[[2], [2, 1], [1, 2, 3], [1, 2, 4, 3]] 이 되는데 이제 첫 번째 리스트 부터 돌면서 중복 값을 제외한 값들을 뽑아내면 된다.

[2, 1, 3, 4] 가 나오게 된다.

```python
def solution(s):
	string = s[1:-1]
	sort_box = list()
	box = list()
	answer = list()
	input_num = ''

	for cur in string:
		if cur == '{':
			switch = True
			continue
		elif cur == '}':
			switch = False
			box.append(int(input_num))
			sort_box.append(box.copy())
			box.clear()
			input_num = ''

		if switch and cur != ',':
			input_num += cur

		if switch and cur == ',':
			box.append(int(input_num))
			input_num = ''

	sort_box.sort(key=lambda x: len(x))
	answer.append(sort_box[0][0])

	for val in sort_box:
		answer += set(val) - set(answer)

	return answer
```

---

리스트로 바꾸는 더 간단한 방법이 있었다.

나도 처음엔 split 을 사용 해 볼까 했는데 적당하게 나눌 기준이 안보여 포기했었다.

하지만... 조금만 더 꼼꼼히 볼 껄 기준이 있었다 !!

맨 왼쪽 괄호 두 개 , 맨 오른쪽 괄호 두 개를 지운 뒤 '},{' 로 split 하면 숫자만 뽑아낼 수 있다.

```python
def solution(s):
	split_str = s[2:-2].split('},{')
	sort_box = []
	box = []
	answer = []
	input_num = ''

	for cur in split_str:
		for val in cur:
			if val != ',':
				input_num += val
			else:
				box.append(int(input_num))
				input_num = ''

		box.append(int(input_num))
		input_num = ''
		sort_box.append(box.copy())
		box.clear()

	sort_box.sort(key=lambda x: len(x))

	for val in sort_box:
		answer += set(val) - set(answer)

	return answer
```

