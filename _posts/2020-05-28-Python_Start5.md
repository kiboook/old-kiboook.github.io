---
title:  "[Python] 기초 튼튼 다지기_5"
excerpt: ""

categories:
  - Python

tags:
---

## Function

함수는 어느 언어에서나 중요한 기능이다.

코드를 아주아주 예쁘고 깔끔하게 만들 수 있다.

파이썬에서 함수를 공부하던 중 아주 재미있는 걸 발견했다.

함수가 돌아가는데 필요한 인수를 얼마나 줘야하는지 모른다면 ?

```python
def myFunction(*args):
  # use args
```

이런식으로 parameter 이름 앞에 * 을 붙여주면 된다.

그렇게 되면

```python
def myFunction(*args):
  # use args[1]
  
myFunction('apple', 'banana', 'cherry')
myFunction('car', 'train')
```

이렇게 argument 개수 상관 없이 사용 할 수 있다.

약간 C 에서 배열 넘겨주는 느낌 ! 느낌만 그런 것 이다. 파이썬은 포인터가 없다 !

그 다음으로는 parameter 로 keyward argument 를 사용하는 경우이다.

```python
def myFunction(**kwargs):
  # use kwargs['fruits']

myFunction(fruit='apple', price=1500)
```

이정도만 차이가 있고 다른 함수 사용 방법은 C 와 똑같다. 

마지막 예시로 재귀함수를 보여줬는데 예전에 재귀함수 이해 안가서 머리 터질뻔 한 기억이 새록새록 났다.