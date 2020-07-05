---
title:  "[Python] list, dict comprehension"
excerpt: ""

categories:
  - Python

tags:
---

## List Comprehension

우리는 코딩을 하다보면 여러가지 조건을 통해 list, dict 을 초기화 해야하는 경우가 있다.

복잡한 list, dict 도 comprehension 을 통해 쉽게 초기화 할 수 있다.

굳이 말하면 쉽게 만들기 보다는 코드를 간단히 줄일 수 있다는게 맞는 것 같다.

예를 들어보자면 1 ~ 100 까지의 숫자 중 짝수만 가진 리스트를 만들어 보려고 한다.

comprehension 기능을 모른다면..

```python
myList = []
for val in range(1, 101):
  if val%2 == 0:
    myList.append(val)
```

하지만 comprehension 을 사용한다면..

```python
myList = [val for val in range(1, 101) if val%2 == 0]
```

한 줄로 줄일 수 있다. 간단한 예를 들어서 그렇지만 조금 복잡한 리스트를 초기화 하는 경우

포문 여러 개 를 사용 할 수 도 있는데 모두 한 줄로 초기화가 가능해진다.

## Dict Comprehension

list 뿐 만 아니라 dict 도 초기화가 가능하다.

<a href="https://nam-ki-bok.github.io/quiz/Quiz_GymCloth/" style="color:#0FA678">[Programmers] 체육복</a> 문제에서 조금은 복잡한 dict 를 만들어야 했는데

comprehension 을 통해 아주 간단히 만들 수 있다.

```python
animal = ['dog', 'cat', 'cow']
num = [3,5,10]

animal_dict = {animal : num for val in zip(animal, num)}
```

동물을 key 로 num 을 value 로 가지는 dict 를 만들고 싶을 때 zip 함수를 이용하여 매우매우 간단하게 초기화 할 수 있다.

## 정리

아주 간단한 예를 들었지만 굉장히 복잡한 comprehension 도 많이 있다.

if 뿐 만 아니라 else 문 도 들어 갈 수 있다.

하지만 elif 문 은 들어 갈 수 없어 무조건 if else 로 만들어야 해 처음에는 조금 헷갈렸다.

comprehension 을 한 번 접하면 다음부터는 이 기능이 없는 언어는 사용하기도 싫어진다고 하는데

정말 그럴 것 같다 아주아주 편하기 때문!

