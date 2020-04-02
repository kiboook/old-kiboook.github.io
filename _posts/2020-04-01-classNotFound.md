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

  

  

