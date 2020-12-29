---
title:  "[Spring] 스프링 부트 개발환경 구축"
excerpt: ""

categories:
  - Spring

tags:
---

**[2020.12.28]** 부터 **스프링 부트와 AWS로 혼자 구현하는 웹 서비스** 책을 통해 스프링 공부를 시작했다.

공부한 내용을 글로 정리하려고 한다.

그래야 나중에 다시 찾아보며 공부 할 수 있을테니까 !!

##  ⚙️ Gradle 프로젝트 생성

실습 환경은 IntelliJ, Java 8, Gradle 4.x, Spring Boot 2.1.x 로 한다.

<img width="600" alt="스크린샷 2020-12-29 오후 3 56 41" src="https://user-images.githubusercontent.com/54533309/103264581-74780980-49ee-11eb-9eb1-7316687fbc04.png">

새로운 프로젝트를 누른 뒤 Gradle 프로젝트를 생성 하고 다음을 누르자.

<img width="600" alt="스크린샷 2020-12-29 오후 3 57 54" src="https://user-images.githubusercontent.com/54533309/103264644-9f625d80-49ee-11eb-82da-eec0ab4532a2.png">

그리고 GroupID, ArtifactID 를 입력하면 된다. ArtifactID 는 프로젝트 이름과 똑같이 만들어진다.

GroupID 는 이 프로젝트를 고유하게 식별할 수 있게 해주는 값이다.

다음과 같은 규칙을 적용해 작성하면 된다.

<img src="https://user-images.githubusercontent.com/54533309/103264804-20215980-49ef-11eb-989b-6bfbcfc8179c.png" alt="스크린샷 2020-12-29 오후 4 01 31" style="zoom:70%;" />

스프링 부트에서 패키지를 생성 할 때 이름을 도메인의 역순으로 작성하는 규칙이 있다고 한다.

하지만 나는 아직 어떤 도메인을 사용 할지 모르기 때문에 com.boks 로 해두었다.

생성을 마치고 나면 우리는 Gradle 프로젝트를 생성 한 것이다.

이제 이 프로젝트를 스프링 부트 프로젝트로 바꾸어야 한다.

## 🛎 Gradle 버전 변경

스프링 부트 프로젝트로 변경하기 전에 Gradle 버전을 확인하자.

<img width="240" alt="스크린샷 2020-12-29 오후 4 05 15" src="https://user-images.githubusercontent.com/54533309/103264953-a63da000-49ef-11eb-8f7e-4063dfb128ac.png">

gradle.wrapper 폴더를 열어보면 gradle-wrapper.properties 파일이 있다.

파일을 클릭 하면 내가 사용하는 Gradle 의 버전을 알 수 있다.

이 책의 실습 코드를 따라가려면 Gradle 의 버전이 4.x 이어야 하는데 나는 6.x 였다.

버전을 바꾸고 싶다면 다음과 같이 하면 된다.

터미널을 연 뒤 **$ ./gradlew wrapper --gradle-version 4.10.2** 명령을 실행하면 버전이 바뀐다.

<img width="500" alt="스크린샷 2020-12-29 오후 4 11 29" src="https://user-images.githubusercontent.com/54533309/103265254-85297f00-49f0-11eb-810b-8726232f7dde.png">

저자의 깃허브에는 명령 앞에 ./ 이 빠져있으니 꼭 같이 써주자.

## 🍏 스프링 부트 프로젝트로 변경

Gradle 버전도 실습 환경에 맞추어 바꾸었으니 이제 Gradle 프로젝트를 스프링 부트 프로젝트로 바꾸기만 하면 된다.

먼저 **build.gradle** 파일을 열어보면 자바 개발에 가장 기초적인 설정만 되어있다.

이 파일에 스프링 부트 설정에 필요한 코드를 넣어주면 된다.

<a href="https://start.spring.io/" style="color:#0FA678" target="_blank">스프링 부트 이니셜라이저</a> 를 사용하면 한 번에 만들어주지만 처음이기 때문에 하나하나 코드를 작성해가며 알아보자.

<br>

<img width="700" alt="스크린샷 2020-12-29 오후 4 22 12" src="https://user-images.githubusercontent.com/54533309/103265898-046b8280-49f2-11eb-8728-f4e455763e51.png">

먼저 맨 처음 오는 **buildscript** 는 이 프로젝트의 플러그인 의존성 관리를 하는 코드이다.

**ext** 는 이 파일에서 사용 할 전역변수를 선언 할 때 사용하는데 여기서는 **springBootVersion** 이라는 전역변수를 선언 했다.

**dependencies** 를 보면 **springBootVersion** 전역변수를 이용해

spring-boot-gradle-plugin 의 2.1.9.RELEASE 를 의존성으로 받겠다는 것을 의미한다.

<br>

<img width="400" alt="스크린샷 2020-12-29 오후 4 30 04" src="https://user-images.githubusercontent.com/54533309/103266523-1dc0fe80-49f3-11eb-9206-5da64d8b7070.png">

다음은 앞서 받아온 의존성들을 적용할 것인지 결정하는 코드이다.

특히 마지막 **io.spring.dependency-management** 는 스프링 부트의 의존성들을 관리해주는 플러그인이기 때문에 꼭 넣어야 한다.

<br>

<img width="510" alt="스크린샷 2020-12-29 오후 4 36 15" src="https://user-images.githubusercontent.com/54533309/103266930-fae31a00-49f3-11eb-8078-6a4c065055fc.png">

**repositories** 는 프로젝트에서 사용 할 라이브러리들을 어디서 가져올지 정하는 곳이다.

기본적으로 **mavenCentral** 을 많이 사용하지만 점점 **jcenter** 로 바뀌는 추세라고 한다.

**mavenCentral** 은 내가 만든 라이브러리를 업로드 하기 위한 과정이 굉장히 복잡한 반면

**jcenter** 은 업로드 하기가 쉬울 뿐 만 아니라 **mavenCentral** 에도 자동으로 업로드 해준다고 한다.

마지막으로 **dependencies** 는 프로젝트를 개발하는데 있어서 필요한 라이브러리를 선언하는 곳이다.

이렇게 설정을 하고 나면 스프링 부트 프로젝트를 개발 할 모든 준비가 끝났다.

다음은 **build.gradle** 의 전체 코드이다.

---

```java
buildscript {
    ext {
        springBootVersion = '2.1.9.RELEASE'
    }
    repositories {
        mavenCentral()
        jcenter()
    }
    dependencies {
        classpath("org.springframework.boot:spring-boot-gradle-plugin:${springBootVersion}")
    }
}

apply plugin: 'java'
apply plugin: 'eclipse'
apply plugin: 'org.springframework.boot'
apply plugin: 'io.spring.dependency-management'

group 'com.boks'
version '1.0-SNAPSHOT'
sourceCompatibility = 1.8

repositories {
    mavenCentral()
    jcenter()
}

dependencies {
    compile('org.springframework.boot:spring-boot-starter-web')
    testCompile('org.springframework.boot:spring-boot-starter-test')
}
```

<br>