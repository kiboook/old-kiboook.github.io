---
title:  "[FIFA Online TMI] 에러 페이지 설정하기"
excerpt: ""

categories:
  - Spring

tags:
---

## 🧷 에러 페이지

메인 페이지에 접속하면 자동으로 메타 데이터를 받아 오도록 했는데 가끔가다 메타 데이터를 받아오지 못하는 경우가 있다.

만약 메타 데이터를 받아오지 못한 상태로 유저 정보를 검색하게 되면 다음과 같은 에러가 발생한다.

<img width="1792" alt="스크린샷 2021-02-27 오후 8 45 38" src="https://user-images.githubusercontent.com/54533309/109386243-c11f8880-793c-11eb-87d6-65f84a2f70d9.png">

보기만해도 머리가 아파온다..

개발자가 보면 에러가 발생한 것을 알겠지만 사용자가 보면 무슨 말인지도 모르는 이상한 외계어로 보일 것이다.

사용자가 인식할 수 있도록 이런 에러 페이지들을 바꾸어 주려고 한다.

## 📚 에러 페이지 생성

에러 페이지 적용 방법은 아주 간단하다.

**resources/templates/error/404.mustache**

```html
{>layout/header}

<div class="container mx-auto" style="width: 80%; text-align: center;">
    <h1 style="text-align: center; margin-top: 300px;">404 ERROR!</h1>
    <h5 style="text-align: center; margin-top: 50px;">존재하지 않는 페이지입니다!</h5>
    <button data-hover="Home" onclick="location.href='/'" style="margin-top: 100px;">
        <div>메인 페이지</div>
    </button>
</div>

{>layout/footer}
```

다음과 같이 templates 폴더에 error 폴더를 만들고 그 안에 에러코드.mustache 파일을 만들어주면 된다.

<br>

**resources/templates/error/500.mustache**

```html
{>layout/header}

<div class="container mx-auto" style="width: 80%; text-align: center;">
    <h1 style="text-align: center; margin-top: 300px;">500 ERROR!</h1>
    <h5 style="text-align: center; margin-top: 50px;">존재하지 않는 유저를 검색하셨거나 메타 데이터가 저장이 안 되었을 수 있습니다!</h5>
    <button data-hover="Home" onclick="location.href='/'" style="margin-top: 100px;">
        <div>메인 페이지</div>
    </button>
</div>

{>layout/footer}
```

<br>

**resources/templates/error/error.mustache**

```html
{>layout/header}

<div class="container mx-auto" style="width: 80%; text-align: center;">
    <h1 style="text-align: center; margin-top: 300px;">ERROR!</h1>
    <button data-hover="Home" onclick="location.href='/'" style="margin-top: 100px;">
        <div>메인 페이지</div>
    </button>
</div>

{>layout/footer}
```

이렇게만 설정을 해두면 404, 505 에러에는 404, 505 mustache 파일을 보여준다.

하지만 이 외에 나머지 에러 페이지를 합쳐서 보여주고 싶은 경우 어떻게 해야할까?

모든 에러코드에 해당하는 파일을 만들어 줄 수도 없는 노릇이다.

때문에 에러를 담당하는 컨트롤러를 생성한다.

## 🍜 Exception Handling  Controller

**~/web/ExceptionHandlingController.java**

```java
package com.fifaonline.tmi.web;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ExceptionHandlingController implements ErrorController {

    @RequestMapping(value = "/error")
    public String handleError(HttpServletRequest request, Model model) {

        // 에러 코드 획득
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        int statusCode = Integer.parseInt(status.toString());

        // 404 error
        if (statusCode == HttpStatus.NOT_FOUND.value()) {
            return "/error/404";
        }

        // 500 error
        if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
            return "/error/500";
        }
      
        return "/error/error";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
```

ErrorController 인터페이스를 가져와 내가 원하는대로 수정하면 된다.

여기서는 404, 500 에러를 따로 처리 해주고 나머지 에러는 하나의 페이지로 합쳤다.

## 🍪 에러 페이지 확인

에러 페이지가 잘 적용 됐나 확인 해보기 위해 404 에러와 500 에러를 만들어야 한다.

존재하지 않는 페이지인 **localhost:8080/where** 로 접속하게 되면 404 에러 페이지가 잘 나오는 것을 확인 할 수 있다.

<img width="1791" alt="스크린샷 2021-02-27 오후 8 58 52" src="https://user-images.githubusercontent.com/54533309/109386543-9a625180-793e-11eb-9455-6bf0e42ea841.png">

<br>

500 에러는 메타 데이터가 저장되지 않은 경우, NEXON OPEN API 에 유효하지 않은 요청을 보낸 경우가 있다.

대표적으로 존재하지 않는 유저의 닉네임을 입력해서 검색하는 경우 500 에러가 발생한다.

<img width="1789" alt="스크린샷 2021-02-27 오후 9 00 53" src="https://user-images.githubusercontent.com/54533309/109386579-e31a0a80-793e-11eb-8a9c-4a2b0ff3d01e.png">



## 📬 정리

존재하지 않는 유저를 검색하는 경우와 메타 데이터가 저장이 안 된 경우를 나누어서

500 에러 페이지를 더 세분화해야 할지 생각해 봐야겠다.

<a href="https://github.com/Nam-Ki-Bok/FIFA-Online-TMI" style="color:#0FA678" target="_blank">Github</a>

<br>