---
title:  "[Programmers] 최댓값과 최솟값"
excerpt: ""

categories:
  - Quiz

tags:
---

## 최댓값과 최솟값

<a href="https://programmers.co.kr/learn/courses/30/lessons/12939" style="color:#0FA678" target="_blank">최댓값과 최솟값</a> 을 클릭하면 바로 이동한다.

split 기능을 이용하면 해결 할 수 있는 문제였다.

```python
def solution(s):
	_list = [int(val) for val in s.split(' ')]
	max_val = str(max(_list))
	min_val = str(min(_list))
	return min_val + ' ' + max_val
```

```python
def solution(s):
	_list = list(map(int, s.split(' ')))
	max_val = str(max(_list))
	min_val = str(min(_list))
	return min_val + ' ' + max_val
```

comprehension 을 사용해도 되지만 map 을 사용해도 된다.

하지만.. comprehension 을 사용 할 생각은 했지만 map 을 이용 할 생각은 하지 못했다.

분명 comprehension 보다 map 이 더 강력하다.

그러니까 map 을 잘 활용하도록 해야겠다.

---

이런 고민이 있었다 !

이렇게 간단한 문제도 포스팅을 해야할까.. 생각하면서 이 문제를 검색해봤는데 생각보다 포스팅 하신 분들이 많았다.

그 중 어떤 글을 봤는데 글쓴이는 이런 문제도 쉽다.. 간단하다.. 라면서 포스팅을 하지 않을 것 이라고 했다.

이유를 보니 자신도 처음 코딩을 배우고 문제를 풀 때 어려웠던 문제를 다른 사람들은 쉽고 간단하다고 한 걸 보았을때

박탈감을 느꼈다고 한다.. 나도 내 입장에서 쉽고 간단한 문제라도 거기서 더 배울 점을 찾아보며 포스팅 해야겠다고 마음을 먹었다.