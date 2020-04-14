---
title:  "[HTML] w3schools Exercise "
excerpt: ""

categories:
  - HTML

tags:
  - w3school
---

# <span style="font-size:20px">웹 프로그래밍 Quiz #1 대비 Exercise 틀린 문제 모음</span>

***

1. 수평선, 구분선은 `<hr>`을 사용하며 닫는 태그는 없다.

   <br>

2. 입력 한 그대로를 보여주는 태그는 `<pre> </pre>` 이다.

   <br>

3. `<p>`태그에서 가운데 정렬은 `<p style="text-align: center">` 이다.

   <br>

4. 강조는 `<strong> <b>` 둘 다.. 하지만 큰 차이가 있다.

   바로 `<strong>`은 웹 페이지가 정말 중요한 부분이라고 인식을 하는 반면

   `<b>`는 해당 텍스트를 Bold 처리 한 것이다.

   <br>

5. emphasize는 `<em> </em>` 이다. 이것도 `<i> </i>`와 큰 차이가 있다.

   `<em>`은 웹 페이지가 강조하는 부분이라고 인식을 하는 반면

   `<i>`는 해당 텍스트를 기울이기 처리 한 것이다.

   <br>

6. H<sub>2</sub>O 아래 첨자는 `<sub> </sub>` 태그를 사용한다.

   <br>

7. <span style="color:blue"><del>blue</del></span> 취소선은 `<del> </del>` 태그를 사용한다.

   <br>

8. <q>Hello</q> `<q> </q>`

   <br>

9. text가 긴 인용문은 `<blockquote cite="link"> ~ </blockquote>` 태그를 사용한다.

   <br>

10. 글씨가 써지는 방향 지정은 `<bdo dir="rtl"> ~ </bdo>` 태그를 사용한다.

    ex )  <bdo dir="rtl">이렇게 하면 거꾸로 써지지용?</bdo>

    <br>

11. 줄임말 표시는 `<abbr title="줄이기 전 단어">줄인 단어</abbr>` 마우스를 올려보면 줄이기 전 단어가 보인다.

    ex ) <abbr title="World Health Oranization">WHO</abbr>

    <br>

12. `<a href="https://nam-ki-bok.github.io" style="text-decoration:none"> ~ </a>` 링크 밑줄 없애기

    <br>

13. `<a href="https://nam-ki-bok.github.io" target="_blank"> ~ </a>` 링크 클릭 시 새창으로 띄우기

    <br>

14. 표의 제목은 `<caption> </caption>` 이다.

    <br>

15. `<ul>`의 모양을 바꾸려면 `<ul style="list-style-type: square">`

    <br>

16. `<ol>`의 숫자를 바꾸려면 `<ol type="A, a, I, i">`

    <br>

17. 용어를 정의하려면 `<dl> <dt> <dd>`를 사용한다.

    ex )

    ```html
    <dl>
      <dt>Milk</dt>
       <dd>Mint Choco Milk</dd>
      <dt>Cookie</dt>
       <dd>Mint Choco Cookie</dd>
    </dl>
    ```

    <br>

18. `<iframe src="link" width="1024"></iframe>` iframe 태그를 사용 하는 경우 width 값 설정을 이런 식으로 한다.

    <br>

19. input value를 서버로 넘기려면 ?

    ```html
     <form action="/action_page.php">
      Name: <input type="text" name="name">
      <input type="submit">
    </form>
    ```

    <form>
      Name: <input type="text" name="name">
      <input type="submit" value="임시제출버튼 클릭금지">
    </form>

    <br>

20. Drop Down Box는 어떻게 만들까 ?

    ```html
    <form action="/action_page.php">
      <select name="cars">
        <option value="Volvo">Volvo</option>
        <option value="BMW">BMW</option>
        <option value="Benz">Benz</option>
      </select>
      <input type="submit">
    </form>
    ```

    <form action="/action_page.php">
      <select name="cars">
        <option value="Volvo">Volvo</option>
        <option value="BMW">BMW</option>
        <option value="Benz">Benz</option>
      </select>
    </form>

    <br>

21. Text 입력 창에 placeholder를 띄우려면 ?

    ```html
    <form action="/action_page.php">
      Name: <input type="text" placeholder="Input Your Name">
    </form>
    ```

    <form action="/action_page.php">
      Name: <input type="text" placeholder="Input Your Name">
    </form>











