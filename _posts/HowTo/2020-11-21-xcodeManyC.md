---
title:  "[How To] Xcode에서 여러 개의 main.c를 한 프로젝트에 실행하는 방법"
excerpt: ""

categories:
  - How To

tags:
---

## 🛠 여러개의 main.c

윈도우에서 비주얼 스튜디오를 사용 해 코딩을 하면 여러 개의 c 파일을 컴파일 해야 하는 경우가 있었다.

백준 문제를 푼다던가.. 학교 실습 문제를 푼다던가..

비주얼 스튜디오에서는 컴파일 하고 싶지 않은 파일은 옵션에서 컴파일 제외를 시키면 됐다.

Xcode 로 코딩을 하면서 그래야 하는 경우가 있었는데 방법을 몰라 이번에 찾아보았다.

![image](https://user-images.githubusercontent.com/54533309/99821128-fb86c600-2b94-11eb-8139-7f91d8283d67.png)

먼저 프로젝트를 누른 다음 화살표 쪽을 보면 + 버튼이 있다.

<br>

<img width="728" alt="스크린샷 2020-11-21 오전 1 01 43" src="https://user-images.githubusercontent.com/54533309/99821232-207b3900-2b95-11eb-86d2-47bce3832e33.png">

그리고 Command Line Tool 을 선택 한 뒤 main2 products 를 만들게 되면

<br>

![image](https://user-images.githubusercontent.com/54533309/99822173-39381e80-2b96-11eb-8f01-14b95a584fab.png)

main2.c 가 생성 되고 실행 할 때마다 내가 어떤 c 파일을 컴파일 할지 선택하면 된다.

<br>

![image](https://user-images.githubusercontent.com/54533309/99822333-6b498080-2b96-11eb-813b-8264a095df59.png)

이렇게 여러 개의 main.c 파일을 하나의 프로젝트에 넣어 관리 할 수 있다.