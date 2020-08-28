---
title:  "[BaekJoon] 백준 1654번 : 랜선 자르기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1654번 : 랜선 자르기

<center><img src="https://nam-ki-bok.github.io/assets/images/baekjoon/cutlan.png" style="zoom:50%;" /></center>

<a href="https://nam-ki-bok.github.io/baekjoon/Baek_CutTree/" style="color:#0FA678">[BaekJoon] 백준 2805번 : 나무 자르기</a> 문제와 똑같은 문제라고 봐도 될 것 같다.

**[802, 743, 457, 539]** 의 길이를 가진 전선이 주어지고 11개를 만들고 싶은 경우 어떻게 구하면 될까 ?

먼저 각 전선을 최소 길이인 457로 잘라본다면 4개의 전선을 만들 수 있다. 그럼 이제 이진 탐색을 통해 **457 // 2 = 228** 을 계산해 본다.

전선을 228 의 길이로 자른다면 10개의 전선을 만들 수 있다. 하지만 내가 원하는 갯수는 11개 이다.

**228 // 2 = 114** 를 계산해본다면  21개의 전선을 만들 수 있다.

이제 알 수 있는 정보는 전선의 길이를 114 이상 228 미만으로 정한 경우 답을 구할 수 있다.

계속 같은 작업을 반복하다가 중간 값과 왼쪽 값이 같아질때 중간 값을 반환하면 답이 된다.

---

```python
def make_lan(lan, m):
	output = 0
	for val in lan:
		output += val // m

	return output


def cut_lan(lan, n):
	left = 0
	right = min(lan)

	if make_lan(lan, right) == n:
		return right

	while True:
		mid = (left + right) // 2
		if left == mid:
			return mid

		if make_lan(lan, mid) < n:
			right = mid
		else:
			left = mid


k, n = map(int, input().split())

lan = []
for i in range(k):
	lan.append(int(input()))

print(cut_lan(lan, n))
```

