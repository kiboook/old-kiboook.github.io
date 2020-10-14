---
title:  "[Programmers] 트리 트리오 중간값"
excerpt: ""

categories:
  - Quiz

tags:
---

## 트리 트리오 중간값

<a href="https://programmers.co.kr/learn/courses/30/lessons/68937" style="color:#0FA678" target="_blank">트리 트리오 중간값</a> 을 클릭하면 바로 이동한다.

**프로그래머스 월간 코드 챌린지 시즌 1** 문제인데 트리의 지름 개념만 알고 있었다면 풀 수 있었던 문제였다.

그래서 시험이 끝나고 나서 따로 <a href="https://nam-ki-bok.github.io/baekjoon/Baek_TreeDiameter/" style="color:#0FA678">[BaekJoon] 백준 1167번 : 트리의 지름</a> 문제를 풀어보았다..

오늘 프로그래머스에 문제가 올라와 풀어봤는데 다행히 맞았다.

<center><img width="675" alt="스크린샷 2020-10-14 오후 8 01 19" src="https://user-images.githubusercontent.com/54533309/95980372-0775be80-0e58-11eb-87f6-adde7b3b4e09.png">
</center>

<br>

노드 a, b, c 를 골라 **dist(a, b), dist(b, c), dist(c, a)** 의 중간값을 구하고 가능한 중간값들 중 최댓값을 반환하는 문제이다.

내가 생각한 알고리즘은 **가장 멀리 있는 점 중 한 개를 지우고 다음으로 가장 멀리 있는 점의 거리를 반환**하면 된다.

이 때 트리의 지름을 활용하면 되는데 BFS를 두 번 실행해서 답을 구할 수 있다.

마지막에 값을 반환할 때 가장 멀리 있는 점이 두 개 이상인 경우와 한 개인 경우만 구분해서 반환하면 된다.

---

```python
from collections import deque


def BFS(graph, start):
    dist = []
    queue = deque([[start, 0]])
    visit = {start: 1}

    while queue:
        cur_node, cur_dist = queue.popleft()
        dist.append([cur_node, cur_dist])

        for val in graph[cur_node]:
            if val not in visit:
                queue.append([val, cur_dist + 1])
                visit[val] = 1
    return dist


def solution(n, edges):
    graph = {i + 1: [] for i in range(n)}
    for cur in edges:
        graph[cur[0]].append(cur[1])
        graph[cur[1]].append(cur[0])

    start = BFS(graph, 1)
    end = BFS(graph, start[-1][0])

    if start[-2][1] == start[-1][1]:
        return end[-1][1]
    else:
        return end[-2][1]
```

<br>