---
title:  "[Python] 기초 튼튼 다지기 List"
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

<br>

<a href="https://nam-ki-bok.github.io/python/Python_Start/" style="color:#0FA678">Python 기초 튼튼 다지기_1</a> 에서 대충 느낌대로 정리한게 있는데 w3school에 아주 정리가 잘 되어있었다.

- **List** is a collection which is ordered and changeable. Allows duplicate members.

- **Tuple** is a collection which is ordered and unchangeable. Allows duplicate members.

- **Set** is a collection which is unordered and unindexed. No duplicate members.

- **Dictionary** is a collection which is unordered, changeable and indexed. No duplicate members.

  

## List

List는 C 에서 배열과 아주아주 유사하다. 똑같다고는 하면 안될 것 같다. C 에서는 문자열 배열을 저장하려면 좀 복잡해지니까 !

하지만 List는 그냥 inputList = ["apple", "banana", "grape"] 면 된다. 이 점도 굉장히 편하다고 생각했는데

기본 함수가 편한게 엄청 많이 있었다. 예를 들어보자면 pop, append, remove 등등.. C 에서 스택 만들고 pop 하려면

그래도 코딩을 좀 했어야 했는데 말이다 !! sort, reverse 함수도 있더라..