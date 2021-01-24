---
title: "[BaekJoon] 백준 1759번 : 암호 만들기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1759번 : 암호 만들기

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/105623134-b2841400-5e5a-11eb-984c-b114d89b9bda.png">
</center>

<br>

정렬된 암호를 좋아한다고 했기 때문에 순서가 없는 조합으로 만들면 된다.

두 가지 조건을 따져야 하는데, 우선 모음이 무조건 있어야 하고 자음은 최소 두 개 있어야 한다.

집합의 교집합과 차집합을 이용해 구할 수 있다.

먼저 모음 집합과 가능성이 있는 암호 집합의 교집합이 아무것도 없다면 이 암호는 모음이 없다는 의미이기 때문에 탈락시킨다.

다음으로 가능성이 있는 암호 집합에서 모음 집합을 뺐는데 길이가 1 이하라면 탈락시킨다.

처음에 모음 조건만 따지고 자음 조건은 따지질 않아 틀렸습니다를 받았다.

놓치는 조건이 없도록 꼼꼼히 조건을 따지는 노력을 하자..

---

```python
from itertools import combinations


if __name__ == '__main__':
	l, c = map(int, input().rsplit())
	data = sorted(input().rsplit())

	vowel = {'a', 'e', 'i', 'o', 'u'}
	for val in list(combinations(data, l)):
		if set(val) & vowel and len(set(val) - vowel) >= 2:
			print(''.join(val))
```

<br>