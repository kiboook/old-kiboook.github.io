---
title:  "[Programmers] 영어 끝말잇기"
excerpt: ""

categories:
  - Quiz

tags:
---

## 영어 끝말잇기

<a href="https://programmers.co.kr/learn/courses/30/lessons/12981" style="color:#0FA678">영어 끝말잇기</a> 을 클릭하면 바로 이동한다.

이 문제는 n 명의 사람이 영어로 된 끝말잇기를 할 때, '가장 먼저 탈락하는 사람의 번호와 몇 번째 차례에 탈락하는지' 를 출력하면 된다.

예를 들어서

n = 2
words = ['hello', 'one', 'even', 'never', 'now', 'world', 'draw'] 값이 주어지면

index = 5 에서 탈락 한 것을 알 수 있다. 그러면 [1,3] 을 반환하면 된다.

이 문제는 인덱스만 잘 찾아가서 비교만 하면 되는 간단한 문제이다..

하지만 다 풀고 나서 다른 사람의 코드를 보고 나니 어제보다 더 충격을 받았다..

역시 우선 기초를 탄탄히 해야 어디든 써먹는다는 사실을 아주아주 느꼈다.

우선 나의 정답 코드이다.

```python
def solution(n, words):
    for i in range(1, len(words)):
    	if words[i-1][len(words[i-1])-1] == words[i][0]:
    		for j in range(0, i):
    			if words[i] == words[j]:
    				return [(i % n) + 1, i//n +1]
    	else:
    		return [(i % n) + 1, i//n +1]
    return [0,0]
```

사실 이것도 몇 번 수정한 코드이다.. 사칙연산 중 '//' 는 버림을 한 값을 반환하는 사실을 알게되었다..

매번 math import 해서 floor 함수를 사용했는데.. 그리고 return 의 경우 answer 에 값을 담아서 return 해야만 하는 줄 알았다.

그런데 그냥 리스트 자체를 리턴해도 가능했다!! C 였다면 상상도 못 할 얘기..

어쨌든 이 정도로 수정해서 제출 후 다른 사람의 코드를 봤는데 정말 충격이였다..

```python
def solution(n, words):
    for p in range(1, len(words)):
        if words[p][0] != words[p-1][-1] or words[p] in words[:p]: return [(p%n)+1, (p//n)+1]
    else:
        return [0,0]
```

바로 이렇게 정리가 되었다.. 나는 중복으로 말한 단어를 검사하는 것을 for 문을 사용해 하나씩 접근하며 비교했는데

역시 아주 좋은 기능이 있었다. words[p] in words[:p] 를 사용하면 p 이전에 같은 값이 있는지 없는지를 반환해준다.

그리고 끝말잇기를 제대로 했나 검사하기 위해 나는 단어의 길이-1 을 마지막 index 로 활용했는데

index = -1 은 맨 마지막 인덱스를 의미한다.. 그런데 사실 이 기능 모두 파이썬 처음 공부할때 다 배웠던 기능들이다.

다시한번 느끼지만 기초를 튼튼히 해야 어떤 문제든 쉽게 풀 수 있다!