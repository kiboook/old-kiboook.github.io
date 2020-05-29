---
title:  "[Python] 기초 튼튼 다지기 Module"
excerpt: ""

categories:
  - Python

tags:
---

## Module

모듈을 배우면서 내가 앞서 무턱대고 했던 크롤링 코드에 관한 의문이 아주 많이 풀렸다.

모듈은 여러 함수들을 모아놓은 패키지라고 생각하면 되겠다.

내가 myModule.py 라는 파일을 만들었다고 해보자

```python
# myModule.py

def printHello(name):
  print('Hello',name)
  
person = {
  'name' : 'Bok'
  'age' : 25
}
```

이름과 함께 안녕! 이라는 문구를 출력하는 함수를 가지고 있는 모듈이다.

<br>

이 모듈을 다른 .py 에 이식해보자

```python
import myModule

myModule.printHello('John')

print(myModule.person['name'])
```

이 코드를 실행한다면 `Hello John` 이라는 문구가 출력 될 것이다.

아니면 자료형도 가져와 사용 할 수 있다.

마찬하지로 위 코드를 실행한다면 Bok 도 같이 출력 될 것이다.

<br>

여기서 모듈 이름도 내가 원하는 이름으로 수정 할 수 있다.

```python
import myModule as mod

mod.printHello('John')

print(mod.person['name'])
```

<br>

또, 원하는 함수나 자료형만 가져와 사용 할 수 도있다.

```python
from myModule import person

print(person['name'])
```

이때는 앞에 모듈이름은 붙이지 않는다.

맨 처음 무턱대고 크롤링을 할때 BeautifulSoup, request 등 여러가지 모듈을 가져와 사용했는데

정말 import, from import , import as 의 차이도 모르는 채로 사용을 했다.

이제 완벽히 이해했으니 다행이다 !