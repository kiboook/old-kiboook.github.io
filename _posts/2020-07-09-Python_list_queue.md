---
title:  "[Python] List VS Queue"
excerpt: ""

categories:
  - Python

tags:
---

<a href="https://nam-ki-bok.github.io/quiz/Quiz_Dispatch/" style="color:#0FA678">[Programmers] 기능개발</a> 문제를 풀면서 큐를 사용했다.

List 로 만들고 pop(0) 으로 구현을 했는데 문득 의문이 들었다.

List 에 append, pop 기능이 다 있는데 왜 collections 모듈에 deque 모듈이 있는 것 일까?

검색을 해보던 중 반성 또 반성을 하게 되었다..

자료구조 시간에 분명히 배웠다.. 빅오! 작업을 하는데 걸리는 시간..

당연히 List 로 만들고 pop(0) 을 한다면 뒤에 있는 데이터들의 인덱스를 앞으로 전부 당겨줘야 한다.

겉으로는 O(1) 같아 보이지만 속으로는 O(n) 의 시간이 걸리는 것 이다.

그래서 시간 비교를 한 번 해봤다.

```python
import time
from collections import deque

''' 
    리스트로 구현 한 큐와 큐를 사용해 시간을 비교 한다.
    1. 리스트에 append 를 한 시간
    2. 큐에 append 를 한 시간
    3. 리스트에 pop(0) 을 한 시간
    4. 리스트를 뒤집어 pop() 을 한 시간
    5. 큐에 popleft() 를 한 시간
'''

size = 1000000

start_time = time.time()
_list = []
for i in range(size):
    _list.append(i)
print('리스트에 append 를 한 시간 : {}'.format(time.time() - start_time))

start_time = time.time()
_deque = deque()
for i in range(size):
    _deque.append(i)
print('큐에 append 를 한 시간 : {}'.format(time.time() - start_time))

print('-----------------------------------------------------------------')

start_time = time.time()
for i in range(size):
    _list.pop(0)
print('리스트에 pop(0) 을 한 시간 : {}'.format(time.time() - start_time))

for i in range(size):
    _list.append(i)

start_time = time.time()
_list_rev = _list[::-1]
for i in range(size):
    _list_rev.pop()
print('리스트를 뒤집어 pop() 을 한 시간 : {}'.format(time.time() - start_time))

start_time = time.time()
for i in range(size):
    _deque.popleft()
print('큐에 popleft 를 한 시간 : {}'.format(time.time() - start_time))
```

결과는 어떻게 됐을까 ? 백만개의 데이터를 가지고 측정을 해봤다.

<img src="https://nam-ki-bok.github.io/assets/images/language/p_1.png" style="zoom:70%;" />

append 는 괜찮지만 pop에서 어마 무시한 속도 차이가 발생한다..

리스트를 뒤집어 pop() 하는 경우도 큐를 사용한 경우와 그렇게 심한 차이는 나지 않는다.

그렇다고 큐를 사용 할 때마다 리스트로 뒤집어서 사용 할 것은 아니기 때문에 의미는 없다!

시기 적절하게 큐와 리스트를 사용 하도록 하자..