---
title:  "[LeetCode] 701. Insert into a Binary Search Tree"
excerpt: ""

categories:
  - LeetCode

tags:
---

## 701. Insert into a Binary Search Tree

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/makeBST2.png" style="zoom:50%;" /></center>

앞서 풀었던 이진탐색트리 만드는 문제와 똑같은 유형이다. LeetCode 문제를 풀면서 나도 모르게 들었던 습관이 있다.

바로 Solution 클래스에 함수가 주어지면 그 안에다 나만의 함수를 만들어 풀었다.

뭐 그래도 풀리면 상관은 없겠다만 재귀같은 부분에서 뭔가 꼬이는 부분이 좀 있었다. 그냥 주는대로 그 함수 써서 풀려고 노력해야겠다.

이 문제도 겉에 함수에서 재귀로 돌면 아주 간단히 풀 수 있으니까..

---

```python
# Definition for a binary tree node.
class TreeNode:
	def __init__(self, val=0, left=None, right=None):
		self.val = val
		self.left = left
		self.right = right


class Solution:
	def insertIntoBST(self, root: TreeNode, val: int) -> TreeNode:
		if root is None:
			return TreeNode(val)

		if val < root.val:
			root.left = self.insertIntoBST(root.left, val)
		else:
			root.right = self.insertIntoBST(root.right, val)

		return root
```

