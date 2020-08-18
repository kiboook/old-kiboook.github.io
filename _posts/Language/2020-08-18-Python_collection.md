---
title:  "[Python] collection"
excerpt: ""

categories:
  - Python

tags:
---

## Python collection

문제를 풀다 모르는게 있어 collection 을 검색해봤는데 이미 검색을 해본 개념이었다..

그래서 이제 모르는게 생기고 검색을 해서 알게되면 꼭 정리를 해야겠다고 마음 먹었다.

collection 은 여러 자료형에 있는 데이터 개수를 세어 dict 형태로 반환을 해주는 모듈이다.

## list

```python
import collections


_list = [1, 1, 2, 2, 2, 2, 3, 3, 4, 5, 6, 6, 7]

print(collections.Counter(_list))
#  Counter({2: 4, 1: 2, 3: 2, 6: 2, 4: 1, 5: 1, 7: 1})
```

다음과 같이 리스트에 있는 데이터 개수를 세주기도 하고

## str

```python
import collections


_str = 'aabbbccdd111223'
print(collections.Counter(_str))
#  Counter({'b': 3, '1': 3, 'a': 2, 'c': 2, 'd': 2, '2': 2, '3': 1})
```

문자열에 있는 문자 개수도 세준다.

## dict

```python
import collections


_dict = {'가': 1, '나': 3, '다': 2}
print(collections.Counter(_dict))
#  Counter({'나': 3, '다': 2, '가': 1})
```

dict 를 넣으면 value 값이 큰 순서대로 정렬을 해준다.

## 다양한 연산

```python
import collections


cnt_a = collections.Counter('aabbcc')
cnt_b = collections.Counter('ccddee')
print(cnt_a + cnt_b)  #  Counter({'c': 4, 'a': 2, 'b': 2, 'd': 2, 'e': 2})
print(cnt_a - cnt_b)  #  Counter({'a': 2, 'b': 2})
print(cnt_a & cnt_b)  #  Counter({'c': 2})
print(cnt_a | cnt_b)  #  Counter({'a': 2, 'b': 2, 'c': 2, 'd': 2, 'e': 2})
```

다양한 연산도 가능하다. 뺄셈의 경우 음수가 생기면 출력하지 않는다. **cnt_a - cnt_b** 를 했기 때문에 d, e 는 -2 가 되어 출력되지 않는다.

교집합과 합집합도 연산이 가능하다.

---

```python
import collections


cnt_a = collections.Counter('aabbcc')
cnt_b = collections.Counter('ccddee')
cnt_a.subtract(cnt_b)
print(cnt_a)  #  Counter({'a': 2, 'b': 2, 'c': 0, 'd': -2, 'e': -2})
```

앞서 뺄셈의 경우 음수가 생기면 출력하지 않지만 **subtract** 를 사용하면 음수 값도 출력이 가능하다.