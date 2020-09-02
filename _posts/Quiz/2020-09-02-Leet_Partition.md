---
title:  "[LeetCode] 763. Partition Labels"
excerpt: ""

categories:
  - LeetCode

tags:
---

## 763. Partition Labels

<center><img width="999" alt="partition" src="https://user-images.githubusercontent.com/54533309/92012093-f892eb00-ed86-11ea-96f9-2f3d5a214dd5.png"></center>

문자열을 최대한 많이 쪼개서 쪼갠 덩어리 안에 최대한 각각의 알파벳이 많이 있게 해야한다.

매 순간 순간 최선을 다하는 탐욕 알고리즘을 사용하면 된다.

먼저 S 를 S 의 첫 번째 알파벳이 마지막으로 나오는 순간까지 쪼개 partition 을 만든다.

그 다음 partition 에서 두 번째 알파벳이 마지막으로 S 에서 나오는 순간을 찾아 S의 처음부터 그곳까지를 partition 에 이어 붙인다.

partition 의 마지막 알파벳 까지 반복한다. S 가 없을 때 까지 반복하면 답을 구할 수 있다.

주어진 예시를 통해 과정을 살펴보면 처음엔 **partition = ababcbaca, S = defegdehijhklij** 로 나눌 수 있다.

이때 partition에 어떤 알파벳도 S 에 있지 않기 때문에 더 이상 이어붙일 구간이 없다.

다음으로 **partition = defegd, S = ehijhklij** 로 나눌 수 있다. 이때 partition 에 있는 e 가 S 에 있기 때문에 이어 붙인다.

그렇게 되면 **partition = defegde, S = hijhklij** 가 된다. 나머지 S 도 똑같이 반복하면 된다. 

---

```python
from typing import List


class Solution:
	def partitionLabels(self, S: str) -> List[int]:
		output = []
		idx = 0
		while S:
			find_alpha = S[0]
			for i, val in enumerate(S[::-1]):
				if val == find_alpha:
					idx = len(S) - i - 1
					break

			partition = S[:idx + 1]
			S = S[idx + 1:]

			p_idx = 0
			while p_idx < len(partition):
				add_idx = -1
				for i, S_val in enumerate(S[::-1]):
					if partition[p_idx] == S_val:
						add_idx = len(S) - i - 1
						break

				if add_idx >= 0:
					partition += S[:add_idx + 1]
					S = S[add_idx + 1:]
				p_idx += 1

			output.append(len(partition))
		return output
```

