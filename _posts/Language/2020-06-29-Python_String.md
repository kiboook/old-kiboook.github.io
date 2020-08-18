---
title:  "[Python] String 과 zip 사용"
excerpt: ""

categories:
  - Python

tags:
---

## String

파이썬에는 String 을 다루는 아주아주 많은 함수가 있다.

이 중에서 <a href="https://nam-ki-bok.github.io/quiz/Quiz_SecretMap/" style="color:#0FA678" target="_blank">[Programmers] 비밀지도</a> 를 풀다가 알게 된 몇 가지 함수를 정리해보려고 한다.

미리 알았더라면 아주아주 간단하고 쉽게 풀 수 있었던 문제였다.

1. rjust

   지정된 길이와 부족한 부분을 어떤 문자로 채울지 정해주면 된다.

   ```python
   str = 'TEST'
   str = str.rjust(10,'0')
   print(str)
   
   # 000000TEST
   ```

   마찬가지로 ljust 함수를 사용하면 부족한 부분을 오른쪽에서 부터 채워준다.

   

2. replace

   치환 해주고 싶은 문자를 지정해주면 String 에서 해당 문자를 치환해준다.

   ```python
   str = '110101'
   str = str.replace('1', '^')
   str = str.replace('0', ' ')
   print(str)
   
   # ^^ ^ ^
   ```

   이 두 가지 기능만 알고있었다면 앞서 말했던 문제를 아주아주 쉽게 풀 수 있었다..

   

3. zip

   이번에는 for 문에서 zip 을 이용하는 방법에 대해 정리해 보겠다.

   같은 길이의 배열 여러개를 동시에 순회하고 싶은 경우 zip 을 사용하면 편하다.

   ```python
   arr1 = [9, 20, 28, 18, 11]
   
   for i,j in zip(range(len(arr1)), arr1):
   	print(i, j)
   ```

   이렇게 된다면 i 는 index 를 j 는 배열의 값을 출력한다.

   물론 하나의 인자로 순회를 해도 되지만 다른 여러 경우에도 자주 쓰이고 특히 코드가 아주 깔끔해진다.

## 정리

위 세 가지 함수만 알고 있었더라면 정말 쉽게 풀 수 있었던 문제이다.

rjust 함수는 조금 생소하다고 하더라도 replace 함수는 알고 있어야 할 함수였다.

매일 문제를 풀어온지 얼마 안됐으니까 다음에 문제를 풀때는 이러한 함수를 꼭 기억하고 사용할 수 있도록 해야겠다.

