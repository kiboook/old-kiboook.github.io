---
title: "[BaekJoon] 백준 1032번 : 명령 프롬프트"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1032번 : 명령 프롬프트

<center><img width="1155" alt="Terminal" src="https://user-images.githubusercontent.com/54533309/94539326-094c5900-0280-11eb-8780-60703d67469a.png">
</center>


<br>

문자열에서 공통 부분을 뺀 나머지 부분을 '?' 로 바꾸면 되는 문제이다.

첫 번째 문자열을 기준삼아 나머지 문자열에 같은 index 에 같은 문자가 있는지 확인하고 만약 다르다면 '?' 를 붙인다.

모든 문자열을 돌았는데 같은 index 에 모두 같은 문자가 있다면 그 문자를 붙인다.

예를들어 이런 문자열이 주어진다면

**cba**

**bba**

**bbo**

**obc**

 **'c', 'b', 'a'** 를 기준삼아 **bba, bbo, obc** 각 자리를 확인한다.

index = 0 은 값이 다르기 때문에 '?'

index = 1 은 값이 같기 때문에 'b'

index = 2 는 값이 다르기 때문에 '?' 를 answer 문자열에 붙여준다.

---

```python
import sys


n = int(input())
answer = ''
arr = [sys.stdin.readline().rsplit()[0] for _ in range(n)]

for i in range(len(arr[0])):
	check = arr[0][i]
	for val in arr:
		if val[i] != check:
			answer += '?'
			break
	else:
		answer += check

print(answer)
```

<br>