---
title:  "[Programmers] H-Index"
excerpt: ""

categories:
  - Quiz

tags:


---

## H-Index

<a href="https://programmers.co.kr/learn/courses/30/lessons/42747" style="color:#0FA678" target="_blank">H-Index</a> 를 클릭하면 바로 이동한다.

H-Index 란 간단히 말하면 n회 이상 인용 된 논문이 n개 이상일 때, n 의 최대값이다.

<a href="https://ko.wikipedia.org/wiki/H_지수" style="color:#0FA678" target="_blank">위키백과</a> 를 클릭하면 더 자세한 설명을 볼 수 있다.

프로그래머스에 나와있는 설명은 보지 않는 것을 추천한다.

너무 애매하고 헷갈리게 설명을 써두었다.

심지어 오답 코드도 정답 코드로 통과가 되니 조심하도록 하자

밑의 코드는 오답 코드이지만 정답 코드로 통과 되는 코드이다.

```python
def solution(citation):
    H_Index = 0
    sort_citation = set(sorted(citation, reverse=True))

    while sort_citation:
        citation_cnt = 0
        citation_num = sort_citation.pop()

        for val in citation:
            if val >= citation_num:
                citation_cnt += 1

        if citation_cnt <= citation_num:
            if H_Index < citation_cnt:
                H_Index = citation_cnt

    return H_Index
```

위 코드에서 13번 째 줄의 if 문을 본다면 H-Index 의 정반대로 실행이 된다.

n회 이상 인용 된 논문이 n개 이하일 때 H-Index 를 갱신한다.

[3, 3, 3, 3] 이 주어진다면 H-Index는 4가 되어야 하는데 결과는 0이 된다.

또 [0, 1, 3, 5, 5, 5, 5, 5, 5, 6] 이 주어진 경우 return 값은 5가 되어야 하는데 1이 나온다.

이렇게 조금 부실한 문제인 것 같으니 얼른 풀고 넘어가자 !!

---

```python
def solution(citation):
	h = 0
	for citation_num in range(max(citation) + 1):
		cnt = 0

		for val in citation:
			if citation_num <= val:
				cnt += 1

		if citation_num <= cnt:
			h = citation_num

	return h
```

앞서 작성 한 오류가 있는 코드는 인용 횟수인 n 을 1부터 citation의 max 값 까지 확인을 하지 않고

citation에 있는 인용 횟수만 검사를 한다.

위 코드는 인용 횟수를 0 부터 citation의 max 값 까지 모두 검사를 한다.