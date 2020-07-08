---
title:  "[Programmers] 멀쩡한 사각형"
excerpt: ""

categories:
  - Quiz

tags:

---

## 멀쩡한 사각형

<a href="https://programmers.co.kr/learn/courses/30/lessons/62048" style="color:#0FA678" target="_blank">멀쩡한 사각형</a> 을 클릭하면 바로 이동한다.

지금까지 풀어 본 문제는 별로 없지만 그 중에서 제일 어려웠던 문제..

프로그래밍적 머리가 아니라 수학적 머리가 있어야 했다..

진짜 아무리 패턴을 찾아봐도 안보여 다른 사람들의 풀이를 조금 참조했다.

<a href="https://leedakyeong.tistory.com/entry/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EB%A9%80%EC%A9%A1%ED%95%9C-%EC%82%AC%EA%B0%81%ED%98%95-in-python" style="color:#0FA678" target="_blank">이 곳</a> 을 참조했는데 어떻게 이런 관계를 찾아낼까 정말 대단하다!!! 멋있다!!!

역시 수학 잘하는 사람이 멋있는 것 같다..

어쨌든 내가 처음에 접근했던 방법은 직선과 닿지 않는 정사각형 개수를 구해보는 것 이었다.

좌표평면에 y = <sup>h</sup>/<sub>w</sub> * x 식을 그려 각각의 좌표를 비교해서 찾아볼까.. 했지만 어림없는 소리였다.

샘플데이터의 최대 h, w 가 1억이었는데 말도 안되는 연산을 해야한다..

## 풀이

답은 최대공약수에 있었다.

먼저 문제의 예시로 주어진 8 * 12 사각형을 보자

<img src="https://nam-ki-bok.github.io/assets/images/programmers/Ractangle_1.jpeg" style="zoom:40%;" />

그림은 음의 기울기를 가진 직선이지만 y축 대칭을 시킨 상태로 예를 들어보겠다.

식은 y = <sup>3</sup>/<sub>2</sub> * x 가 된다. 그말인 즉슨 (2,3) (4,6) (6,9) (8,12) 좌표를 지나간다는 의미이다.

8과 12의 최대공약수는 4이다. 그림에도 4개의 패턴이 반복되고 있다.

이제 저 패턴을 분석하면 된다. 패턴마다 4개의 사각형을 가로지르고 있다. 이 4개의 숫자는 어떻게 구할까?

바로 w/g + h/g - 1 이다. 혹시 모르니 다른 예시도 한번 따져보자

 <img src="https://nam-ki-bok.github.io/assets/images/programmers/Ractangle_2.jpeg" style="zoom:20%;" />

식은 y = 2 * x 가 된다. (1,2) (2,4) (3,6) 좌표를 지나간다는 의미이다.

마찬가지로 6과 3의 최대공약수인 3 만큼 패턴이 반복된다.

w/g + h/g - 1 을 하면 2 가 나오는 것을 알 수 있다.

## 정리

이제 식을 일반화 시키면 답을 구할 수 있다.

(w * h) - (w/g + h/g - 1) * g = (w * h) - (w + h - g) 가 된다.

```python
import math


def solution(w, h):
	return (w * h) - (w + h - math.gcd(w, h))
```

이렇게 수학적으로 풀어야 하는 문제는 무조건 패턴!! 규칙!!!을 찾도록 노력해보자