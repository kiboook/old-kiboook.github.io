---
title:  "[BaekJoon] 백준 2805번 : 나무 자르기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2805번 : 나무 자르기

<center><img src="https://nam-ki-bok.github.io/assets/images/baekjoon/cuttree.png" style="zoom:50%;" /></center>

**n = 4, k = 17, tree = [20, 15, 17, 10]** 이 주어진다면 이때 절단기에 설정할 수 있는 높이의 최댓값은 11 이 된다.

우선 최댓값 11 을 어떻게 구했나 생각을 해본다면 제일 긴 나무의 높이가 20m 이다.

그렇다면 절단기의 높이를 19m 로 둔 뒤 내가 원하는 M 미터의 나무를 가지지 못 할 때까지 높이를 내려보면 된다.

하지만 여기서 나무 길이의 최댓값은 20억이다.

만약 나무가 1,000,000 그루가 있고 이 중 한 그루만 2,000,000,000m 이고 나머지는 전부 1m 라고 해보자.

그런데 내가 가져가고 싶은 나무가 1,999,999,999m 라면 엄청나게 많은 연산을 해야한다.

이렇게 탐색해야할 양이 무지하게 많을 때 이진 탐색을 이용하면 금방 찾을 수 있다.

앞서 **n = 4, k = 17, tree = [20, 15, 17, 10]** 이 주어졌을 때 어떻게 설정할 수 있는 높이의 최댓값이 11 인 걸 알았을까 ?

먼저 절단기의 높이를 19m 로 설정한 뒤 벌목을 하면 내가 원하는 만큼의 나무를 얻지 못한다.

이때 절단기의 높이를 반으로 줄인 9m 로 설정한 뒤 벌목을 하면 내가 원하는 만큼의 나무를 얻는다.

하지만 우리가 궁금한 것은 최대 설정 높이이다. 따라서 9m 와 19m 사이를 다시 검사해보면 된다.

9m 와 19m 의 중간인 14m 로 설정한 뒤 벌목을 해보면 내가 원하는 만큼의 나무를 얻지 못한다.

지금 까지의 작업으로 우리는 9m 이상 14m 미만으로 설정하면 우리가 원하는 만큼의 나무를 얻을 수 있다는 것을 알았다.

이 작업을 계속 반복 해 Xm 이상 일때의 값과 중간m 의 값이 일치할 때, Xm가 최대 설정 높이가 된다.

---

```python
def cut_tree(tress, height):
	output = 0
	for val in trees:
		if val - height > 0:
			output += val - height

	return output


def find_max_height(trees, m):
	right = max(trees) - 1
	left = 0

	if m == 1:
		return right

	while True:
		mid = (left + right) // 2

		output = cut_tree(trees, mid)
		if mid == left:
			return left

		if output >= m:  # 이 높이는 요구하는 나무의 높이를 충족한다.
			left = mid
		else:  #  이 높이는 요구하는 나무의 높이를 충족하지 못 한다.
			right = mid


n, m = map(int, input().split())
trees = list(map(int, input().split()))
print(find_max_height(trees, m))
```

