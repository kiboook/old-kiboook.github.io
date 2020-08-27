---
title:  "[LeetCode] 654. Maximum Binary Tree"
excerpt: ""

categories:
  - LeetCode

tags:
---

## 654. Maximum Binary Tree

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/maximumtree.png" style="zoom:50%;" /></center>

주어진 조건대로 이진 트리를 구현하는 문제이다.

1. 루트노드는 해당 배열의 Max 값을 가진다.
2. 왼쪽 서브 트리는 해당 배열의 Max 값 기준 왼쪽 배열들로 이루어진다.
3. 오른쪽 서브 트리는 해당 배열의 Max 값 기준 오른쪽 배열들로 이루어진다.

**[3, 2, 1, 6, 0, 5]** 가 주어진다면 루트노드의 값은 6 이 되고 **[3, 2, 1]** 로 왼쪽 서브 트리를 구성하고 **[0, 5]** 오른쪽 서브 트리를 구성한다.

**[3, 2, 1]** 로 다시 루트노드는 값이 3이 되고 왼쪽 서브 트리는 없기 때문에 종료, **[2, 1]** 로 오른쪽 서브 트리를 구성한다.

나눌 수 없을 때 까지 계속 배열을 나누며 트리를 만들기 때문에 재귀를 사용하면 된다.

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
	def constructMaximumBinaryTree(self, nums: List[int]) -> TreeNode:
		root = TreeNode(max(nums))

		def make_tree(nums, root):
			left_arr = nums[:nums.index(root.val)]
			right_arr = nums[nums.index(root.val) + 1:]

			if not nums:
				return

			if len(left_arr) >= 1:
				root.left = TreeNode(max(left_arr))
				make_tree(left_arr, root.left)

			if len(right_arr) >= 1:
				root.right = TreeNode(max(right_arr))
				make_tree(right_arr, root.right)

		make_tree(nums, root)
		return root
```

