---
title:  "[FIFA Online TMI] Enter 키로 검색하기, Status=canceled"
excerpt: ""

categories:
  - Spring

tags:
---

## 🍘 Enter 키로 검색하기

![ezgif-3-2ae1e38c36e6](https://user-images.githubusercontent.com/54533309/106568181-48fcb780-6576-11eb-98cc-f67ea1c95337.gif)

검색 과정을 보면 구단주를 입력 후 검색 버튼을 누르게 된다.

이 때 Enter 키를 눌러도 검색이 되게 수정하려고 한다.

js 파일에 Enter 키를 눌렀을 때도 검색 버튼을 눌렀을 때와 같은 함수가 동작하도록 수정한다.

**resources/static/js/app/index.js**

```javascript
	...
  
        $('#nickname').on('keyup', function (key) {
            if (key.keyCode === 13) {
                _this.search_user_info();
            }
        })
    },

	...
```

nickname 이라는 id 를 가진 input 태그에 KeyCode === 13 즉, Enter 키가 눌리면 함수가 동작하는 방식이다.

## ‼️ Status canceled

<img width="994" alt="스크린샷 2021-02-04 오후 2 57 39" src="https://user-images.githubusercontent.com/54533309/106851307-555d4d80-66f9-11eb-8531-50465516ab61.png">그런데 구단주 이름을 입력한 뒤 엔터를 누르면 API 요청을 취소해버린다.

구글링을 해보니 Status canceled 의 대부분의 원인은 이 중으로 요청을 해버려 크롬에서 취소 시킨다는 것이었다.

여기서 의문점이 생겼다.

구단주 이름을 입력하고 엔터를 누르면 함수가 한 번 실행되는데 왜 두 번 요청을 하게 되는 것일까?

답은 **\<form>** 태그였다.

**resources/templates/index.mustache**

```html
<h1 style="text-align: center">FIFA Online 4 - TMI</h1>

<div class="container" style="margin-top: 150px;">
    <h3 style="text-align: center">구단주 검색</h3>

    <form>
        <div class="mx-auto" style="width: 350px;">
            <div class="input-group">
                <input type="text" class="form-control" id="nickname" placeholder="구단주를 입력하세요"
                       style="margin-right: 10px;">
                <button class="btn btn-primary" type="button" id="btn-user-info">검색</button>
            </div>
        </div>
    </form>
</div>
```

form 태그가 input, button 태그를 감싸고 있는 것을 볼 수 있다.

이렇게 되면 기본적으로 input 태그에 값을 입력하고 엔터를 누르면 값이 전송되어 API 통신을 한다.

그런데 함수로 또 요청하게 했으니 이 중으로 요청을 한 셈이 되는 것 이다.

form 태그를 지우게 되면 에러없이 구단주 명을 통해 검색을 할 수 있다.

## 📬 정리

생각보다 간단히 고칠 수 있는 에러였는데 꽤나 고생했다.

ajax 문제인가 싶어 fetch 로 바꾸기도 해보고..

하지만 html 이해도 부족에서 나타난 에러였다..

<a href="https://github.com/Nam-Ki-Bok/FIFA-Online-TMI" style="color:#0FA678" target="_blank">Github</a>

<br>