---
title:  "[How To] gitignore 설정 방법"
excerpt: ""

categories:
  - How To

tags:
---

## 🔥 gitignore 설정 방법

열심히 자바 프로젝트를 한뒤.. 깃허브에 커밋을 하고 보니 레파지토리에 이상한 파일이 덕지덕지 붙어있는 경우가 있다.

특히 Mac 같은 경우는 **.DS_Store** 파일 까지 같이 커밋되어 굉장히 보기 더럽고 불편하고 신경쓰인다.

이때 **.gitignore** 을 사용하면 내가 원하는 파일만 커밋 할 수 있다.

<center><img width="739" alt="gitignore1" src="https://user-images.githubusercontent.com/54533309/92128450-600b7200-ee3d-11ea-95a5-79d7c4a5621f.png"></center>

<br>

우선 커밋 할 레파지토리에 들어가 **.git** 을 생성하도록 한다.

그 다음 **.gitignore** 을 생성한다. 파일 명 앞에 .이 붙어있으면 숨김파일이 되므로 **$ ls -a** 를 통해 잘 생성되었나 확인하자.

생성이 되었다면 **$ vi .gitignore** 을 통해 **.gitignore** 파일을 편집하자.

이때 커밋 하지 않을 파일을 정하는 여러가지 규칙이 있는데 <a href="https://www.toptal.com/developers/gitignore" style="color:#0FA678">이곳</a> 에 접속하면 내가 원하는 규칙을 생성 해 준다.

특정 확장자로 끝나는 파일을 제외하고 싶다면 ***.확장자** 디렉토리를 제외하고 싶다면 **디렉토리명/** 을 넣어주면 된다.

<center><img width="666" alt="gitignore.io" src="https://user-images.githubusercontent.com/54533309/92127748-95639000-ee3c-11ea-99bd-6d2e6680bf12.png"></center>

나 같은 경우는 맥, 이클립스, 자바 를 통해 만든 프로젝트를 커밋 할 것이기 때문에 저렇게 설정을 해준다.

생성을 누르면 나오는 결과를 **.gitignore** 에 그대로 복사 붙여넣기 하면 된다.

그리고 remote 설정을 해준 뒤 push 를 하게 되면 깔끔하게 원하는 파일만 커밋 할 수 있다.

<center><img width="917" alt=".classpath, .project" src="https://user-images.githubusercontent.com/54533309/92127579-6a793c00-ee3c-11ea-9436-cb5f68b1aca0.png"></center>

## 🔥 gitignore 을 변경하고 싶은 경우

위 사진을 보면 **.classpath, .project** 파일이 커밋 되어 있다.

아마 <a href="https://www.toptal.com/developers/gitignore" style="color:#0FA678">이곳</a> 에서 만들어준 코드에 .classpath, .project 는 없었나보다.

이때는 먼저 레파지토리의 캐시를 **$ git rm -r --cached .** 을 통해 모두 삭제해준다.

<center><img width="588" alt="git rm -r --cached ." src="https://user-images.githubusercontent.com/54533309/92129960-2176b700-ee3f-11ea-87bb-3a0a56e96a54.png"></center>

그리고 **$ vi .gitignore** 을 통해 .classpath .project 를 추가해준 뒤 저장한다.

이제 **$ git add .** 를 하고 커밋을 해주면 제외 된 것을 볼 수 있다.

<center><img width="912" alt=".classpath .project 제외" src="https://user-images.githubusercontent.com/54533309/92129786-effdeb80-ee3e-11ea-8a28-050cdb600378.png"></center>



## 📕 참조

- <a href="https://velog.io/@aquarius1997/gitignore-%EC%84%A4%EC%A0%95" style="color:#0FA678">gitignore 설정</a>

