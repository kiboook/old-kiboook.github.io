---
title:  "[Python] Crawling 환경 구축 "
excerpt: ""

categories:
  - Python

tags:
  - Crawling
---

## Crawling

5월 즈음 부터 시작 할 프로젝트에 있어서 먼저 크롤링에 대해 공부 해보기로 하였다.

크롤링이란 무엇일까? 간단하게 말하자면 웹 페이지에 있는 수 많은 정보중 내가 원하는 정보를 가져오는 것이다.

예전부터 이야기만 들어봤는데 내가 직접 해보려고 하니 엄청 기대됐다!!!

크롤링을 하기 위해선 파이썬이 가장 괜찮다 그래서 정말 오랜만에 파이썬을 접했다.

1학년 때 한 학기 잠깐 배우고 3학년이 될 때까지 한 번도 사용하지를 않아서 백지인 상태라고 봐도 무방했다.

그래서 우선 파이썬으로 개발 할 수있게 개발 환경을 구축했다.

## 파이썬 개발 환경 구축

맥에는 기본적으로 파이썬이 설치 되어있는데 버전이 낮다.

<code style="background-color:gray; color: white">python --version</code> 을 입력해 보면 파이썬 버전이 2.7.16으로 되어있다.

그러니 얼른 Python3을 설치해주도록 하자.

brew가 설치 되어있다는 전제 하에 구축 과정을 설명해보겠다 !

<code style="background-color:gray; color: white">curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py</code> 

<code style="background-color:gray; color: white">$sudo python3 get-pip.py</code> 

<code style="background-color:gray; color: white">$sudo easy_install pip </code>

상기 명령까지 실행을 했다면 Python3 설치가 완료 되었다.

이제 크롤링에 필요한 라이브러리를 설치 해야하는데 그냥 pip 명령을 통해 설치하면

이 라이브러리가 python 2.7.16 버전이랑 연결이 되어버려 골치가 아팠다.

구글링 해본 결과 pip3 을 통해 설치하면 바로 Python3 이랑 연결이 된다고 한다.

<code style="background-color:gray; color: white">$pip3 install beautifulsoup4</code>

<code style="background-color:gray; color: white">$pip3 install requests</code>

전부 설치가 완료 되었다면 <code style="background-color:gray; color: white">$pip list</code> 를 통해 확인해보자.

