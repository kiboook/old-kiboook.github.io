---
title:  "[Programmers] 오픈채팅방"
excerpt: ""

categories:
  - Quiz

tags:
---

## 오픈채팅방

<a href="https://programmers.co.kr/learn/courses/30/lessons/42888" style="color:#0FA678" target="_blank">오픈채팅방</a> 을 클릭하면 바로 이동한다.

user Id 를 사용하기 때문에 dict 자료형을 이용해서 풀었다.

닉네임을 가진 회원들이 오픈 채팅방을 들어왔다 나갔다 했을때의 로그를 저장해 관리자에게 보여주는 문제.

닉네임을 변경하는 경우, 나간 후 새로운 닉네임으로 들어우는 경우, 채팅방에서 닉네임을 변경하는 경우가 있다.

어찌됐든 최종 닉네임을 로그에 저장해주면 됐기 때문에 먼저 명령을 통해 최종 닉네임을 결정 한 뒤

다시 명령을 보며 로그를 만들어주면 됐다.

---

```python
def solution(record):
	user = dict()
	answer = list()

	for cur in record:
		order = cur.split(' ')
		if order[0] == 'Enter':
			user[order[1]] = order[2]
		elif order[0] == 'Change':
			user[order[1]] = order[2]

	for cur in record:
		order = cur.split(' ')
		if order[0] == 'Enter':
			answer.append(user[order[1]] + '님이 들어왔습니다.')
		elif order[0] == 'Leave':
			answer.append(user[order[1]] + '님이 나갔습니다.')

	return answer
```

