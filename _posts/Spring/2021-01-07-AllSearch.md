---
title:  "[Spring] 전체 Post 조회 화면 만들기"
excerpt: ""

categories:
  - Spring

tags:
---

**[2020.12.28]** 부터 **스프링 부트와 AWS로 혼자 구현하는 웹 서비스** 책을 통해 스프링 공부를 시작했다.

공부한 내용을 글로 정리하려고 한다.

그래야 나중에 다시 찾아보며 공부 할 수 있을테니까 !!

## 📫 전체 Post 조회 화면 만들기

localhost:8080 으로 접속하는 경우 바로 모든 글을 보여주려고 한다.

우선 **resources/templates/index.mustache** 코드를 수정한다.

<img width="600" alt="스크린샷 2021-01-07 오후 8 21 13" src="https://user-images.githubusercontent.com/54533309/103887136-ec001400-5125-11eb-9666-3fb8cb9b87f0.png">

**\{\{#posts\}\}**

머스테치의 문법으로 posts 이름의 리스트를 반복한다.

<br>

**\{\{id\}\}, \{\{title\}\}, \{\{author\}\}, \{\{modifiedDate\}\}**

머스테치의 문법으로 posts 리스트에 있는 객체에서 해당 값을 가져온다.

## 🔎 Controller, Service, Repository 작성

눈으로 볼 화면을 만들었으니 이 화면에 자료를 가져다 줄 코드를 작성해야한다.

먼저 데이터베이스에 있는 전체 포스트를 가져오기 위해 PostsRepository 에 코드를 추가한다.

**java/com/boks/springboot/domain/posts/PostsRepository.java**

```java
package com.boks.springboot.domain.posts;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PostsRepository extends JpaRepository<Posts, Long> {

    @Query("SELECT p FROM Posts p ORDER BY p.id DESC")
    List<Posts> findAllDesc();
}
```

**@Query**

Spring Data JPA 가 제공하지 않는 메소드는 어노테이션을 통해 작성 할 수 있다.

물론 위 쿼리는 기본 제공 메소드로 해결할 수 있지만 이런 방법이 있다는 것을 알려주려고 일부러 이렇게 했다고 한다.

또 쿼리문을 작성하면 직관적으로 어떤 일을 하는지 알 수 있어 좋다고 한다.

<br>

이제 PostsRepository 의 메소드를 사용 할 Service 를 작성한다.

**java/com/boks/springboot/service/posts/PostsService.java**

```java

	...

@RequiredArgsConstructor
@Service
public class PostsService {
    private final PostsRepository postsRepository;
  
	...

    @Transactional(readOnly = true)
    public List<PostsListResponseDto> findAllDesc() {
        return postsRepository.findAllDesc().stream()
                .map(PostsListResponseDto::new)
                .collect(Collectors.toList());
    }
}
```

**@Transactional (readOnly = true)**

readOnly = true 옵션을 주게되면 트랜잭션 범위는 유지하지만 조회만 하기 때문에 속도가 올라간다.

수정, 삭제, 등록 기능이 없는 서비스 메소드라면 이 옵션을 주도록 하자.

<br>

**findAllDesc()**

return 문의 코드를 보게 되면 PostsRepository 를 통해 받아온 데이터 스트림을

map 을 통해 PostsListResponseDto 객체로 만들어 리스트로 반환하는 구조이다.

<br>

**java/com/boks/springboot/web/dto/PostsListResponseDto.java** 

```java
package com.boks.springboot.web.dto;

import com.boks.springboot.domain.posts.Posts;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class PostsListResponseDto {
    private Long id;
    private String title;
    private String author;
    private LocalDateTime modifiedDate;

    public PostsListResponseDto(Posts entity) {
        this.id = entity.getId();
        this.title = entity.getTitle();
        this.author = entity.getAuthor();
        this.modifiedDate = entity.getModifiedDate();
    }
}
```

전체 조회를 하는 경우 글 정보는 이 DTO 에 담겨서 전해진다.

<br>

Repository 를 통해 데이터베이스에 접근 해 데이터를 가져오고, Service 를 통해 Repository 의 메소드를 이용하게 했으니

이제 Controller 가 Service 메소드를 이용 할 시간이다.

**java/com/boks/springboot/web/IndexController.java**

```java

	...

@RequiredArgsConstructor
@Controller
public class IndexController {
    private final PostsService postsService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("posts", postsService.findAllDesc());
        return "index";
    }

	...
    
}
```

**Model**

서버 템플릿 엔진이 사용할 수 있는 객체로 만들어 준다.

이 코드는 서비스가 제공하는 findAllDesc() 메소드를 통해 가져온 글 리스트를 posts 이름으로

index.mustache 에 넘겨준다.

## 🖍 정리

localhost:8080 에 접속했을 경우 전체 글을 보여주는 과정은 다음과 같다.

1. localhost:8080 에 접속하면 **IndexController** 에 있는 **index** GET API 가 실행된다.
2. 이 API 는 **PostsService** 에 있는 **findAllDesc** 메소드를 실행한다.
3. 이 메소드는 **PostsRepository** 에 있는 **findAllDesc** 메소드를 실행한다.
4. 데이터베이스에 있는 모든 데이터를 가져와 **PostsService** 에게 넘겨준다.
5. PostsService 는 이 데이터를 가지고 리스트로 만들어 **IndexController** 로 넘겨준다.
6. **IndexController** 는 리스트를 **index.mustache** 가 읽을 수 있는 형태로 넘겨준다.
7. **index.mustach** 는 이 정보를 가지고 모든 글을 보여준다.

## 📈 결과

<img src="https://user-images.githubusercontent.com/54533309/103889995-ab56c980-512a-11eb-8faa-b60d600dcee8.png" alt="스크린샷 2021-01-07 오후 8 55 23" style="zoom:70%;" />

<br>

