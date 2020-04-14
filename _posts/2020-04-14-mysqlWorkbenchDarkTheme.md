---
title:  "[How To] Mac에서 MySQL Workbench 다크모드 해제하기"
excerpt: ""

categories:
  - How To

tags:
  - MySQL
  - workbench
---

- ## Dark 모드 해제하기

  맥을 다크모드로 설정 한 경우 workbench도 다크모드로 변경이 된다.

  하지만 뭔가 굉장히 어색하고 이상한 다크모드로 바뀌게 된다.

  ![](https://nam-ki-bok.github.io/assets/images/howto/workbench1.png)

  다크모드인데 syntax 색이 회색이다.. 아무런 구분이 가지 않는다.

  또 Table을 보면 흰색 선이 굉장히 눈이 아프다.

  syntax 정도는 code_editor 파일을 수정해 색깔을 바꿀 수 있지만
  
  밑에 Table은 용납할 수 없다..
  
  이리저리 구글링 해본결과 답은 workbench만 Light mode로 되돌리는 방법이 최선이라고 한다.
  
  터미널을 열고
  
  `defaults write com.oracle.workbench.MySQLWorkbench NSRequiresAquaSystemAppearance -bool yes`
  
  해당 명령을 입력하자
  
  그리고 재접속을 하면
  
  ![](https://nam-ki-bok.github.io/assets/images/howto/workbench2.png)
  
  쨍 한 흰색이 아니고 밝은 회색 느낌이라 다른 프로그램의 라이트 모드보다 훨씬 보기 편하다.
