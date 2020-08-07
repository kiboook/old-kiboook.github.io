---
title:  "[Programmers] 최솟값 만들기"
excerpt: ""

categories:
  - Quiz

tags:
---

## 최솟값 만들기

<a href="https://programmers.co.kr/learn/courses/30/lessons/12941" style="color:#0FA678" target="_blank">최솟값 만들기</a> 를 클릭하면 바로 이동한다.

길이가 같은 배열 두 개가 주어지면 각 인자를 곱해 더한 값 중 최솟값을 구해야 한다.

A = [3, 4, 6], B = [8, 2, 1] 이 주어진다면

3 * 8 = 24

4 * 2 = 8

6 * 1 = 6

38 이 최솟값이 된다.

어떻게 해야 최솟값이 나올까 생각하며 계산을 해보면 A 는 최솟값을, B 는 최댓값을 서로 곱하면 된다.

---

```python
def solution(A, B):
	result = 0

	while len(A) > 0:
		result += A.pop(A.index(min(A))) * B.pop(B.index(max(B)))

	return result
```

처음엔 이런 식으로 풀었다.. 정확성은 맞았지만 효율성에서 다 틀려버렸다.

지금보면 진짜 바보같이 풀었다..

최솟값을 찾고, index 를 구하고 거기서 또 pop 을 했다 !!

```python
def solution(A, B):
	result = 0

	for val_A, val_B in zip(sorted(A), sorted(B, reverse=True)):
		result += val_A * val_B

	return result
```

정렬 한 뒤 zip 으로 반복하면 되는데 말이다 !!!