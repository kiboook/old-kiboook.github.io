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

  <form action="">
<label for="lname">성</label><br>
    <input type="text" id="lname" name="lname" value="홍" disabled><br>
  <label for="fname">이름</label><br>
    <input type="text" id="fname" name="fname" value="길동"><br><br>
  </form>
  
  ```html
  <form action="">
    <label for="fname">성</label><br>
    <input type="text" id="fname" name="fname" value="홍" disabled><br>
    <label for="lname">이름</label><br>
    <input type="text" id="lname" name="lname" value="길동"><br><br>
    <input type="submit" value="Submit">
  </form>
  ```
  
  
  
  
  #### readonly
  
  <form action="">
    <label for="fname">성</label><br>
    <input type="text" id="fname" name="fname" value="홍" disabled><br>
    <label for="lname">이름</label><br>
    <input type="text" id="lname" name="lname" value="길동"><br><br>
  </form>
  ```html
  <form action="">
    <label for="fname">성</label><br>
    <input type="text" id="fname" name="fname" value="홍" readonly><br>
    <label for="lname">이름</label><br>
    <input type="text" id="lname" name="lname" value="길동"><br><br>
    <input type="submit" value="Submit">
  </form>
  ```
  
  <br>
  
  둘 다 수정할 수 없는 공통점이 있지만
  
  **disabled**는 **데이터를 서버로 보낼 수 없다.**

