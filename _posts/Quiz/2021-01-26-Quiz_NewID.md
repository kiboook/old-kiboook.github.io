---
title:  "[Programmers] 신규 아이디 추천"
excerpt: ""

categories:
  - Quiz

tags:
---

## 신규 아이디 추천

<a href="https://programmers.co.kr/learn/courses/30/lessons/72410" style="color:#0FA678">신규 아이디 추천</a> 을 클릭하면 바로 이동한다.

![스크린샷 2021-01-26 오후 8 23 35](https://user-images.githubusercontent.com/54533309/105839136-5f55c100-6014-11eb-89a4-63b708e0ac9d.png)

<br>

문제에서 주어진 단계에 맞게 문자열을 수정하면 된다.

문자열 문제는 정규식을 사용하면 아주 편하고 간단하게 풀 수 있다.

하지만.. 아직 정규식을 이해하고 문제에 적용하기는 너무 어렵다..

다른 사람의 풀이를 보면 2, 3, 4, 6 단계를 전부 정규식으로 해결 한 코드가 있다.

이 코드를 통해 정규식 공부를 해야겠다..

---

```python
def solution(new_id):
	id = new_id
	id = id.lower()  # Step 1

	tmp_id = id[:]
	for idx in range(len(id)):  # Step 2
		if id[idx].islower() or id[idx].isdigit() or id[idx] in ['-', '_', '.']:
			continue
		else:
			tmp_id = tmp_id.replace(id[idx], '', 1)
	id = tmp_id[:]

	while True:  # Step 3
		tmp_id = id[:]
		id = id.replace("..", ".")
		if tmp_id == id:
			break

	if id and id[0] == '.':  # Step 4
		id = id[1:]
	if id and id[-1] == '.':
		id = id[:-1]

	if not id:  # Step 5
		id = 'a'

	if len(id) >= 16:  # Step 6
		id = id[:15]
		if id[-1] == '.':
			id = id[:-1]

	if len(id) <= 2:  # Step 7
		while len(id) <= 2:
			id += id[-1]

	return id


if __name__ == '__main__':
	new_id = input()
	print(solution(new_id))
```

 <br>
