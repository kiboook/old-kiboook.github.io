---
title:  "[Python] Binary Search Tree"
excerpt: ""

categories:
  - Python

tags:
---

## Python Binary Search Tree

<a href="https://nam-ki-bok.github.io/leetcode/Leet_EvenGrande/" style="color:#0FA678">[LeetCode] Sum of Nodes with Even-Valued Grandparent</a>

문제를 풀며 궁금증이 생겨 파이썬으로 이진 탐색 트리를 만들어 보려고 한다.

C 로 구현하려면 포인터를 써야해서 굉장히 복잡한데 파이썬은 어떨까 ?

그 전에 이진트리와 이진탐색트리를 비교 해 보자. 이진 트리는 모든 노드의 자식이 2개 이하이면 된다.

하지만 이진 탐색 트리는 여기서 조건이 더 추가 되는데 현재 노드를 기준으로 왼쪽 자식은 값이 작아야 하고 오른쪽 자식은 값이 커야 한다.

또 모든 노드는 유일 한 값을 가진다. 이런 조건을 가지는 이유는 내가 원하는 값을 찾아갈때 빠르게 찾아 갈 수 있기 때문이다.

---

**data = [9, 7, 15, 10, 3, 8, 2, 17, 13, 25, 4]** 를 이진 탐색 트리로 만들어 보려고 한다. 먼저 노드를 만들어 주어야 한다.

노드는 값을 가지고 있는 한 덩어리로 생각하면 된다.

```python
class Node:
	def __init__(self, data):
		self.data = data
		self.left = self.right = None
```

C 로 할땐 각 노드를 포인터로 연결 해 주어야 했는데 객체로 만드니 대입만 해주면 되어서 아주 편했다..

노드를 만들었다면 우리가 만들고자 하는 이진 탐색 트리 객체를 만든다.

```python
class Binary_Search_Tree:
	def __init__(self):
		self.root = None
    
    
my_tree = Binary_Search_Tree()
```

이 상태는 노드가 아예 없는 빈 트리를 한 개 만든 상태이다. 

## Insert

insert 함수를 만들어 값을 가진 노드를 트리로 만들어 준다.

```python
class Binary_Search_Tree:

	def insert(self, data):
		self.root = self.insert_node(self.root, data)
		return self.root

	def insert_node(self, node, data):
		if node is None:
			node = Node(data)  # 루트 노드 생성
		else:
			if data < node.data:
				node.left = self.insert_node(node.left, data)
			else:
				node.right = self.insert_node(node.right, data)
		return node
```

## Find

이진 탐색 트리에 내가 원하는 값이 있는지 궁금 한 경우가 있다. 이때 이진 탐색 트리의 특징을 통해 빠르게 값을 찾을 수 있다.

```python
class Binary_Search_Tree:

	def find(self, key):
		return self._find(self.root, key)

	def _find(self, root, key):
		if root is None or key == root.data:
			return root is not None
		else:
			if key < root.data:
				return self._find(root.left, key)
			else:
				return self._find(root.right, key)
```

재귀함수를 통해 나보다 작으면 왼쪽, 나보다 크면 오른쪽으로 가 탐색을 한다.

## Pre-Order (전위 순회)

루트 &rarr; 왼쪽 서브트리 &rarr; 오른쪽 서브트리 순서로 순회 하는 방식이다.

```python
class Binary_Search_Tree:

	def pre_order(self):
		output = []

		def _pre_order(node):
			if node is None:
				return
			else:
				output.append(node.data)
				_pre_order(node.left)
				_pre_order(node.right)
		_pre_order(self.root)
		print('Pre_Order :', output)
```

**data = [9, 7, 15, 10, 3, 8, 2, 17, 13, 25, 4]** 이 배열로 이진 탐색 트리를 만든 뒤 전위 순회를 하면

**[9, 7, 3, 2, 4, 8, 15, 10, 13, 17 ,25]** 순서로 순회 한다.

## In-Order (중위 순회)

왼쪽 서브트리 &rarr; 루트 &rarr; 오른쪽 서브트리 순서로 순회 하는 방식이다.

```python
class Binary_Search_Tree:

	def in_order(self):
		output = []

		def _in_order(node):
			if node is None:
				return
			else:
				_in_order(node.left)
				output.append(node.data)
				_in_order(node.right)
		_in_order(self.root)
		print('In_Order :', output)
```

**data = [9, 7, 15, 10, 3, 8, 2, 17, 13, 25, 4]** 이 배열로 이진 탐색 트리를 만든 뒤 중위 순회를 하면

**[2, 3, 4, 7, 8, 9, 10, 13, 15, 17, 25]** 순서로 순회 한다. 정렬 된 값을 얻을 수 있다는 특징이 있다.

## Post-Order (후위 순회)

왼쪽 서브트리 &rarr; 오른쪽 서브트리&rarr; 루트  순서로 순회 하는 방식이다.

```python
class Binary_Search_Tree:

	def post_order(self):
		output = []

		def _post_order(node):
			if node is None:
				return
			else:
				_post_order(node.left)
				_post_order(node.right)
				output.append(node.data)
		_post_order(self.root)
		print('Post_Order :', output)
```

**data = [9, 7, 15, 10, 3, 8, 2, 17, 13, 25, 4]** 이 배열로 이진 탐색 트리를 만든 뒤 후위 순회를 하면

**[2, 4, 3, 8, 7, 13, 10, 25, 17, 15, 9]** 순서로 순회 한다. 정렬 된 값을 얻을 수 있다는 특징이 있다.

## Level-Order (레벨 순회)

레벨 순으로 노드들을 순회 한다.

```python
class Binary_Search_Tree:

	def level_order(self):
		output = []
		def _level_order(root):
			queue = deque()
			queue.append(root)

			while queue:
				node = queue.popleft()
				if node is not None:
					output.append(node.data)
					if node.left:
						queue.append(node.left)
					if node.right:
						queue.append(node.right)
		_level_order(self.root)
		print('level_order :', output)
```

**data = [9, 7, 15, 10, 3, 8, 2, 17, 13, 25, 4]** 이 배열로 이진 탐색 트리를 만든 뒤 레벨 순회를 하면

**[9, 7, 15, 3, 8, 10, 17, 2, 4, 13, 25]** 순서로 순회 한다. 그래프와 달리 연결이 되어있지 않기 때문에 방문 여부를 체크하지 않아도 된다.

