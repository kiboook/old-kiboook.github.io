---
title: "[BaekJoon] 백준 2669번 : 직사각형 네개의 합집합의 면적 구하기"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2669번 : 직사각형 네개의 합집합의 면적 구하기

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/105134215-615de280-5b31-11eb-9e85-1832b24933d7.png">
</center>

<br>

한 번 방문한 적이 있는 좌표는 면적 계산에서 제외하면 된다.

visit 배열을 이용해 해당 인덱스의 값을 방문한 경우 1로 바꾸어 주면 된다.

그렇게 되면 여러 번 방문을 해도 어차피 1 이기 때문에 계산할 수 있다.

처음엔 visit 리스트를 이용해 방문 좌표 자체를 다루었는데 배열을 사용하면 시간 단축이 훨씬 많이 된다.

---

```python
if __name__ == '__main__':
	area = 0
	visit = [[0] * 101 for _ in range(101)]
	data = [list(map(int, input().rsplit())) for _ in range(4)]

	for square_coord in data:
		left_x, left_y, right_x, right_y = square_coord

		for x in range(left_x, right_x):
			for y in range(left_y, right_y):
				visit[x][y] = 1

	print(sum(sum(visit, [])))
```

<br>