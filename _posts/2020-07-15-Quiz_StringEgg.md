---
title:  "[Programmers] 문자열 압축"
excerpt: ""

categories:
  - Quiz

tags:

---

## 문자열 압축

<a href="https://programmers.co.kr/learn/courses/30/lessons/60057" style="color:#0FA678" target="_blank">문자열 압축</a> 을 클릭하면 바로 이동한다.

조금 난해했지만 생각보다 금방 풀었다 !

index 가지고 문자열 다루는게 제일 머리 아프고 한 번 꼬이면 뇌까지 꼬여버리는 것 같다..

전체적인 틀은 문자열을 1개 단위, 2개 단위, 3개 단위 ... (주어진 문자열의 길이 // 2) 개 단위 까지 압축을 시켜 본 뒤

제일 짧은 문자열 길이를 리턴하면 됐다 !

```python
def solution(s):
	if len(s) == 1:
		return 1

	answer = ''
	len_list = []

	for i in range(1, (len(s) // 2) + 1):
		output = ''
		cnt = 0
		check = s[0:i]
		for j in range(0, len(s) + 1, i):
			if check == s[j:j+i]:
				cnt += 1
			else:
				if cnt == 1:
					output += check
				else:
					output += (str(cnt) + check)
				check = s[j:j+i]
				cnt = 1
		output += s[j:len(s)]  # 전부 압축 후 남은 부분 채워주기
		len_list.append(len(output))

	return min(len_list)
```

안쪽의 for 문에서는 i 만큼 j 를 증가시키며 index 를 통해 비교했다. 두 가지의 문제가 있었는데

---

**첫 번째** 는 단위 별로 문자열을 비교했을 때 마지막 단위가 같은 경우 else 문을 들어가지 않고 for 문을 빠져나와 입력이 안되었다.

예를 들어 'ababcdcdababcdcd' 같은 경우 2개 단위로 압축을 시키면 '2ab2cd2ab2cd' 가 되어야 하는데

마지막 cdcd 부분이 같아서 13번 째 줄의 if 문으로 들어가 cnt 만 올리고 for 문이 종료 되어버리는 문제였다.

이 문제는 12 번째 줄의 for 문에서 범위를 len(s) 에서 len(s) + 1 로 바꾸어 해결했다.

문자열을 slice 하는 경우 앞, 뒤 가 전부 존재하지 않는 index 를 입력하면 빈 문자열을 리턴한다.

그래서 마지막에 cd 와 빈 문자열을 비교하게 해 else 문으로 보낸 뒤 output 에 입력을 해주었다.

---

**두 번째** 는 단위 별로 문자열을 압축시키다 보니 뒤에 비교도 안되고 남아버리는 문자열이 생겼다.

예를 들어 'ababcdcdababcdcd' 같은 경우 6개 단위로 압축을 시키면 구조상 'ababcd', 'cdabab' 만 비교하고 for 문이 종료된다.

따라서 맨 마지막에 단위 상 비교를 못 하는 부분을 전부 넣어줬다.

---

**마지막** 은 이렇게 코드를 짠 뒤 제출했는데 28개의 케이스 중 27개는 정답이고 한 개의 케이스가 런타임 에러였다.

런타임 에러든 무슨 에러든 테스트 케이스 대부분은 맞고 몇 개가 틀린다면 극한의 케이스를 대입해보자 !!!

이 문제 같은 경우 코드를 보면 아무리 생각해도 주어진 문자열의 길이가 **1** 인 경우 문제가 생길 것 같다.

그래서 문자열의 길이가 **1** 인 경우는 바로 1을 리턴해주었다.