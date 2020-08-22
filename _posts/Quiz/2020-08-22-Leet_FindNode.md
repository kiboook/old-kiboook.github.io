---
title:  "[LeetCode] Find a Corresponding Node of a Binary Tree in a Clone of That Tree"
excerpt: ""

categories:
  - LeetCode

tags:
---

## Find a Corresponding Node of a Binary Tree in a Clone of That Tree

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/findnode1.png" style="zoom:50%;" /></center>

문제를 읽고 **또잉 ?** 했다. 뭔가 origianl tree, cloned tree 하면서 엄청 거창해보였다.. 그런데 그냥 노드 찾기 문제였다.

왜 원본, 복제 트리를 구분지은 것 일까.. 문제 풀이에 아무런 상관이 없다.. 그냥 target 노드 찾아가면 그만..

그래서 BFS 를 통해 찾아가는 방식으로 코딩 했다.

---

```python
from collections import deque


class TreeNode:
	def __init__(self, x):
		self.val = x
		self.left = None
		self.right = None

class Solution:
	def getTargetCopy(self, original: TreeNode, cloned: TreeNode, target: TreeNode) -> TreeNode:
		queue = deque()
		queue.append(cloned)
		while queue:
			node = queue.popleft()
			if node.val == target.val:
				return node

			if node.left:
				queue.append(node.left)
			if node.right:
				queue.append(node.right)
```

그런데 풀고보니 문제에 좋아요 보다 싫어요가 더 많았던 문제였다. 다른 사람들도 보고 웃겼나보다!