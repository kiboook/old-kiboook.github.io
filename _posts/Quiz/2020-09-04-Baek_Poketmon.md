---
title:  "[BaekJoon] 1620번 : 나는야 포켓몬 마스터 이다솜"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1620번 : 나는야 포켓몬 마스터 이다솜

<center><img width="1152" alt="Poketmon" src="https://user-images.githubusercontent.com/54533309/92243825-0b2f3080-eefd-11ea-9d60-ee89ffcbeb88.png">
</center>


<br>

사전을 이용하여 원하는 포켓몬 이름이나 번호를 빠르게 검색을 하면 된다.

하지만 번호를 입력하면 이름을, 이름을 입력하면 번호를 출력해야하기 때문에 두 가지 사전을 만들도록 한다.

Key 를 포켓몬 이름으로 Value 를 포켓몬 번호로 가지는 사전만 만들어 검색을 할 때

만약 Value 를 검색해 Key 를 반환하고자 하면 O(n) 의 시간이 걸린다.

사전을 통해 검색을 했는데 **시간초과**가 발생했다 !!!!! 가장 빠른 방법인데 시간초과가 발생해서 엄청 당황했다..

뭐 트리를 만들어서 찾아가야 하나.. 별의 별 생각을 다했는데 도저히 답이 안나와 검색을 해보니 **input()** 이 꽤 느린 함수였다.

**sys.stdin.readline()** 을 사용하면 시간초과 없이 통과할 수 있다. 이 함수는 개행문자를 같이 받아오기 때문에 **.rsplit()** 도 같이 사용하자.

---

```python
import sys


N, M = map(int, sys.stdin.readline().rsplit())

poketmon = {sys.stdin.readline().rsplit()[0]: i + 1 for i in range(N)}
poketmon_reverse = {value: key for key, value in poketmon.items()}
question = [input() for _ in range(M)]

for val in question:
	try:
		poketmon_num = int(val)
	except ValueError:
		print(poketmon[val])
		continue

	print(poketmon_reverse[poketmon_num])
```
