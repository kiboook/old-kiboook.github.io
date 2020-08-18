---
title:  "[Programmers] 쇠막대기"
excerpt: ""

categories:
  - Quiz

tags:

---

## 쇠막대기

<a href="https://programmers.co.kr/learn/courses/30/lessons/42585" style="color:#0FA678" target="_blank">쇠막대기</a> 를 클릭하면 바로 이동한다.

두 가지 방법을 생각 해 봤는데 첫 번째 방법은 각자 막대기 사이의 레이저 개수를 구해 조각 개수를 구하는 방법,

두 번째 방법은 레이저가 나올 때 마다 그 레이저 위에 있는 막대기 개수를 구해 조각 개수를 구하는 방법이다.

두 번째 방법은 아무리 생각해도 규칙이 발견이 안되었다 !!!

그래서 우선 첫 번째 방법으로 문제를 풀어봤다.

```python
def solution(arr):
	answer = 0
	arr = arr.replace('()', 'L')
	stick = list()

	for val in arr:
		if val == '(':
			stick.append(0)
		elif val == ')':
			input = stick.pop() + 1
			answer += input

		elif val == 'L':
			for idx, cnt in enumerate(stick):
				stick[idx] = cnt + 1

	answer += input
	return answer
```

() 를 레이저로 바꿔 준 뒤, 레이저가 나올 때 마다 stick 에 존재하는 모든 스틱의 cnt 를 늘려 주었다.

결과는 20개의 테스트케이스 중 한 개가 시간초과였다..

막대가 많이 겹쳐있고 그 위에 레이저가 계속 있는 경우 첫 막대기부터 계속 값을 올려줘야 해 시간초과가 발생한 것 같다.

저 코드에서 더 이상 시간을 줄일 방법은 없다고 생각이 들어 두번째 방법으로 바꾸기로 했다..

생각보다 규칙이 아주아주 간단했는데 생각하는데 까지 조금 시간이 걸렸다 !!

레이저가 나오는 경우 열림 괄호 개수를 더하고, 닫힘 괄호가 나오는 경우 1 을 더해주면 끝 !!

```python
def solution(arr):
	arr = arr.replace('()', 'L')
	answer = 0
	open = list()

	for val in arr:
		if val == '(':
			open.append(val)
		elif val == ')':
			answer += 1
			open.pop()
		elif val == 'L':
			answer += len(open)

	return answer
```

그림을 그려본다면 바로 이해가 갈 것이다.

---

이 문제는 다른사람풀이 중 정말 잘 풀었다고 생각이 드는 코드가 있었다 !!

```python
def solution(arrangement):
    answer = 0
    sticks = 0
    rasor_to_zero = arrangement.replace('()','0')

    for i in rasor_to_zero:
        if i == '(':
            sticks += 1
        elif i =='0' :
            answer += sticks
        else :
            sticks -= 1
            answer += 1

    return answer
#---------------------------------------------------------#
  def solution(arrangement):
    answer = 0
    stack = 0
    laseron = False
    for p in arrangement:
        if p == '(':
            laseron = True
            stack += 1
        else:
            if laseron==True:
                answer += stack-1
                laseron=False
            else:
                answer += 1
            stack -= 1

    return answer
```

이 두 가지 인데, 첫 번째 코드는 나와 풀이방식은 같은데 스택없이 숫자로만 풀었다.

append, pop 을 +, - 로 했는데 깔끔..

두 번째는 replace 를 사용하지 않고 푼 방식이다.

'(' 가 오면 레이저를 켜고 ')' 가 왔을때 레이저가 켜져있으면 레이저, 꺼져있으면 막대기의 끝이다.