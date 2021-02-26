---
title:  "[Programmers] 베스트앨범"
excerpt: ""

categories:
  - Quiz

tags:

---

## 베스트앨범

<a href="https://programmers.co.kr/learn/courses/30/lessons/42579#" style="color:#0FA678" target="_blank">베스트앨범</a> 을 클릭하면 바로 이동한다.

**genres = ["classic", "pop", "classic", "classic", "classic", "pop", "salsa"]**

**plays = [500, 600, 150, 800, 500, 2500, 2000]**

```python
{
  'pop': [
    3100,
    [
      [1, 600],
      [5, 2500]
    ]
  ],
  'salsa': [
    2000,
    [
      [6, 2000]
    ]
  ],
  'classic': [
    1950,
    [
      [2, 150],
      [4, 500],
      [0, 500],
      [3, 800]
    ]
  ]
}
```

이러한 예시가 주어진다면 각 장르를 키로 하는 사전을 만든다.

키에 대한 값은 장르별 총 재생 횟수와 장르에 대한 곡 정보를 담는다.

이때 곡 정보는 먼저 재생 횟수에 대해 오름차순으로 정렬을 하고 고유 번호에 대해 내림차순으로 정렬을 한다.

이 사전을 가지고 재생 횟수가 가장 많은 장르부터 차례로 곡을 두 개씩 뽑아오면 된다.

**[5, 1, 6, 3, 0]** 이 된다.

---

```python
def solution(genres, plays):
	answer = []
	_dict = {i: [0, []] for i in set(genres)}

	for idx, song in enumerate(zip(genres, plays)):
		genre, play = song
		_dict[genre][0] += play
		_dict[genre][1].append([idx, play])

	for genre in _dict:
		# 재생횟수로 오름차순 정렬 후 고유 번호로 내림차순 정렬
		_dict[genre][1] = sorted(_dict[genre][1], key=lambda x: (x[1], -x[0]))

	song_list = []
	for genre in _dict:
		song_list.append([_dict[genre][0], genre])
	
	# 주어진 조건에 맞게 곡 선정
	song_list = sorted(song_list, reverse=True)
	for info in song_list:
		genre = info[1]
		pop_cnt = 0
		while _dict[genre][1]:
			answer.append(_dict[genre][1].pop()[0])
			pop_cnt += 1
			if pop_cnt == 2:
				break

	return answer
```
