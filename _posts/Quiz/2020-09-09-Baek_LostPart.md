---
title: "[BaekJoon] 백준 1541번 : 잃어버린 괄호"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 1541번 : 잃어버린 괄호

<center><img width="1148" alt="Lost Part" src="https://user-images.githubusercontent.com/54533309/92609736-e0285080-f2f1-11ea-9101-8fdfdb54565b.png">
</center>



<br>

<a href="https://nam-ki-bok.github.io/quiz/Quiz_FomulaMax/" style="color:#0FA678">[Programmers] 수식 최대화</a> 와 비슷한 문제였다.

최솟값을 만들려면 어찌됐든 많은 수를 빼면 된다.

따라서 **+** 로 묶여있는 수는 전부 더한 뒤 남은 모든 뺄셈 계산을 하면 된다.

**10 + 20 - 100 + 40 + 100 + 200 + 10 - 1000** 라면 **30 - 450 - 1000** 을 했을 때 최솟값이 된다.

수식 최대화 문제를 풀 땐 fomula 리스트 한 개를 가지고 계산 한 뒤 잘라 붙이는 작업을 했다면

이 문제를 풀 땐 임시 리스트를 한 개 더 만들어 + 가 아니라면 전부 append 한 뒤

\+ 가 온다면 임시 리스트에서 pop 을 하고 + 다음 숫자를 더해 다시 넣어주었다.

index 로 잘라 붙이는 방법도 있지만 나는 이 방법이 더 이해가 잘 갔다.

그리고 괜히 조건에 숫자 앞에 0 이 붙을 수 도 있다고 해서 한번 int 로 바꿔 준 뒤 다시 넣었다.

---

```python
import re


fomula = input()
fomula = re.split('([^0-9])', fomula)
cal = []
idx = 0

while idx < len(fomula):

	if fomula[idx] == '+':
		num1 = int(cal.pop())
		num2 = int(fomula[idx + 1])
		cal.append(str(num1 + num2))
		idx += 2

	elif fomula[idx] == '-':
		cal.append(fomula[idx])
		idx += 1

	else:
		cal.append(str(int(fomula[idx])))
		idx += 1

print(eval(''.join(cal)))
```

