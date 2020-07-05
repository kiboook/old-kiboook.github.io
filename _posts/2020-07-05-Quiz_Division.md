---
title:  "[Programmers] 나누어 떨어지는 숫자 배열"
excerpt: ""

categories:
  - Quiz

tags:

---

## 나누어 떨어지는 숫자 배열

<a href="https://programmers.co.kr/learn/courses/30/lessons/12910" style="color:#0FA678" target="_blank">나누어 떨어지는 숫자 배열</a> 을 클릭하면 바로 이동한다.

오늘은 level 1 의 쉬운 연습문제 위주로 풀고있었는데 이런 문제에서도 배워가는게 많이 있어 정리한다.

> array의 각 element 중 divisor로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 반환하는 함수
>
> solution을 작성해주세요.
>
> divisor로 나누어 떨어지는 element가 하나도 없다면 배열에 -1을 담아 반환하세요.

우선 divisor 로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 만드는 것은

comprehension 을 이용하면 간단히 만들 수 있다.

<a href="https://nam-ki-bok.github.io/python/Python_Comprehension/" style="color:#0FA678" target="_blank">[Python] list, dict comprehension</a>

그런데 만약 divisor 로 나누어 떨어지는 element 가 없다면 배열에 -1을 담아 반환하면 된다.

물론 배열을 만들고 if 문을 통해 배열이 비어있으면 -1을 넣어주면 된다.

하지만 뭔가 길어진다.. 때문에 or 연산을 사용하면 된다.

```python
def solution(arr, divisor):
	return list(sorted(val for val in arr if val % divisor == 0)) or [-1]
```

## or, and 연산

파이썬은 bool 타입도 계산을 할 수 있다.

1. A and B 

   - A 가 거짓이면 바로 A 를 return 한다.

   - A 가 참이면 바로 B 를 return 한다.

     

2. A or B

   - A 가 거짓이면 바로 B 를 return 한다.
   - A 가 참이면 바로 A 를 return 한다.

여기서 바로 return 한다고 표현을 했는데, 계산 과정을 줄이기 위한 수단이다.

만약 (5-3) and False 라는 식을 사용하면 (5-3) 이 참이기 때문에 바로 False 를 return 한다.

아주 조금의 계산 과정도 줄이기 위한 방법이라고 한다.

## 정리

따라서 위의 코드를 보면 배열이 비어있는 경우, 즉 False 인 경우 [-1] 을 return 하게 되는 것 이다.

그런데 또 정리를 하면서 문득 든 생각인데 한 눈에 봤을 때 저 코드를 바로 이해 할 수 있을까 ?!

```python
def solution(arr, divisor):
	answer = list(sorted(val for val in arr if val % divisor == 0))
  if not answer:
    answer = [-1]
  return answer
```

내 생각에는 지금 이 코드가 딱 보면 바로 이해가 더 잘 갈 수 있는 코드라고 생각이 든다.

코딩테스트 문제를 풀면서 다른 사람들의 코드를 보는게 무조건 좋지많은 않은 것 같다.

다른 사람들에게 보여주려고 무작정 압축하고 줄인 코드가 좀 보인다..

그렇다고 적당히 늘여서 쓰자니 파이썬 같지 않고 씨 같은 느낌이 들어서

다음에 한 번 제대로 파이써닉 한 코드가 무엇인지 공부를 해야겠다!