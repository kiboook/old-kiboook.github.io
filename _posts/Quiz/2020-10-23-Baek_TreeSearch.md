---
title: "[BaekJoon] 백준 1991번 : 트리 순회"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1991번 : 트리 순회

<center><img width="1151" alt="스크린샷 2020-10-23 오후 11 07 02" src="https://user-images.githubusercontent.com/54533309/97013808-7784f280-1584-11eb-88c4-190defb17d49.png">
</center>


<br>

드디어 일주일 동안의 중간고사가 끝나고 문제풀이를 시작했다.

문제를 안풀어본지 일주일 밖에 안됐는데 문법이 조금씩 생각이 안났었다..

역시 감을 잃지 않기위해서 매일 푸는게 맞다!!

다시 시작하니까 까먹지 않기 위해서 기초적인 트리 순회 문제를 풀었다.

---

```python
import sys
from string import ascii_uppercase


def preOrder(root):
	if root is None:
		return

	print(root, end='')
	preOrder(tree[root][0])
	preOrder(tree[root][1])


def inOrder(root):
	if root is None:
		return

	inOrder(tree[root][0])
	print(root, end='')    #  DBAECFG  BDACEFG
	inOrder(tree[root][1])


def postOrder(root):
	if root is None:
		return

	postOrder(tree[root][0])
	postOrder(tree[root][1])
	print(root, end='')


alpha = ascii_uppercase
node_num = int(input())
tree = {alpha[i]: [] for i in range(node_num)}

for _ in range(node_num):
	parent, left, right = sys.stdin.readline().rsplit()

	if left == '.':
		tree[parent].append(None)
	else:
		tree[parent].append(left)

	if right == '.':
		tree[parent].append(None)
	else:
		tree[parent].append(right)

preOrder('A')
print()
inOrder('A')
print()
postOrder('A')
```

<br>