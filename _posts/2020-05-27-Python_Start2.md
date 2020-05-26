---
title:  "[Python] 기초 튼튼 다지기_2"
excerpt: ""

categories:
  - Python

tags:
---

## Python 기초 튼튼 다지기

오늘은 간단하게 String 관해서 공부했다.

진짜 계속 느끼는 부분인데 C 보다 너무너무너무 편리한 것 같다.

우선 제일 충격적이였던게 String 에서 부분 String 검사해주는 것..

예전에 C 처음 공부할 때 과제로 이런 문제가 나온 적이 있다.

이런 String이 있으면 여기서 ain은 몇 개 존재할까?

```c
inputString = "The rain in Spain stays mainly in the plain";
```

거의 4년 전 일이지만 아직도 기억한다 엄청 힘들게 코딩했던 것을!!

그런데 파이썬에서는

```python
inputString = "The rain in Spain stays mainly in the plain"
test = "ain" in inputString
print(test)
```

이 코드를 돌려보면 True 값이 나온다..

정말 진짜 신기했다.

그 외에도 아주 편리한 String 함수들이 많이 있었다.

여담이지만 오늘 확률과통계 과제를 했다. 초기하분포, 포아송분포를 파이썬으로 코딩하여 나온 값을 제출하는 것 이었다.

그런데 SciPy를 이용하니 람다 값, X 값만 넣어주면 전부 결과를 리턴해줬다..

여기서 한 번더 파이썬이 멋져보였다..

오늘은 다른게 할게 많아 파이썬 많이 다지지 못했으니 내일 충분히 다져야겠다.