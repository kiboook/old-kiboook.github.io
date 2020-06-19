---
title:  "[Programmers] 방문 길이"
excerpt: ""

categories:
  - Quiz

tags:
---

## 방문 길이

<a href="https://programmers.co.kr/learn/courses/30/lessons/49994" style="color:#0FA678">방문 길이</a> 을 클릭하면 바로 이동한다.

> 게임 캐릭터를 4가지 명령어를 통해 움직이려 합니다. 명령어는 다음과 같습니다.
>
> - U: 위쪽으로 한 칸 가기
> - D: 아래쪽으로 한 칸 가기
> - R: 오른쪽으로 한 칸 가기
> - L: 왼쪽으로 한 칸 가기
>
> 캐릭터는 좌표평면의 (0, 0) 위치에서 시작합니다. 좌표평면의 경계는 왼쪽 위(-5, 5), 왼쪽 아래(-5, -5), 오른쪽 위(5, 5), 오른쪽 아래(5, -5)로 이루어져 있습니다.
>
> 예를 들어, ULURRDLLU로 명령했다면
>
> - 1번 명령어부터 7번 명령어까지 다음과 같이 움직입니다.
>
> - 8번 명령어부터 9번 명령어까지 다음과 같이 움직입니다.
>
> 이때, 우리는 게임 캐릭터가 지나간 길 중 **캐릭터가 처음 걸어본 길의 길이**를 구하려고 합니다.
>
> 예를 들어 위의 예시에서 게임 캐릭터가 움직인 길이는 9이지만, 캐릭터가 처음 걸어본 길의 길이는 7이 됩니다.
>
> (8, 9번 명령어에서 움직인 길은 2, 3번 명령어에서 이미 거쳐 간 길입니다)
>
> 단, 좌표평면의 경계를 넘어가는 명령어는 무시합니다. 예를 들어, LULLLLLLU로 명령했다면
>
> - 1번 명령어부터 6번 명령어대로 움직인 후, 7, 8번 명령어는 무시합니다. 다시 9번 명령어대로 움직입니다.
>
> 이때 캐릭터가 처음 걸어본 길의 길이는 7이 됩니다.
>
> 명령어가 매개변수 dirs로 주어질 때, 게임 캐릭터가 처음 걸어본 길의 길이를 구하여 return 하는 solution 함수를 완성해 주세요.

처음 접근했던 방법은 도착 지점의 좌표가 예전에 방문 했던 좌표 중에 있다면 그러한 경우가 발생한 두 번째 부터

처음 걸어본 길이 아니라고 판단했다.. 물론 아주아주 단편적이고 멍청한 생각이었다.

저런 방법으로 생각하고 코딩을 하니 코드도 더러워지고 예외처리도 공통적으로 하는게 아닌 그때그때 처리하는 느낌이라서

싹 지우고 처음부터 시작했다..

여러 경우를 그려 손으로 테스트 해보니 규칙이 보였다.

바로 생각 난 사람도 있겠지만 나는 아니였다.. 어쨌든 규칙은 지금 이동 한 시작점의 좌표, 도착점의 좌표가

이전에 이동한 시작점의 좌표, 도착점의 좌표에 겹치는게 있다면 이미 걸어봤던 길이다!

|      | 시작점  | 도착점  |
| ---- | ------- | ------- |
| R    | (0, 0)  | (1, 0)  |
| U    | (1, 0)  | (1, 1)  |
| D    | (1, 1)  | (1, 0)  |
| D    | (1, 0)  | (1, -1) |
| L    | (1, -1) | (0, -1) |
| U    | (0, -1) | (0,  0) |
| U    | (0, 0)  | (0,  1) |
| R    | (0, 1)  | (1,  1) |
| D    | (1, 1)  | (1,  0) |

위의 표를 보면 세 번째 이동인 'D' 는 두 번째 이동인 'U' 와 시작점, 도착점이 반대로 겹친다.

그 말은 올라갔던 길을 그대로 내려왔다고 판단 할 수 있다.

그리고 마지막 이동인 'D' 를 보면 두 번째 이동인 'U' 와 시작점, 도착점이 반대로 겹친다.

이 말도 돌고돌아 올라갔던 길을 다시 내려왔다고 판단 할 수 있다.

그리고 x, y 좌표가 -5 이상 5 이하 인 경우에만 이동이 유효했다. 따라서 먼저 도착점 좌표를 계산 하고 조건에 맞는 경우에만

갱신을 해주었다.

```python
def check(i, start, end):

	for j in range(i):
		if start[i] == start[j] and end[i] == end[j]:
			return False

		if start[i] == end[j] and end[i] == start[j]:
			return False
	else:
		return True

def solution(dirs):
	x = 0
	y = 1
	answer = 1

	start = [[0 for i in range(2)] for j in range(len(dirs))]
	end = [[0 for i in range(2)] for j in range(len(dirs))]

	if dirs[0] == 'U':
		end[0][y] += 1
	elif dirs[0] == 'D':
		end[0][y] -= 1
	elif dirs[0] == 'R':
		end[0][x] += 1
	elif dirs[0] == 'L':
		end[0][x] -= 1

	for i in range(1, len(dirs)):
		start[i] = end[i-1]

		if dirs[i] == 'U':
			end[i][x] = start[i][x]
			if -5 <= start[i][y] + 1 <= 5:
				end[i][y] = start[i][y] + 1
			else:
				end[i][y] = start[i][y]
				continue

		elif dirs[i] == 'D':
			end[i][x] = start[i][x]
			if -5 <= start[i][y] - 1 <= 5:
				end[i][y] = start[i][y] - 1
			else:
				end[i][y] = start[i][y]
				continue

		elif dirs[i] == 'R':
			end[i][y] = start[i][y]
			if -5 <= start[i][x] + 1 <= 5:
				end[i][x] = start[i][x] + 1
			else:
				end[i][x] = start[i][x]
				continue
			
		elif dirs[i] == 'L':
			end[i][y] = start[i][y]
			if -5 <= start[i][x] - 1 <= 5:
				end[i][x] = start[i][x] - 1
			else:
				end[i][x] = start[i][x]
				continue

		if check(i, start, end):
			answer += 1
	return answer

dirs = "RUDDLUURD"
print(solution(dirs))
```

개인적으로 좀 난해했던 문제였는데 풀고나서 다른 사람 코드를 볼 수 있다는게 가장 좋은 부분 같다.

나는 이렇게 풀었는데 다른사람들은 어떻게 풀었나 보면서 배워가는게 정말 많다.