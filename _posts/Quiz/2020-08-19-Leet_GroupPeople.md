---
title:  "[LeetCode] 1282. Group the People Given the Group Size They Belong To"
excerpt: ""

categories:
  - LeetCode

tags:
---

## Group the People Given the Group Size They Belong To

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/group1.png" style="zoom:50%;" /></center>

영어 해석하는게 더 힘들었다.. 영어 공부 좀 열심히 해야겠다.. 그래도 해석이 잘 안되면 밑에 예시를 보고 이해하면 된다..

groupSizes 에 있는 숫자 크기만큼 그룹을 만들 수 있고 그 그룹은 숫자의 index 로 이루어진다.

**[3, 3, 3, 3, 3, 1, 3]** 은 크기가 3 인 그룹 두 개, 크기가 1 인 그룹 한 개를 만들 수 있다.

문제의 마지막을 보면 정답의 경우 중 맞는 것 한 개만 반환하라고 한다.

---

```python
class Solution:
	def groupThePeople(self, groupSizes: List[int]) -> List[List[int]]:
		output = []
		for i in groupSizes:
			if i == -1:
				continue
			tmp = []
			for j in range(i):
				tmp.append(groupSizes.index(i))
				groupSizes[groupSizes.index(i)] = -1
			output.append(tmp)

		return output
```

처음에 딱 생각나는 대로 풀어보니 정답은 맞았지만 속도에서 하위 5%가 나와버렸다.. 2중 포문이 있으니 그럴만 하다 !!!

하지만 도저히 다른 방법이 생각이 안나 검색을 해보니 hash 를 사용하면 두 배 가량 빨리 풀 수 있었다.

---

```python
class Solution:
	def groupThePeople(self, groupSizes: List[int]) -> List[List[int]]:
		output = []

		idx_dict = collections.defaultdict(list)

		for idx, i in enumerate(groupSizes):
			idx_dict[i].append(idx)

		for key in idx_dict:
			for i in range(0, len(idx_dict[key]), key):
				output.append(idx_dict[key][i:i + key])

		return output
```

만약 key 가 2인데 value 의 길이가 2가 넘는다면 value 를 2씩 나누어 줘야 한다.

이걸 어떻게 구현 할 까 고민이었는데 range 는 숫자를 얼마씩 증가시킬지 정해줄 수 도 있다..

