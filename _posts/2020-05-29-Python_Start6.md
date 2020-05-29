---
title:  "[Python] 기초 튼튼 다지기 Class"
excerpt: ""

categories:
  - Python

tags:
---

## Class

파이썬은 객체지향 언어이다.

사실 다음으로 객체지향이 무엇인지에 대해 설명 해 보려고 했는데..

논리정연하게 설명 할 수가 없어 공부를 했다.

<a href="https://jeong-pro.tistory.com/95" style="color:#0FA678" >여기</a> 블로그 글을 통해 공부했는데 정말 깔끔하고 이해가 잘 가게 잘 설명해주셨다.

Class는 다음과 같이 정의하고 사용할 수 있다.

```python
class Person:
  def __init__(self, name, age):
    self.name = name
    self.age = age
    
p1 = Person('GilDong', 20)
print(p1.name, p1.age)
```

Java 의 그것과 굉장히 비슷하다 !

저번학기 자바를 수강해야해서 먼저 공부를 했는데 역시 같은 객체지향 이라서 그런지 아주 비슷했다.

init 함수는 생성자의 기능을 하는 것 같고 self 는 자바의 this 를 의미하는 것 같다.

아 물론 self parameter 는 자신이 원하는 이름으로 해도 된다.

대신 무조건 맨 앞에 써줘야 한다.

## Inheritance

객체지향의 특징 중 하나인 **상속** 에 대해 알아보자.

상속은 간단히 말하자면 자식 클래스가 부모 클래스의 속성과 함수를 상속 받아 사용할 수 있는 것을 말한다.

원한다면 함수를 일부 수정해서 사용 할 수도있다.

하지만 혼란을 방지하기 위해 다중상속은 금지한다.

```python
class Person:
  def __init__(self, name, age):
    self.name = name
    self.age = age
    
class Student:
  def __init__(self, name, age, year):
    super().__init__(name, age)
    self.graduationYear = year
    
  def welcome(self):
    print('GoodBye',self.name,' ',self.graduationYear)
```

이런 식으로 Person 클래스의 속성을 상속 받고 추가로 졸업년도를 속성으로 넣어

Student 클래스를 만들었다.

뭔가.. 자바보다 쉬운 느낌이다.