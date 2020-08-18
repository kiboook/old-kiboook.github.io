---
title:  "[Programmers] 가장 큰 정사각형 찾기"
excerpt: ""

categories:
  - Quiz

tags:
---

## 가장 큰 정사각형 찾기

<a href="https://programmers.co.kr/learn/courses/30/lessons/12905" style="color:#0FA678" target="_blank">가장 큰 정사각형 찾기</a> 를 클릭하면 바로 이동한다.

가로 * 세로 1000 이하의 배열이 주어질때 1로 이루어진 정사각형의 최대 크기를 구하는 문제이다.

처음엔 크기별로 정사각형을 찾아 최대값을 반환해보려고 했으나 당연히 효율성에서 떨어질 것 같아 포기했다.

다음으로는 연속 된 1이 있는 index 를 가져와 겹치는 부분을 통해 찾아보려고 했으나 제약사항이 너무 많아 또 포기했다..

정말 아무리 생각해도 답이 안나와 검색을 해보았는데 DP 로 풀어야 하는 문제였다..

학교에서 알고리즘 배울 때 잠깐 맛보고 지나갔었던 DP 여서 정말 당황했다.

테스트를 볼때 DP로 풀어야 겠다는 생각과 그 이후에 해결 방법을 찾아낼 수 있을까 ?

많은 문제를 풀어보면서 비슷한 유형을 익혀야겠다..

---

값이 1인 좌표를 기준으로 좌상단, 상단, 좌측 값 중 최솟값에다가 1을 더해 기준 좌표에 대입해주면 된다.

최솟값이 0 인 경우는 정사각형을 만들 수 없으므로 1이 대입되고

최솟값이 1 인 경우는 기준 좌표를 포함해 길이가 2 인 정사각형을 만들 수 있기 때문에 2 가 대입된다.

마찬가지로 최솟값이 2 인 경우는 주위에 길이가 2 인 정사각형이 있다는 의미로

기준 좌표를 포함해 길이가 3 인 정사각형을 만들 수 있기 때문에 3 이 대입된다.

```python
def solution(board):
	answer = 0

	if len(board) == 1 or len(board[0]) == 1:
		return 1

	for i in range(1, len(board)):
		for j in range(1, len(board[0])):
			left = board[i][j - 1]
			up = board[i - 1][j]
			left_up = board[i - 1][j - 1]

			if board[i][j] == 1:
				board[i][j] = min(left, up, left_up) + 1
				answer = max(answer, board[i][j])

	return answer ** 2
```

이 문제를 풀면서 느낀점은.. 정말 아이큐 높고 똑똑하고 창의력 넘치는 사람들이 코딩 테스트를 잘 볼 것 같다..

