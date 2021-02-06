---
title: "[BaekJoon] 2493번 : 탑"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2493번 : 탑

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/107112962-beca9100-689e-11eb-85f9-4ae16dcac6c1.png">
</center>


<br>

<img src="https://user-images.githubusercontent.com/54533309/107112988-f6d1d400-689e-11eb-9d6f-538f5e7737d8.png" alt="image" width="600" />

다음과 같이 현재 탑의 신호를 어떤 탑이 수신하는지 알아내면 되는 문제이다.

신호를 받아 줄 탑을 스택으로 관리하면 된다.

만약 왼쪽에 있는 탑이 나보다 높다면 그 탑을 신호를 받아 줄 탑으로 정하면 되고

왼쪽에 있는 탑이 나보다 낮다면 신호를 받아 줄 탑을 보면서 내 신호를 받아줄 수 있는지 확인한다.

받아 줄 수 없다면 스택에서 빼버리고 계속 반복한다.

가장 효율이 좋은 코드를 보니 스택을 사용하지 않고 재귀를 통해 신호를 받아 줄 탑을 찾아간다.

예를들어 네 번째 탑의 경우 세 번째 탑이 신호를 받아 줄 수 없기 때문에 세 번째 탑의 신호를 받아주는 탑으로 이동한다.

여기서 이 탑이 또 신호를 받아주지 못한다면 이 탑의 신호를 받아 주는 탑으로 다시 이동한다.

세상엔 똑똑한 사람들이 정말 많은 것 같다..

---

```python
import sys


def solution():
	answer = [0]
	receive_tower = []

	for i in range(1, len(towers)):
		if towers[i - 1] > towers[i]:
			answer.append(i)
			receive_tower.append([towers[i - 1], i])
		else:
			while receive_tower:
				if receive_tower[-1][0] < towers[i]:
					receive_tower.pop()
				else:
					answer.append(receive_tower[-1][1])
					receive_tower.append([towers[i], i + 1])
					break
			if not receive_tower:
				answer.append(0)
				receive_tower.append([towers[i], i + 1])

	print(*answer)

	return


if __name__ == '__main__':
	n = int(input())
	towers = list(map(int, sys.stdin.readline().rsplit()))
	solution()
```

<br>