---
title:  "[LeetCode] 1008. Construct Binary Search Tree from Preorder Traversal"
excerpt: ""

categories:
  - LeetCode

tags:
---

## 1008. Construct Binary Search Tree from Preorder Traversal

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/makeBST.png" style="zoom:50%;" /></center>

어떤 트리를 선위순회로 돌았을 경우의 방문 순서가 담긴 배열이 Input 으로 주어진다.

이때 이 Input 값을 가지고 이진 탐색 트리를 만드는 문제이다. 왜 굳이 선위순회로 방문 한 순서를 줬는지는 아직 잘 모르겠다..

루트노드를 알게 하기 위함인가.. 어쨌든 선위순회는 루트를 먼저 방문하기 때문에 배열에서 index 가 0 인 값을 루트노드로 삼으면 된다.

그러니까 그냥 **[8, 5, 1, 7, 10, 12]** 순서로 이진 탐색트리를 만들면 정답이다. 

왜 선위순회로 돌았을 경우를 Input 으로 주었을까.. 내가 놓친 무언가가 있나.. 제약조건이 있는건가..

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
	def bstFromPreorder(self, preorder: List[int]) -> TreeNode:
		root = TreeNode(preorder[0])

		def make_BST(root, val):
			cur_node = root

			while True:
				if val < cur_node.val:
					if cur_node.left:
						cur_node = cur_node.left
					else:
						cur_node.left = TreeNode(val)
						break

				else:
					if cur_node.right:
						cur_node = cur_node.right
					else:
						cur_node.right = TreeNode(val)
						break

		for val in preorder[1:]:
			make_BST(root, val)

		return root
```

