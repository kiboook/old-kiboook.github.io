---
title:  "[springboot-webserivce] Post 수정 / 삭제 화면 만들기"
excerpt: ""

categories:
  - Spring

tags:
---

**[2020.12.28]** 부터 **스프링 부트와 AWS로 혼자 구현하는 웹 서비스** 책을 통해 스프링 공부를 시작했다.

공부한 내용을 글로 정리하려고 한다.

그래야 나중에 다시 찾아보며 공부 할 수 있을테니까 !!

## ✂️ Post 수정 화면과 API 연결하기

<a href="https://nam-ki-bok.github.io/spring/PostUpdate/" style="color:#0FA678">[Spring] Post 수정/조회 API 생성 및 분석과 테스트</a> 를 통해 만든 수정, 조회 API 를 사용할 시간이다.

이 API 를 통해 Post 수정, 조회 화면을 만들 것이다.

수정은 글 제목을 눌러 들어가면 할 수 있게 구현했다.

**resources/templates/index.mustache**

<img width="500" alt="스크린샷 2021-01-07 오후 11 08 44" src="https://user-images.githubusercontent.com/54533309/103902037-4ce71680-513d-11eb-94d7-f7eb8b445aaf.png">

글 제목을 누르게 되면 **posts/update/id** 주소로 GET 요청을 보낸다.

<br>

**java/com/boks/springboot/web/IndexController.java**

```java

	...
    
@RequiredArgsConstructor
@Controller
public class IndexController {
    private final PostsService postsService;
  
	...

    @GetMapping("posts/update/{id}")
    public String postsUpdate(@PathVariable Long id, Model model) {
        PostsResponseDto dto = postsService.findById(id);
        model.addAttribute("post", dto);

        return "posts-update";
    }
}
```

GET 요청을 받은 컨트롤러는 Post id 를 가지고 데이터베이스에 저장 된 Post 를 가져온다.

그리고 model 을 통해 머스테치가 읽을 수 있게 바꾸어 **posts-update.mustache** 에게 전달한다.

<br>

**resources/templates/posts-update.mustache**

<img width="700" alt="스크린샷 2021-01-07 오후 11 16 59" src="https://user-images.githubusercontent.com/54533309/103902851-72c0eb00-513e-11eb-98c6-a7efc186c86f.png">

글을 수정할 때 글쓴이와 id 는 수정하면 안되기 때문에 readonly 옵션을 넣어준다.

이 페이지에서 수정을 마친 뒤 수정 완료 버튼을 누르게 되면 index.js 를 통해 update API 를 부를 수 있게 한다.

<br>

**resources/static/js/app/index.js**

```javascript
var main = {
    init: function () {
        var _this = this;
        $('#btn-save').on('click', function () {
            _this.save();
        });

        $('#btn-update').on('click', function () {
            _this.update();
        });

        $('#btn-delete').on('click', function () {
            _this.delete();
        });
    },
  
	...
  
    update : function () {
        var data = {
            title: $('#title').val(),
            content: $('#content').val()
        };

        var id = $('#id').val();
        $.ajax({
            type: 'PUT',
            url: '/api/v1/posts/'+id,
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function () {
            alert('글이 수정되었습니다.');
            window.location.href = '/';
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },
  
	...
  
};

main.init();
```

index.js 에서는 수정 된 정보를 가지고 와 data 를 JSON 형식으로 바꾸어 update API 에 던져준다.

<br>

**java/com/boks/springboot/web/PostsApiController.java**

```java

	...

@RequiredArgsConstructor
@RestController
public class PostsApiController {
    private final PostsService postsService;

	...

    @PutMapping("/api/v1/posts/{id}")
    public Long update(@PathVariable Long id, @RequestBody PostsUpdateRequestDto requestDto) {
        return postsService.update(id, requestDto);
    }
  
	...
    
}
```

JSON 형태로 받아온 데이터를 **@RequestBody** 을 통해 PostsUpdateRequestDto 객체로 바꾸어 준다.

그리고 서비스 &rarr; 엔티티를 통한 수정 과정을 진행한다.

## 🔎 정리

포스트를 수정하는 과정은 다음과 같다.

<img src="https://user-images.githubusercontent.com/54533309/103903903-e1eb0f00-513f-11eb-9b22-fccb7b8aa4f6.png" alt="스크린샷 2021-01-07 오후 11 27 13" style="zoom:80%;" />



1. 제목과 내용을 수정한 뒤 수정 완료 버튼을 누른다.
2. 버튼을 누르게 되면 **index.js** 에 있는 **update** 메소드가 동작한다.
3. 수정 된 제목과 내용을 JSON 형태로 바꾸어 **PostsApiController** 에 있는 **update** 메소드로 넘겨준다.
4. **@RequestBody** 를 통해 JSON 을 PostsUpdateRequestDto 객체로 바꾸어 **PostsService** 의 **update** 메소드로 넘겨준다.
5. **PostsService** 는 **Posts Entity** 의 **update** 를 통해 수정을 진행한다.
6. **@Transactional** 덕분에 쿼리문은 던져줄 필요가 없다.

## 🛎 삭제 API 연결하기

삭제 과정은 수정과 별반 차이가 없다.

수정을 할 때와 마찬가지로 이어서 삭제를 눌렀을 경우 API 를 연결해 주기 위한 **index.js** 파일에 코드를 추가한다.

**resources/static/js/app/index.js**

```javascript
var main = {
    init: function () {
        var _this = this;
        $('#btn-save').on('click', function () {
            _this.save();
        });

        $('#btn-update').on('click', function () {
            _this.update();
        });

        $('#btn-delete').on('click', function () {
            _this.delete();
        });
    },

	...
  
    delete : function () {
        var id = $('#id').val();

        $.ajax({
            type: 'DELETE',
            url: '/api/v1/posts/'+id,
            dataType: 'json',
            contentType: 'application/json; charset=utf-8'
        }).done(function () {
            alert('글이 삭제되었습니다.');
            window.location.href = '/';
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    }
};

main.init();
```

삭제 과정에서는 글의 id 만 알면 되기 때문에 바로 삭제 작업을 한다.

<br>

**java/com/boks/springboot/web/PostsApiController.java**

```java

	...

@RequiredArgsConstructor
@RestController
public class PostsApiController {
    private final PostsService postsService;

	...

    @DeleteMapping("/api/v1/posts/{id}")
    public Long delete(@PathVariable Long id) {
        postsService.delete(id);
        return id;
    }

	...
    
}
```

삭제하고자 하는 id 를 가지고 **postsService** 에 있는 **delete** 메소드를 호출한다.

<br>

**java/com/boks/springboot/service/posts/PostsService.java**

```java

	...

@RequiredArgsConstructor
@Service
public class PostsService {
    private final PostsRepository postsRepository;

	...

    @Transactional
    public void delete (Long id) {
        Posts posts = postsRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 게시글이 없습니다. id = " + id));

        postsRepository.delete(posts);
    }
}
```

PostsService 는 Repository 를 통해 삭제를 진행한다.

## 🍔 정리

포스트를 삭제하는 과정은 다음과 같다.

1. 삭제하고 싶은 포스트의 제목을 누른 뒤 삭제 버튼을 누른다.
2. **index.js** 에 있는 **delete** 메소드가 동작해 delete API 를 요청한다.
3. API 는 **PostsService** 의 **delete** 메소드를 동작하게 한다.
4. **PostsService** 는 **PostsRepository** 를 통해 글을 삭제한다.

<br>

