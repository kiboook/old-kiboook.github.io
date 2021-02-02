---
title:  "[FIFA Online TMI] 넥슨 Open API로 가져온 유저 정보 출력하기"
excerpt: ""

categories:
  - Spring

tags:
---

## 🍑 유저 정보 DB에 저장

<a href="https://nam-ki-bok.github.io/spring/UserInfo/" style="color:#0FA678">[FIFA Online TMI] 넥슨 Open API로 유저 정보 가져오기</a>

먼저 API 를 통해 유저 정보를 잘 가져오는지 alert 로 확인을 했다.

이제 가져온 정보를 데이터베이스에 저장해 줄 것이다.

유저 정보에 유저 고유 식별자가 있는데 이 정보를 가지고 역대 최고 등급, 매치 기록, 거래 기록 등

다양한 정보에 접근해야 하기 때문이다.

기존에 유저 정보를 받아오는 과정에서 받아온 이후 바로 데이터베이스에 저장하도록 구조를 바꿨다.

**UserApiController &rarr; UserService &rarr; UserApiClient &rarr;  Nexon Open API &rarr; UserApiResponseDto** 

에서 끝났다면 지금은 **UserApiResponseDto** 를 가지고 **User entity** 를 만들어 데이터베이스에 저장한다.

## 🫕 web/UserApiController

```java
package com.fifaonline.tmi.web;

import com.fifaonline.tmi.service.UserService;
import com.fifaonline.tmi.web.dto.UserApiResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class UserApiController {
    private final UserService userService;

    @GetMapping("/api/v1/user/{nickname}")
    public Long requestUserInfo(@PathVariable String nickname) {
        UserApiResponseDto userApiResponseDto = userService.requestUserInfo(nickname);
        return userService.save(userApiResponseDto);
    }
}
```



## 🍜 DB에 저장된 정보 출력

받아온 정보를 DB에 저장을 했으니 유저 기본 정보를 출력해야한다.

![스크린샷 2021-02-01 오전 2 24 40](https://user-images.githubusercontent.com/54533309/106392340-a852ae80-6434-11eb-9d49-b0a4b5ae56d6.png)

기존에는 위와 같이 구단주 검색을 하면 정보를 alert 로 보여줬지만 이제 페이지를 이동시켜 보여주려고 한다.

그렇게 하기 위해 우선 js 파일을 수정한다.

**static/js/app/index.js**

```javascript
var main = {
    init: function () {
        var _this = this;
        $('#btn-user-info').on('click', function () {
            _this.search_user_info();
        });
    },
    search_user_info: function () {
        const nickname = $('#nickname').val();
        if (nickname === '') {
            alert("구단주를 입력하세요!");
        } else {
            $.ajax({
                type: 'GET',
                url: '/api/v1/user/' + nickname,
                dataType: 'json',
                contentType: 'application/json; charset=utf-8'
            }).done(function (id) {
                window.location.href = '/user/info/'+id;
            }).fail(function () {
                alert("존재하지 않는 구단주입니다!");
            });
        }
    }
};

main.init();
```

검색 버튼을 누르면 유저의 id 를 가져와 **/user/info/id** 페이지로 이동한다.

<br>

**web/IndexController**

```java
package com.fifaonline.tmi.web;

import com.fifaonline.tmi.service.UserService;
import com.fifaonline.tmi.web.dto.UserResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RequiredArgsConstructor
@Controller
public class IndexController {
    private final UserService userService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/user/info/{id}")
    public String userInfo(@PathVariable Long id, Model model) {
        UserResponseDto userResponseDto = userService.findById(id);
        model.addAttribute("user", userResponseDto);
        return "user-info";
    }
}
```

 **/user/info/id** 주소로 이동하게 되면 id 를 통해 DB 에서 유저를 조회한다.

그리고 **UserResponseDto** 를 통해 정보를 가져와 **user-info.mustache** 에 넘겨주게 된다.

<br>

**templates/user-info**

```html
<!--
Mustache 문법 작성 시 출력 오류 발생, 출력을 위해 {} 한 개 작성, 실제 코드에서는 두 개로 작성해야 함.
header, footer 생략.
-->

<h1 style="text-align: center">구단주 정보</h1>

<div class="container mx-auto" style="margin-top: 150px; width: 1000px;">
    <h4 style="text-align: center">구단주 고유 식별 ID : {user.accessId}</h4>
    <h4 style="text-align: center">구단주 이름 : {user.nickname}</h4>
    <h4 style="text-align: center">구단주 레벨 : {user.level}</h4>
</div>
```

드디어 Nexon Open API 를 통해 가져온 정보를 DB 에 저장하고

id 를 통해 유저를 조회해 페이지에 뿌려주는 기능까지 완성했다.

## 📬 결과

![ezgif-3-2ae1e38c36e6](https://user-images.githubusercontent.com/54533309/106568181-48fcb780-6576-11eb-98cc-f67ea1c95337.gif)

지금은 유저 정보를 보여주는 URI 로 user/info/id 를 사용하고 있지만 추후에 user/info/nickname 으로 바꿀 예정이다.

테이블은 구단주 고유 식별 ID 를 PK 로 바꿀 예정이다.

얼른 수정하고 구단주 고유 식별 ID 를 통해 다른 정보를 검색하는 기능도 만들어야겠다.

<a href="https://github.com/Nam-Ki-Bok/FIFA-Online-TMI" style="color:#0FA678" target="_blank">Github</a>

<br>