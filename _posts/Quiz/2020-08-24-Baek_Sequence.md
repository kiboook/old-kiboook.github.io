---
title:  "[BaekJoon] 백준 1015번 : 수열 정렬"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1015번 : 수열 정렬

<center><img src="https://nam-ki-bok.github.io/assets/images/baekjoon/sequencesort.png" style="zoom:50%;" /></center>

처음에 문제 자체가 이해가 안가서 10 번은 넘게 읽었던 것 같다.. 그래도 이해가 제대로 안가서 또 손으로 풀어 봤다..

두 세번 정도 풀어보면 문제가 어떤 걸 원하는지 알 수 있다. 바로 배열 A 의 데이터들이 몇 번 째로 작은지를 반환 하면 된다.

위 예시를 보면 **[2, 3, 1]** 은 **[1, 2, 0]** 번 째로 작다. 제일 작은 수는 0 번째로 작다고 처리하면 된다.

**[5, 5, 2, 1, 3, 3]** 은 **[4, 5, 1, 0, 2, 3]** 번 째로 작다. 같은 수가 있는 경우 **[5, 4, 1, 0, 3, 2]** 도 가능하다.

하지만 조건에서 여러 개의 답이 있는 경우 사전 순으로 앞서는 것을 반환하라고 되어있다.

---

```python
a_size = int(input())
a = [int(val) for val in input().split()]
sort_a = sorted(a)

p = []
for i in range(a_size):
	p.append(sort_a.index(a[i]))
	sort_a[p[i]] = -1

for val in p:
	print(val, end=' ')
```

