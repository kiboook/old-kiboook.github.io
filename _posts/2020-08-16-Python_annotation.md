---
title:  "[Python] annotation"
excerpt: ""

categories:
  - Python

tags:
---

## Python annotation

이런 구조가 있다고만 알고 있었는데 <a href="https://leetcode.com/" style="color:#0FA678">릿코드</a> 문제를 풀면서 제대로 공부했다.

annotation 은 우리말로 바꾸면 주석이다.

파이썬은 함수를 정의 할 때 자료형 선언이 필요 없기 때문에 바로 어떤 자료형이 필요한지 알기는 어렵다.

때문에 말 그대로 함수를 정의 할 때 주석을 달 수 있다.

---

함수에 annotation 문법을 사용하려면 **파라미터: 주석** 으로 사용하면 된다.

```python
def add(num1: int, num2: int) -> int:
  return num1 + num2
```

num1, num2 는 int 가 와야하고 -> 의 의미는 return 값이 int 라는 의미이다.

함수 뿐 만 아니라 변수에서도 사용이 가능하다.

```python
id: int = 1
```

하지만 주석일 뿐 이다. 강제는 전혀 없다.

```python
def add(num1: int, num2: int) -> int:
  return num1 + num2

print(add('Hello', ' World'))
```

num1, num2 에 문자열을 넣어주면 **Hello World** 로 문제없이 출력이 된다.

---

List, Tuple, Set, Dict 를 annotation 하려는 경우 typing 모듈을 사용해야 한다고 한다.

```python
from typing import List


def sum(nums: List) -> List[int]:
  return nums
```

아마 List[int] 에서 괄호 안의 자료형은 List 가 포함하고 있는 데이터들의 자료형이 아닐까 싶다..

---

앞서 주석일 뿐 강제는 전혀 없다고 하였다. 하지만 Mypy 를 사용하여 강제 할 수 있다.

```python
def add(num1: int, num2: int) -> int:
  return num1 + num2

print(add('Hello', ' World'))
```

해당 코드를 mypy 로 실행시켜보면 다음과 같이 오류가 발생한다.

<img src="https://nam-ki-bok.github.io/assets/images/language/p_3.png" style="zoom:30%;" />

변수의 자료형이나 함수 반환값의 자료형을 표시하고 싶다면 annotation 을 사용하고

Mypy 를 이용 해 오류를 찾아내도록 하자.