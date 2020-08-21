---
title:  "[LeetCode] Sum of Nodes with Even-Valued Grandparent "
excerpt: ""

categories:
  - LeetCode

tags:
---

## Sum of Nodes with Even-Valued Grandparent

<center><img src="https://nam-ki-bok.github.io/assets/images/leetcode/grand1.png" style="zoom:50%;" /></center>

LeetCode 문제를 풀다가 느꼈는데 Input 이 친절하지 않다. 이 문제도 **Input:** root = [6, 7, 8, 2, 7, 1, 3, 9, null, 1, 4, null, null, null, 5]

으로만 되어있고 정답 코드는 이미 Binary Tree 가 구현 된 상태를 전제로 작성해야 한다.

객체로 구현하지 않고 단순히 root 배열의 index 를 통해서 풀 수 도 있는데 말이다.

이런 식의 트리 구현을 연습하라는 뜻인가.. 사실 객체로 트리 만드는 건 한 번도 안해보긴 했다.. 이 기회에 한 번 만들어서 순회도 해봐야겠다.

---

주어진 트리를 순회하면서 조부모 노드가 짝수 인 경우 현재 노드의 값을 더하면 된다.

트리는 이미 구현이 되어서 주어지기 때문에 DFS 코드만 짜면 된다.

```python
class Solution:
	def sumEvenGrandparent(self, root: TreeNode) -> int:
		def DFS(node, parent, grand, answer):
			if not node:
				return 0

			if grand and grand.val % 2 == 0:
				answer.append(node.val)
			DFS(node.left, node, parent, answer)
			DFS(node.right, node, parent, answer)

		answer = []
		DFS(root, None, None, answer)
		return sum(answer)
```

