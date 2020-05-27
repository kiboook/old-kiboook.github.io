---
title:  "[Python] 기초 튼튼 다지기_3"
excerpt: ""

categories:
  - Python

tags:
---

## Python 기초 튼튼 다지기_3

우선 첫 번째로 기억할 것 !!!

```python
txt = " Hello, World "
print(txt.strip())
```

strip() 함수는 white space를 삭제하고 출력해준다.

<br>

그리고 int 와 string 을 합치고 싶을땐 ?

```python
num = 10
string = "input {} plz"
print = string.format(num)
```

으로 하면 저기 중괄호에 10이 들어간다. 근데 저렇게 해둔 상태로 string만 출력하면 중괄호가 의미없이 출력되는데

왜 저렇게 하는걸까 뭔가 쓸 일이 있을까..