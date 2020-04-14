---
title:  "[How To] classNotFoundException 오류 해결"
excerpt: ""

categories:
  - How To

tags:
  - Eclipse
  - classNotFoundException
---

- ## classNotFoundException 오류

  데이터베이스 연동 실습을 하던 도중 classNotFoundException 오류가 생겼다.

  그런데 이 오류가 생겼지만 ?

  데이터베이스 연동 후 출력까지 다 됐다.

  <br>

  <img src="https://nam-ki-bok.github.io/assets/images/eclipse/class1.png" style="zoom:50%;" />

  굉장히 굉장히 찝찝한 상황이다..

  에러는 나오는데  실행은 또 잘된다..

  하지만 부분적으로 실행이 안되는 곳이 있었다.

  <br>

  ```java
  try { /* 드라이버를 찾는 과정 */
  			 Class.forName("com.mysql.cj.jdbc.Driver");
  			System.out.println("드라이버 로드 성공");
  		} catch (ClassNotFoundException e) {
  			e.printStackTrace();
  		}
  ```

  연동 코드 일부분이다.

  위에 실행 결과를 보면 알겠지만 **"드라이버 로드 성공"** 출력이 되지 않았다.

  그래서 열심히 구글 검색을 해본 결과 일단 Class.forName에 에러가 많다고 한다.

  참조해야 할 jar 파일이 없는경우 생긴다고 하는데 나는 커넥터 까지 전부 연결 되어있었다.

  그렇게 계속 검색을 하던중 다른 사람들과 나의 Class.forName 안에 인자가 조금 다른게 보였다.

  <br>

  ```java
  try { /* 드라이버를 찾는 과정 */
  			 Class.forName("com.mysql.jdbc.Driver");
  			System.out.println("드라이버 로드 성공");
  		} catch (ClassNotFoundException e) {
  			e.printStackTrace();
  		}
  ```

  무엇이 바뀌었는지 알겠는가 ?!?!

  **"com.mysql.cj.jdbc.Driver"** 에서 **"com.mysql.jdbc.Driver"** 로 바뀌었다.

  **.cj** 가 사라진 것이다. 그리고 실행 해 보니 드라이버 로드 성공도 출력되고 아주 정상적으로 작동했다.

- ## 결론

  아직 이유는 모른다.

  데이터베이스 연동 실습을 하던 도중 내가 공부하는 책에서 주어진 코드를 가지고 그대로 실습 했기 때문이다.

  일단 해결은 했으니 실습은 이어가겠지만

  얼른 이유를 알아서 채워 넣겠다 !

- ## 추가 <span style="font-size: 15px">20.04.14</span>

  무려 2주만에 이유를 알게 되었다.

  윈도우를 사용 중인 데스크탑에도 데이터베이스 개발 환경을 구축을 해놓았다.

  그런데 위 코드를 데스크탑에서 실행 해 본 결과

  **Class.forName("com.mysql.cj.jdbc.Driver");** 를 사용해야지 오류가 발생하지 않았다.

  그래서 처음엔 단순히 OS 차이인줄 알았다.

  맥북에선 cj를 빼야 정상적으로 돌아갔으니까 !

  그런데 아무리 생각해도 OS 차이 때문에 발생한 오류라면

  서로 다른 OS를 사용하는 사람 끼리 같이 개발을 하는 경우 저 코드를 일일히 바꿔줘야 한다는 뜻이 된다.

  절대 말이 안된다고 생각해 구글링 해 본 결과..

  굉장히 허무했다 그냥 JDBC 버전 차이였다.

  처음 JDBC 연동 할 때도 구글링을 통해 연동했는데 아주 옛날 글을 보고 했는가보다..

  맥에는 connector 5 버전이 깔려있었다.. 지금은 8 버전인데 말이다 !

  그래서 8 버전으로 업그레이드 해주니 바로 해결되었다.

  **Class.forName("com.mysql.cj.jdbc.Driver");** .cj를 붙여주자 !

  추가로 특정 자바 버전 이상에서는 Class.forName을 사용하지 않아도 자동으로 연결해준다는데

  그건 나중에..

  

  

  

  

