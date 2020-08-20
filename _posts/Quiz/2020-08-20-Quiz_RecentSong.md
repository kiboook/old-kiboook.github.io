---
title:  "[Programmers] 방금그곡"
excerpt: ""

categories:
  - Quiz

tags:
---

## 방금그곡

<a href="https://programmers.co.kr/learn/courses/30/lessons/17683" style="color:#0FA678" target="_blank">방금그곡</a> 을 클릭하면 바로 이동한다.

이 문제는 세 가지 조건을 해결 하면 되는 문제이다.

1. 주어진 문자열을 시작시간, 종료시간, 노래이름, 멜로디 로 나누는 것
2. 문자열로 되어있는 시작시간, 종료시간을 통해 노래가 재생 된 시간을 구하는 것
3. 재생 된 시간을 통해 노래 이름과 재생 된 멜로디를 구하는 것

이렇게 구하면 정답을 찾을 수 있다.

---

먼저 **split(',')** 을 이용해 시작시간, 종료시간, 노래이름, 멜로디를 나누어 리스트에 저장한다.

그리고 **#** 이 붙은 멜로디는 나중에 계산할때 골치가 아플 수 도 있다. 때문에 특정 기호로 치환 해 준다.

시작시간과 종료시간은 다시 **split(':')** 을 이용해 나눈뒤 정수로 바꾼다.

~~이때 시작 분 보다 종료 분이 더 큰 경우는 그대로 계산하면 되지만 종료 분이 더 작은 경우에는 다른 방법으로 계산을 한다.~~

어차피 재생 시간만 구하면 되는 것 이기 때문에 종료 시간을 분으로 바꾸고 시작 시간을 분으로 바꿔 빼주기만 하면 된다.

이제 노래의 재생 시간을 구했다면 그에 맞게 멜로디를 만들어 주면 된다.

노래 멜로디보다 재생 시간이 길 수도 있기 때문에 순환해서 저장하도록 한다.

내가 들은 멜로디가 재생 된 노래 멜로디 안에 있다면 재생 된 멜로디의 길이와 노래 이름을 저장한다.

마지막으로 찾고자 하는 음악이 없는 경우 None 을 반환, 한 개인 경우 그대로 반환 하면 된다.

하지만 찾고자 하는 음악이 여러 개 인 경우 재생 시간이 제일 긴 것을 출력하고 재생 시간도 같다면 먼저 입력 된 노래를 출력한다.

```python
def get_time(start, end):
	start_time = start.split(':')
	start_h = int(start_time[0])
	start_m = int(start_time[1])

	end_time = end.split(':')
	end_h = int(end_time[0])
	end_m = int(end_time[1])
  
	# 	if start_m <= end_m:  # 시작 분 보다 종료 분이 더 크거나 같 경우, 작은 경우
	# 		runtime = (end_h - start_h) * 60 + (end_m - start_m)
	# 	else:
	# 		runtime = (end_h - start_h - 1) * 60 + (60 - start_m) + end_m

	return (end_h * 60 + end_m) - (start_h * 60 + start_m)


def solution(m, musicinfos):
	song = dict()
	info = [val.split(',') for val in musicinfos]  # 시작시간, 종료시간, 노래이름, 멜로디로 나누기
	m = m.replace('C#', '$')  #  #이 붙은 멜로디는 계산하기 편하게 치환한다
	m = m.replace('D#', '%')
	m = m.replace('F#', '^')
	m = m.replace('G#', '&')
	m = m.replace('A#', '*')

	for val in info:
		val[3] = val[3].replace('C#', '$')
		val[3] = val[3].replace('D#', '%')
		val[3] = val[3].replace('F#', '^')
		val[3] = val[3].replace('G#', '&')
		val[3] = val[3].replace('A#', '*')

		runtime = get_time(val[0], val[1])
		melody = ''
		for idx in range(runtime):  #  재생 시간만큼 멜로디를 담는다
			melody += val[3][idx % len(val[3])]
		song[val[2]] = melody

	answer = list()
	for val in song.items():  # 찾고자 하는 음악을 모두 담는다
		if m in val[1]:
			answer.append([val[0], len(val[1])])

	if len(answer) == 0:  #  찾고자 하는 음악이 없는 경우, 한 개인 경우, 여러 개인 경우 조건
		return '(None)'

	elif len(answer) == 1:
		return answer[0][0]

	else:
		longest = max([val[1] for val in answer])
		for val in answer:
			if longest == val[1]:
				return val[0]
```

문제를 꼼꼼히 읽어야겠다.. 처음에 풀었을 때 는 30개의 테스트 케이스 중에 3개가 틀렸었다.

이유를 한참 못 찾고 있다가 답이 여러 개 인 경우 조건에 맞춰 출력 하는 코딩을 해주지 않았다는 것을 알았다.

조건을 만들어 주니 모두 맞았다..