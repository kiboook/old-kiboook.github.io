---
title:  "[Falling Grade]"
excerpt: ""

categories:
  - FallingGrade

tags:
  - Java
  - Eclipse
---

# Falling Grade

본 프로젝트는 2019년 2학년 2학기 Java Programming 팀 프로젝트 이다.

***



![](https://nam-ki-bok.github.io/KibokWebPortfolio/images/FallingGrade/XD_image.png)

## 개요

자바 수업을 수강하면서 게임 만들기가 마지막 팀 프로젝트로 주어졌다.

총알피하기, 리듬게임 같은 고전 게임의 개념을 응용하기로 했다.

여기서 총알 피하기의 피하는 개념, 리듬게임에서 내려오는 노트를 맞추는 개념을 합쳤다.

그리고 우리에게 친근하게 다가 올 수 있는 주제인 학점을 더해

위에서 떨어지는 학점을 얻는 게임을 만들기로 했다.

그렇다면 상대적으로 낮은 학점은 총알 피하기 처럼 피하려고 할 것 이고

높은 학점은 리듬게임 처럼 맞추려고 할 것 이다.

바로 어릴때 자주 하던 똥 피하기 게임과 학점을 합쳐 위에서 떨어지는 학점을 먹는 게임을 만들기로 했다.

## 화면 구성

시작삽입

캐릭터선택 삽입

난이도삽입

## 게임 화면 구성

- 게임 구성에 필요한 모든 이미지, 버튼 생성
- 각각의 화면을 표시할 변수 설정
- If문, 변수, setVisible 메소드를 통해 상황에 맞는 버튼, 이미지 출력

## 게임 구동

- 난이도 별 학점 생성 빈도 수 조절
- 랜덤 생성 값에 따른 학점 종류 조절
- 랜덤 하강 값에 따른 학점 하강 속도 부여
- 캐릭터 이미지와 학점 이미지 좌표 계산을 통한 점수 계산
- KeyAdapter 클래스를 이용한 캐릭터 이동
- Thread 를 통한 학점, 캐릭터 repaint

## 게임 결과 산출

- Static 변수를 통한 게임 결과 계산

- 캐릭터와 학점이 접촉 시 학점의 생성 값으로 점수 부여

- double 값으로 계산 후 String.format 메소드를 통해 소수점 2자리 까지 출력

  

<video width="640" height="360" controls>
   <source src="https://nam-ki-bok.github.io/KibokWebPortfolio/images/FallingGrade/FallingGradeInGame.mp4" type="video/mp4">
</video>

<img src="https://nam-ki-bok.github.io/assets/images/toy_project/GPA_16.png" style="zoom:35%;" />