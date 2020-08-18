---
title:  "[Programmers] 실패율"
excerpt: ""

categories:
  - Quiz

tags:
---

## 완주하지 못한 선수

<a href="https://programmers.co.kr/learn/courses/30/lessons/42889" style="color:#0FA678" target="_blank">실패율</a> 을 클릭하면 바로 이동한다.

문제에서 설명해주는 실패율을 더 와닿게 정의해보자면

실패율 = n<sup>th</sup> Stage에 있는 사람 수 / n<sup>th</sup> Stage 이상에 있는 사람 수 라고 할 수 있다.

return 해야 할 값은 실패율을 기준으로 stage 를 내림차순 정렬하여 출력하면 된다.

실패율이 같을 경우 작은 stage 먼저 오면 된다 !

우선 dict 에 key 값은 stage, value 값은 실패율로 저장을 한 후 value 값을 기준으로 내림차순 정렬을 했다.

```python
import operator

def solution(N, stages):
	answer = []
	temp = dict()

	for i in range(N):
		curStage = 0
		overStage = 0

		for j in stages:
			if i+1 == j:
				curStage += 1
			
			if i+1 <= j:
				overStage += 1

		if curStage == 0 or overStage == 0:
			temp[i+1] = 0
		else:
			temp[i+1] = curStage / overStage
		
	sTemp = sorted(temp.items(), key=operator.itemgetter(1), reverse=True)
	
	for cur in sTemp:
		answer.append(cur[0])

	return answer
```

아직 다른 사람의 풀이는 보지 않았는데 딱 봐도 간단하고 짧은 코드가 엄청 많았다..

얼른 가서 배워야겠다!