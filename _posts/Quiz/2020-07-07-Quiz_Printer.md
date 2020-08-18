---
title:  "[Programmers] 프린터"
excerpt: ""

categories:
  - Quiz

tags:

---

## 프린터

<a href="https://programmers.co.kr/learn/courses/30/lessons/42587" style="color:#0FA678" target="_blank">프린터</a> 를 클릭하면 바로 이동한다.

엄청 반가운 문제였다!! 왜냐하면 1년 전 쯤에 백준에서 풀었던 문제였기 때문이다.

그때는 전부 C 로 풀고있었는데 파이썬으로 풀면서 새삼 편하다는걸 또 느꼈다..

당시에 풀었던 코드를 봤는데 큐 만들고.. 팝 만들고.. 포인터 쓰고.. 쌩 난리를 부리고 있었다.

나는 find_loc 리스트를 따로 만들어 priorities 리스트와 같이 관리를 했다.

```python
def solution(priorities, location):
    find_loc = [i for i in range(len(priorities))]
    print_cnt = 0

    while(True):
        if priorities[0] != max(priorities):  # 나보다 우선순위 높은게 있다 ?
            item = priorities.pop(0)
            priorities.append(item)

            item = find_loc.pop(0)
            find_loc.append(item)
        else:  # 내가 우선순위가 제일 높다 ?
            priorities.pop(0)
            print_cnt += 1

            if find_loc.pop(0) == location:
                return print_cnt
```

알고리즘은 문제에서 주어진 그대로 나보다 우선순위가 높은게 있다면 pop 해서 다시 append 해주고

내가 우선순위가 제일 높다면 pop 만 한 후 이게 내가 원하는 문서인지 확인을 해주었다.

구조만 보면 queue 와 똑같다. 맨 앞에서 빼고 맨 뒤로 넣어주니까!

그런데 python 에서 이미 queue 와 우선순위큐 등등 자료구조를 라이브러리로 지원을 해주고 있었다.

다음에 문제 풀 때 사용해봐야겠다.