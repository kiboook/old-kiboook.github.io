---
title:  "[BaekJoon] 백준 10816번 : 숫자 카드2"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 10816번 : 숫자 카드2

<center><img src="https://nam-ki-bok.github.io/assets/images/baekjoon/parenthesis.png" style="zoom:50%;" /></center>

<br>

**[6, 3, 2, 10, 10, 10, -10, -10, 7, 3]** 이 내가 가진 카드 번호이고 갯수가 궁금한 숫자인 **[10, 9, -5, 2, 3, 4, 5, -10]** 이 주어진다면

각각 몇 개가 있는지 출력하면 된다. 이 같은 경우는 **3, 0, 0, 1, 2, 0, 0, 2** 이다.

파이썬에서는 배열의 원소의 갯수를 세어 딕셔너리 형태로 반환해주는 함수가 있다.

<a href="https://nam-ki-bok.github.io/python/Python_collection/" style="color:#0FA678">[Python] collection</a> 모듈에 있는 Counter 함수를 이용하면 된다.

**defaultdict** 를 사용해 숫자가 없는 경우 value 값을 0 으로 미리 정해두는 방법도 있지만

try, except 를 이용해 처리하는게 더 가독성이 좋은 것 같다.

---

```python
import collections


n = int(input())
my_card = list(map(int, input().split()))

m = int(input())
find_card = list(map(int, input().split()))

my_card = collections.Counter(my_card)

for num in find_card:
	try:
		print(my_card[num], end=' ')
	except KeyError:
		print(0, end=' ')
```

