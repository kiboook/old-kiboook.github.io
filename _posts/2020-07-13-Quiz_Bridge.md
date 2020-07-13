---
title:  "[Programmers] 다리를 지나는 트럭"
excerpt: ""

categories:
  - Quiz

tags:

---

## 다리를 지나는 트럭

<a href="https://programmers.co.kr/learn/courses/30/lessons/42583" style="color:#0FA678" target="_blank">다리를 지나는 트럭</a> 을 클릭하면 바로 이동한다.

이 문제는 손으로 알고리즘을 쭉 써보고 코드로 옮겼는데 맞아서 정말 재밌었다 !

먼저 맨 처음 트럭을 bridge queue 에 넣어 다리 위에 올리고

맨 뒤에 있는 트럭이 2초 이상 다리 위에 있는 경우

다음 트럭을 들여보낼지 말지 check_add_truck 함수로 확인 했다.

그 후 bridge 에 있는 트럭들을 모두 한 칸 씩 움직인 뒤

다리 위를 벗어난 트럭은 pop 시켰다.

그리고 sec 를 1초 올리면 됐다 !

그런데 다리 위를 벗어난 트럭을 pop 시키는 경우 에러가 발생했다.

바로 bridge queue 를 반복문으로 도는데 도중에 pop 시켜버리면 안된다 !!

그래서 어떤 방법이 있을까 여러가지 생각을 해봤는데 어차피 pop 되는 트럭은 무조건 맨 앞 트럭이다.

그렇다면 bridge queue 를 뒤에서 부터 검사하는 경우 에러는 발생하지 않는다 !!

```python
from collections import deque


def check_add_truck(bridge, trucks, weight):
	total_weight = 0
	for cur in bridge:
		total_weight += cur[0]

	if trucks[0][0] + total_weight <= weight:
		return True
	else:
		return False


def solution(bridge_length, weight, truck_weights):
	trucks = deque([[val, 1] for val in truck_weights])
	bridge = deque()
	bridge.append(trucks.popleft())
	sec = 1

	while bridge:
		if bridge[-1][1] >= 2 and trucks:  # 다음 트럭이 들어 올 수 있나 확인
			if check_add_truck(bridge, trucks, weight):  # 들어 올 수 있는 경우
				bridge.append(trucks.popleft())
			else:
				pass

		for val in reversed(bridge):
			val[1] += 1
			if val[1] > bridge_length:
				bridge.popleft()

		if trucks and not bridge:  # bridge 가 비었고 truck 이 남아있는 경우
			bridge.append(trucks.popleft())
		sec += 1

	return sec
```

그리고 33 ~ 34 번째 줄 코드는 만약 트럭이 모두 무게가 커서 한 대 씩 밖에 지나갈 수 없는 경우

트럭 한 대가 지나간 뒤 bridge queue 가 비어있는 상태로 while 문에 들어가 끝나버린다.

그 경우를 막기 위해 bridge 가 비었고 truck 이 남아 있는 경우 바로 트럭을 넣어주었다.