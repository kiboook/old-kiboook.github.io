---
title:  "[Python] 기초 튼튼 다지기_4"
excerpt: ""

categories:
  - Python

tags:
---

## Tuple

Tuple 은 앞서 공부했던 List 와 똑같다고 보면 될 것이다.

하지만!! 매우매우 중요한 차이점이 있다. 바로 값 변경, 추가가 안된다는 것 ! 이걸 제외하곤 List 와 같다.

기억해야 할 부분을 정리 해 보자면

```python
test1 = ("apple")
test2 = ("apple",)
```

저 두개의 차이는 무엇일까 ? 바로 test1은 str 타입이고 test2는 원소가 한 개인 튜플인 것이다.

원소가 한 개인 튜플을 만들고 싶다면 마지막에 콤마를 넣어주자 !

또, 튜플은 값 변경, 추가가 안된다고 했다. 그런데 추가를 해야할 일이 생긴 경우 어떻게 해야할까 ?

```python
x = ("apple", "banana", "kiwi")
y = list(x)
y[1] = "melon"
y.append("mango")
x = tuple(y)
```

이런식으로 리스트로 변경 후 작업을 하고 다시 튜플로 바꿔주면 된다.

## Set

set 은 집합이라고 보면 된다. 리스트, 튜플과 다르게 순서도 없고 인덱스도 없다.

그렇기 때문에 원하는 원소로 접근 할 수 없다. for 문으로 하나씩 출력하는 정도 !

앞선 자료형과 거의 비슷하고 원하는 원소를 삭제하고 싶은 경우 discard 를 주로 사용하자.

왜냐하면 remove 는 지우고자 하는 원소가 없는 경우 에러가 발생한다. 하지만 discard 는 에러가 없다 !

그리고 set 에서도 pop() 함수가 존재하는데 set 에 있는 원소 중 랜덤으로 한 개를 지운다.

set 에는 순서와 인덱스가 없으니까 !

다른 set을 서로 합치고 싶다면 union() , update() 를 사용하자.

파이썬에도 랜덤 함수가 있는 것으로 아는데 뭐 간단하게 랜덤을 이용하고 싶을때 set을 써도 괜찮을 것 같다 !

set 으로 먹고 싶은 음식 넣어두고 pop() 해서 점심 메뉴 정하자 !

## Dict

dict 자료형은 앞서 MongoDB 연동을 해 본적이 있는데 이때 접하게 되었다.

```python
myDict = {
	"name":"Google"
	"year":"1996"
}
```

기본 형은 이런 식으로 구성 된다.

여기서 name, year 을 key 라고 하고 Google, 1996 을 value 라고 한다.

물론 dict 안에 dict 가 있을 수 도 있다.

```python
myPhone = {
	"Iphone":{
		"year":"2000",
		"price":"15000"
	},
	"Galaxy":{
		"year":"1500",
		"price":"20000"
	}
}
```

여기서 만약 Iphone 의 가격만 출력하고 싶다면

`print(myPhone['Iphone']['price'])` 로 출력하면 된다.

처음에 이거 몰라서 조금 헤멨다.. 약간 구조체 느낌으로 이해하고 있으면 될 것 같다.