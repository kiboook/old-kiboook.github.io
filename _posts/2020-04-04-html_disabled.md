---
title:  "[HTML] input속성 disabled와 readonly의 차이점"
excerpt: ""

categories:
  - HTML

tags:
  - form
  - disabled
  - readonly
---

- ## disabled VS readonly

  HTML 중 form 태그가 있다.

  서버에 특정 데이터를 넘길때 사용 하는 태그인데

  여기서 input 태그를 사용해 데이터를 입력받는다.

  이때 disabled와 readonly 속성이 있는데 둘의 차이점을 알아보자.

  

  #### disabled

  ```html
<form action="">
    <label for="fname">성</label><br>
  <input type="text" id="fname" name="fname" value="홍" disabled><br>
    <label for="lname">이름</label><br>
    <input type="text" id="lname" name="lname" value="길동"><br><br>
    <input type="submit" value="Submit">
  </form>
  
  ```
  
  '홍' 값은 변경 할 수 없다.
  
  
  
  #### readonly
  
  ```html
  <form action="">
    <label for="fname">성</label><br>
    <input type="text" id="fname" name="fname" value="홍" readonly><br>
    <label for="lname">이름</label><br>
    <input type="text" id="lname" name="lname" value="길동"><br><br>
    <input type="submit" value="Submit">
  </form>
  
  ```
  
  '홍' 값은 변경 할 수 없다.
  
  <br>
  
  그렇다면 둘의 차이점은 무엇일까 ?
  
  **form을 통해 데이터를 전송할때 disabled 값은 전송되지 않는다.**
  
  

