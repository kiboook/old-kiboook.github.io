---
title:  "[LeetCode] 1305. All Elements in Two Binary Search Trees"
excerpt: ""

categories:
  - LeetCode

tags:
---

## 1305. All Elements in Two Binary Search Trees

<center><img width="983" alt="MergeBST" src="https://user-images.githubusercontent.com/54533309/92083700-58c67300-ee01-11ea-87a6-d6ef6950cac1.png"></center>

이진 탐색 트리 두 개를 순회해서 정렬 된 각각의 리스트를 만든 뒤 두 리스트를 오름차순 형태로 합치면 되는 문제이다.

해결 방법은 아주 다양하다.

트리를 아무렇게나 순회 해서 얻은 리스트를 합친 뒤 정렬을 해도 되고..

트리를 오름차순으로 순회해서 얻은 리스트를 합친 뒤 정렬을 해도 되고..

트리를 오름차순으로 순회해서 얻은 리스트를 투 포인터 알고리즘으로 합쳐도 된다..

물론 아무렇게나 순회해서 얻은 리스트를 합친 뒤 정렬을 하는게 가장 쉽다.

그래도 알고리즘 문제를 푸는거니까.. 트리를 오름차순으로 순회해서 얻은 리스트를 투 포인터 알고리즘으로 합치는 방향으로 풀었다.

이진 탐색 트리는 중위순회를 할 경우 정렬 된 순서를 얻을 수 있다 !

---

```python
from typing import List


# Definition for a binary tree node.
class TreeNode:
	def __init__(self, val=0, left=None, right=None):
		self.val = val
		self.left = left
		self.right = right

class Solution:
	def make_sort_list(self, root):
		_list = []

		def in_order(root):
			if not root:
				return

			else:
				in_order(root.left)
				_list.append(root.val)
				in_order(root.right)

		in_order(root)
		return _list

	def getAllElements(self, root1: TreeNode, root2: TreeNode) -> List[int]:
		a = self.make_sort_list(root1)
		b = self.make_sort_list(root2)
		merge = []
		a_idx, b_idx = 0, 0

		while a_idx < len(a) and b_idx < len(b):
			if a[a_idx] >= b[b_idx]:
				merge.append(b[b_idx])
				b_idx += 1
			else:
				merge.append(a[a_idx])
				a_idx += 1

		while a_idx < len(a):
			merge.append(a[a_idx])
			a_idx += 1
		while b_idx < len(b):
			merge.append(b[b_idx])
			b_idx += 1

		return merge
```

