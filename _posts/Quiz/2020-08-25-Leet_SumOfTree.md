---
title:  "[LeetCode] 1038. Binary Search Tree to Greater Sum Tree"
excerpt: ""

categories:
  - LeetCode

tags:
---

## 1038. Binary Search Tree to Greater Sum Tree

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/sumoftree.png" style="zoom:50%;" /></center>

이진 탐색 트리를 통해 최대값을 가진 노드부터 차례대로 탐색 해 계속 값을 더해 노드에 다시 저장해주는 문제.

<a href="https://nam-ki-bok.github.io/python/Python_BinaryTree/" style="color:#0FA678">[Python] Binary Search Tree</a> 이 글을 보면 이진 탐색 트리가 주어진 경우 중위순회를 하면 오름차순으로 정렬 된 값을 구할 수 있다.

중위순회는 왼쪽 부트리 &rarr; 루트 &rarr; 오른쪽 부트리 순서로 탐색을 한다.

하지만 이 경우에는 내림차순으로 정렬 된 값을 구해야 하기 때문에 오른쪽 부트리 &rarr; 루트 &rarr; 왼쪽 부트리 순서로 바꿔준다.

노드 값의 합 같은 경우는 전역변수로 만들어 관리하기 쉽게 하였다.

---

```python
from typing import List


class TreeNode:
	def __init__(self, val=0, left=None, right=None):
		self.val = val
		self.left = left
		self.right = right


class Solution:
	def bstToGst(self, root: TreeNode) -> TreeNode:
		global _sum
		_sum = 0

		def post_order(cur_node):
			global _sum
			if not cur_node:
				return
			else:
				post_order(cur_node.right)
				_sum += cur_node.val
				cur_node.val = _sum
				post_order(cur_node.left)

		post_order(root)
		return root
```

