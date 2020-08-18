---
title:  "[Programmers] 전화번호 목록"
excerpt: ""

categories:
  - Quiz

tags:


---

## 전화번호 목록

<a href="https://programmers.co.kr/learn/courses/30/lessons/42577" style="color:#0FA678" target="_blank">전화번호 목록</a> 을 클릭하면 바로 이동한다.

['3213', '213', '7979', '21397'] 이 주어진다면 213이 21397의 접두어 이기 때문에 False 를 반환해야한다.

213이 다른 원소 중 접두어 역할을 하는지 검사하는 방향으로 코드를 작성했다.

```python
from collections import deque


def solution(phone_book):
	sort_phone = deque(sorted(phone_book))

	while sort_phone:
		val_min = sort_phone.popleft()
		for val in sort_phone:
			if val_min == val[:len(val_min)]:
				return False

	return True
```

이렇게 짠다면 해시는 이용하지 않았지만 정확성, 효율성 문제를 모두 통과한다.

그리고 심지어 해시를 사용한 코드보다 효율성에서 5배 가량 빠르다..

아마 효율성 테스트케이스가 제대로 구성되어있지 않은 것 같기도 하다.

왜냐하면 해시를 사용하는 경우 sort 할 필요 없이 dict 에 집어넣어 검사를 하면 된다.

위 코드의 알고리즘을 반대로 생각해 '21397' 중 '2' 가 dict 에 있는지, '21' 이 dict 에 있는지 '213' 이 dcit 에 있는지를 확인 하면 된다.

최대 20 자리의 전화번호가 최대 1,000,000개 올 수 있으니 최악의 경우를 생각해 해시를 사용하는게 맞다.

추가로 아주 많은 데이터를 검색하고 싶다면 list 에서 검색하지 말고 dict, set 으로 바꾼 뒤 검색하자 !!

list 에서 검색은 O(N) 이지만 set, dict 에서 검색은 O(1) 이니까 !!