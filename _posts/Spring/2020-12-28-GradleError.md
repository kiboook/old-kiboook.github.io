---
title:  "[Spring] Gradle - No candidates found for method call plugins 오류 해결"
excerpt: ""

categories:
  - Spring

tags:
---

##  🖍 No candidates found for method call plugin 오류

<img width="763" alt="Gradle_ext_오류" src="https://user-images.githubusercontent.com/54533309/103205088-20145180-493c-11eb-8aba-8359f016cb7f.png">

처음 스프링부트를 접하기 위해 Gradle 셋팅을 하던 도중.. **springBootVersion** 전역변수 설정에서 오류가 발생했다.

classpath 에서 springBootVersion 변수를 찾지 못해 No candidates found for method call plugin 오류가 발생한 것이다.

**스프링 부트와 AWS로 혼자 구현하는 웹 서비스** 코드 그대로 했는데 오류가 발생해 정말 당황했다..

구글링을 해보니 두 가지 해결방법이 있었다.

<br>

첫 번째 해결방법은 **Shift + command + a** 를 누른 뒤 검색창에 **Reload All Gradle Projects** 를 검색한다.

<img width="550" alt="Gradle_오류해결" src="https://user-images.githubusercontent.com/54533309/103205913-007e2880-493e-11eb-8f63-9ce7b814e202.png">

모든 Gradle 프로젝트를 한 번 리로드 하면 해결 된다.

두 번째 해결방법은 **인텔리제이를 재부팅** 하면 해결 된다..

<br>