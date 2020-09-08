---
title:  "[LeetCode] 1347. Minimum Number of Steps to Make Two Strings Anagram"
excerpt: ""

categories:
  - LeetCode

tags:
---

## 1347. Minimum Number of Steps to Make Two Strings Anagram

<center><img width="834" alt="Anagram" src="https://user-images.githubusercontent.com/54533309/92495830-59f90500-f232-11ea-9ae7-a33ba40cf170.png"></center>

<br>

t 에 있는 문자열 중 일부를 수정해서 s 의 anagram 형태로 만들면 된다.

anagram 은 어떤 문장의 문자 순서를 바꿔서 다른 문장으로 되어있는 형태이다.

예를들어 **bcad** 는 **abcd** 의 anagram 이다.

s = **leetcode &rarr; {'e': 3, 'l': 1, 't': 1, 'c': 1, 'o': 1, 'd': 1}**

t = **practice &rarr; {'c': 2, 'p': 1, 'r': 1, 'a': 1, 't': 1, 'i': 1, 'e': 1}**

이렇게 문자 별로 갯수를 구한 뒤 s - t 를 해준다면 t 에는 없고 s 에만 있는 문자 개수를 구할 수 있다.

**{'l': 1, 'e': 2, 'o': 1, 'd': 1}** t 에서 문자 5개를 이렇게 바꿔주면 t 는 s 의 anagram 이 된다.

**Counter** 를 통해 갯수를 구하고 뺄셈 연산을 통해 값을 구하면 된다.

뺄셈 연산을 사용하면 음수는 사라지기 때문에 정확히 s 에만 있는 문자를 구할 수 있다.

substarct 을 사용하면 음수 값도 전부 반환하게 된다.

<a href="https://nam-ki-bok.github.io/python/Python_collection/" style="color:#0FA678">[Python] collection</a>

---

```python
from collections import Counter


class Solution:
	def minSteps(self, s: str, t: str) -> int:
		check = dict(Counter(s) - Counter(t))

		output = 0
		for val in check.values():
			output += val

		return output


test = Solution()
s = 'leetcode'
t = 'practice'
print(test.minSteps(s, t))
```

