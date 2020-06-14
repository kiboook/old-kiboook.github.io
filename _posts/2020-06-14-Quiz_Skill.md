---
title:  "[Programmers] 스킬트리"
excerpt: ""

categories:
  - Quiz

tags:
---

## 스킬트리

<a href="https://programmers.co.kr/learn/courses/30/lessons/49993" style="color:#0FA678">스킬트리</a> 를 클릭하면 바로 이동한다.

이 문제는 스킬을 배워야 할 순서를 주면 스킬트리가 선행 스킬 순서에 맞게 입력되었나 체크하는 문제이다.

| skill | skill_trees                       | return |
| ----- | --------------------------------- | ------ |
| "CBD" | ["BACDE", "CBADF", "AECB", "BDA"] | 2      |

"CBD" 라는 스킬 순서가 주어졌고 주어진 스킬트리가 적합한지 검사하면 된다 !

위의 예시에서는 "CBADF", "AECB" 가 적합한 스킬트리이기 때문에 리턴값은 2 이다.

처음에 어떻게 접근해야할까 꽤 고민했다.. Level2 문제인데..

어쨌든, 파이썬을 공부하면서 스트링을 다루는 함수가 아주 다양하고 유용한게 많다는 걸 알았다.

그래서 생각한 풀이법은 스킬트리에서 주어진 스킬들만 뽑아내 새로운 스킬트리를 만들었다.

예를 들면 "BACDE" 같은 경우 주어진 스킬인 "CBD" 만 뽑아낸다면 "BCD" 가 된다.

이렇게 뽑아낸 스킬을 "CBD" 와 비교하는 것이다.

파이썬에는 A 스트링이 B에 포함되어있는지를 반환하는 아주 좋은 함수가 있다.

그래서 포함이 되어있다면 카운트 값을 1 올렸다.

당연히 백점일 것이란 생각을 하고 제출했는데 테스트케이스 10개 중 한 개만 맞았다..

문제가 무엇인가 자세히 보니 마지막 같은 경우 "BDA" 에서 스킬을 뽑아내면 "BD" 가 되고

"CBD" 에는 포함되니 이 스킬트리도 가능하다고 판단 해 카운트를 올렸던 것이다..

C 를 먼저 배우지 않았기 때문에 "BD" 는 성립하지 않는다.

그래서 어떤 방법이 있나 생각해 보던 중.. 앞서 뽑아낸 스킬이 포함만 되어있으면 카운트를 올렸는데

포함되어있는 위치가 인덱스 0 부터 시작되어있으면 조건이 성립했다.

말로 설명하려니 복잡한 것 같은데 코드를 보면 이해가 갈 것이다.

```python
def solution(skill, skill_trees):
    answer = 0
    data = ""
    i = 0
    # skill과 비교해 있는 스킬만 추출
    for skillTreeCur in skill_trees:
    	for skillTreeIndex in skillTreeCur:
    		if skillTreeIndex in skill:
    				data += skillTreeIndex
    	if data in skill and skill.find(data) == 0: # 포함되어있는 위치가 0 이어야한다
    		answer += 1
    	data = ""
    return answer
```

이 문제를 풀면서 느낀건데.. C 같은 경우는 구문을 {} 중괄호로 묶어서 구분이 잘 가는데

파이썬은 들여쓰기로 구분을 하니 이중포문에 조건문을 쓰니 조금 헷갈렸다.

파이써닉 한 코드를 짜도록 노력하자..

