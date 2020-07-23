---
title:  "[Falling Grade]"
excerpt: ""

toc: true
toc_label: "목차"

categories:
  - FallingGrade

tags:
  - Java
  - Eclipse

---

# Falling Grade

<a href="https://github.com/Nam-Ki-Bok/Falling_Grade" style="color:#0FA678">GitHub</a>

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

- 게임 구성에 필요한 모든 이미지, 버튼 생성
- 각각의 화면을 표시할 변수 설정
- If문, 변수, setVisible 메소드를 통해 상황에 맞는 버튼, 이미지 출력

<img src="https://nam-ki-bok.github.io/assets/images/toy_project/Falling_1.png" style="zoom:35%;" />



<img src="https://nam-ki-bok.github.io/assets/images/toy_project/Falling_2.png" style="zoom:35%;" />

<img src="https://nam-ki-bok.github.io/assets/images/toy_project/Falling_3.png" style="zoom:35%;" />

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

## 중요 메소드

### 난이도에 따라 학점 생성 빈도수를 조절

- Easy : 0.8초 마다 학점 생성

- Normal : 0.5초 마다 학점 생성

- Hard : 0.3초 마다 학점 생성



### 구현원리

- Thread의 Sleep 기능 이용

- Sleep 시간을 넣어주어 난이도에 맞는 빈도 구현

- 학점 객체 생성 &rarr; 움직임 Thread 실행 &rarr; 배열리스트 삽입

```java
// 난이도 별 학점 생성 빈도수 조절 메소드

public void run() {
		while (true) {
			if (Main.GAME_START) {
				if (this.difficulty.equals("EASY")) {
					try {
						Thread.sleep(800); // 0.8초마다
						Grade grade = new Grade(generator.nextInt(22));
						grade.start();
						gradeList.add(grade);
					} catch (InterruptedException e) {
						System.err.println(e.getMessage());
					}
				} else if (this.difficulty.equals("NORMAL")) {
					try {
						Thread.sleep(500); // 0.5초마다
						Grade grade = new Grade(generator.nextInt(22));
						grade.start();
						gradeList.add(grade);
					} catch (InterruptedException e) {
						System.err.println(e.getMessage());
					}
				} else {
					try {
						Thread.sleep(300); // 0.3초마다
						Grade grade = new Grade(generator.nextInt(22));
						grade.start();
						gradeList.add(grade);
					} catch (InterruptedException e) {
						System.err.println(e.getMessage());
					}
				}
			} else {
				interrupt();
				break;
			}
		}
	}
```

---

### 학점 객체 생성 시 랜덤 생성 값 부여

- 생성 값 0 ~ 4 : A+, A &rarr; 확률 23%
- 생성 값 5 ~ 9 : B+, B &rarr; 확률 23%
- 생성 값 10: ~ 12 : C+, C &rarr; 확률 13.5%
- 생성 값 13 ~ 15 : D+, D &rarr; 확률 13.5%
- 생성 값 16 ~ 19 : F &rarr; 확률 18%
- 생성 값 20 ~ 21 : Item &rarr; 확률 9%

### 구현원리

- Random 메소드를 이용, 생성 값 랜덤 생성
- 생성 값에 맞는 학점 이미지 삽입
- 각 학점에 랜덤 하강 값, 랜덤 생성위치 부여

```java
// 학점 이미지 생성 및 랜덤 값 부여 메소드

public Grade(int gradeType) {
		//학점 이미지 생성
		if (gradeType >= 0 && gradeType <= 4) {
			if (gradeType % 2 != 0) {
				gradeImage = new ImageIcon(".\\bin\\Data\\gradeAPlus.png").getImage();
			} else
				gradeImage = new ImageIcon(".\\bin\\Data\\gradeA.png").getImage();

		} else if (gradeType >= 5 && gradeType <= 9) {
			if (gradeType % 2 != 0) {
				gradeImage = new ImageIcon(".\\bin\\Data\\gradeBPlus.png").getImage();
			} else
				gradeImage = new ImageIcon(".\\bin\\Data\\gradeB.png").getImage();
		} else if (gradeType >= 10 && gradeType <= 12) {
			if (gradeType % 2 != 0) {
				gradeImage = new ImageIcon(".\\bin\\Data\\gradeCPlus.png").getImage();
			} else
				gradeImage = new ImageIcon(".\\bin\\Data\\gradeC.png").getImage();
		} else if (gradeType >= 13 && gradeType <= 15) {
			if (gradeType % 2 != 0) {
				gradeImage = new ImageIcon(".\\bin\\Data\\gradeDPlus.png").getImage();
			} else
				gradeImage = new ImageIcon(".\\bin\\Data\\gradeD.png").getImage();
		} else if (gradeType >= 16 && gradeType <= 19) {
			gradeImage = new ImageIcon(".\\bin\\Data\\gradeF.png").getImage();
		} else if (gradeType == 20) {
			gradeImage = new ImageIcon(".\\bin\\Data\\timePlus.png").getImage();
		} else {
			gradeImage = new ImageIcon(".\\bin\\Data\\FMinus.png").getImage();
		}
		this.speed = 2 + generator.nextInt(5);
		this.x = generator.nextInt(1200);
		this.gradeType = gradeType;
	}
```

---

### 게임 종료, 땅에 떨어졌을 경우 학점 하강 멈춤

- ##### 게임 종료

  학점이 계속 떨어지는 경우 결과 산출에 오류 발생

- ##### 땅에 떨어졌을 경우

  움직임 종료 후 배열리스트에서 삭제

### 구현원리

- 학점 하강 여부 변수를 통해 관리
- 학점이 하강 중이 아닐 때 Thread 정지 후 배열리스트에서 삭제

```java
// 게임 종료, 땅에 떨어졌을 경우 학점 하강 멈춤 메소드

public void run() {
		try {
			while (true) {
				drop();
				if (proceeded) {
					if (!Main.GAME_START) { // 떨어지는 학점이 있는 도중에 게임이 종료 된다면 떨어지고 있는 학점도 멈춰야 한다
						interrupt();
						break;
					}
					Thread.sleep(Main.SLEEP_TIME);
				} else {
					interrupt();
					break;
				}
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
```

## 플레이 영상

<video width="640" height="360" controls>
   <source src="https://nam-ki-bok.github.io/KibokWebPortfolio/images/FallingGrade/FallingGradeInGame.mp4" type="video/mp4">
</video>