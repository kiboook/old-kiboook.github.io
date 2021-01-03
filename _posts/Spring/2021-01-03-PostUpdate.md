---
title:  "[Spring] Post 수정/조회 API 생성 및 분석과 테스트"
excerpt: ""

categories:
  - Spring

tags:
---

**[2020.12.28]** 부터 **스프링 부트와 AWS로 혼자 구현하는 웹 서비스** 책을 통해 스프링 공부를 시작했다.

공부한 내용을 글로 정리하려고 한다.

그래야 나중에 다시 찾아보며 공부 할 수 있을테니까 !!

## ✏️ Post 수정 / 조회 API 생성

<a href="https://nam-ki-bok.github.io/spring/PostAPI/" style="color:#0FA678">[Spring] Post 등록 API 생성 및 분석과 테스트</a> 에서 Post 를 등록하는 API 를 만들었다.

이어서 Post 를 수정하고 조회하는 API 를 만들어보려고 한다.

두 가지 API 만 완성하면 머스테치를 이용해 View 부분을 만들 예정이다.

## ⚖️ PostApiController

**java/com/boks/springboot/web/PostsApiController** 에 수정 / 조회 API 를 추가할 것이다.

```java
package com.boks.springboot.web;

@RequiredArgsConstructor
@RestController
public class PostsApiController {
    private final PostsService postsService;

		...

    @PutMapping("/api/v1/posts/{id}")
    public Long update(@PathVariable Long id, @RequestBody PostsUpdateRequestDto requestDto) {
        return postsService.update(id, requestDto);
    }

    @GetMapping("/api/v1/posts/{id}")
    public PostsResponseDto findById(@PathVariable Long id) {
        return postsService.findById(id);
    }
}
```

**@PutMapping**

HTTP PUT 요청을 의미한다.

<br>

**@GetMapping**

HTTP GET 요청을 의미한다.

<br>

**@PathVariable**

URL 에 변수를 사용할 수 있게 한다.

REST 한 API 를 만들 수 있게 된다.

Controller 에 API 를 만들었으니 이제 Service 에서 트랜잭션을 처리할 차례이다.

## 🔨 PostsService

**java/com/boks/springboot/service/posts/PostsService**

```java
package com.boks.springboot.service.posts;

@RequiredArgsConstructor
@Service
public class PostsService {
    private final PostsRepository postsRepository;

		...

    @Transactional
    public Long update(Long id, PostsUpdateRequestDto requestDto) {
        Posts posts = postsRepository.findById(id).orElseThrow(() ->
                new IllegalArgumentException("해당 게시글이 없습니다. id = " + id));

        posts.update(requestDto.getTitle(), requestDto.getContent());

        return id;
    }

    public PostsResponseDto findById(Long id) {
        Posts entity = postsRepository.findById(id).orElseThrow(() ->
                new IllegalArgumentException("해당 게시글이 없습니다. id = " + id));

        return new PostsResponseDto(entity);
    }
}
```

update 메소드를 보게 되면 Repository 를 통해 수정하고자 하는 Post 를 가져온다.

수정을 할 때는 Title, Content 만 가져와 수정하면 되기 때문에 PostUpdateRequestDTO 는 Title, Content 필드만 가진다.

그리고 Post Entity 의 update 메소드를 수행하게 되는데 코드는 다음과 같다.

**java/com/boks/springboot/domain/posts/Posts**

```java
package com.boks.springboot.domain.posts;

@Getter  // 롬복의 Get 생성 어노테이션
@NoArgsConstructor // 롬복의 기본 생성자 자동 추가 어노테이션
@Entity  // DB의 테이블과 매칭 될 클래스임을 나타냄
public class Posts extends BaseTimeEntity {

  ...
    
    public void update(String title, String content) {
        this.title = title;
        this.content = content;
    }
}
```

지금까지 코드를 보면 무언가 이상한 부분이 보인다.

분명히 데이터베이스의 데이터를 수정하는데 쿼리문을 던져주는 곳이 없다.

바로 **영속성 컨텍스트** 때문이다.

JPA 의 엔티티 매니저를 활성화 시킨 상태로 트랜잭션에서 데이터베이스에 있는 데이터에 접근하면

이 데이터는 영속성 컨텍스트가 유지된 상태이다.

이때 데이터를 변경하게 되면 트랜잭션이 끝나는 시점에 해당 테이블에 변경된 부분을 반영한다.

즉 Entity 객체의 값만 변경하게 되면 따로 쿼리문을 던져줄 필요가 없다는 것이다.

Spring Data JPA 는 기본으로 엔티티 매니저를 활성화 시킨다.

이 개념을 **더티 체킹** 이라고 한다.

## 📦 DTO

**java/com/boks/springboot/web/dto/PostsUpdateRequestDto**

포스트를 수정 한 정보를 받아오려면 title, content 만 알고있으면 된다.

글쓴이를 수정할 일은 없기 때문이다.

```java
package com.boks.springboot.web.dto;

@Getter
@NoArgsConstructor
public class PostsUpdateRequestDto {
    private String title;
    private String content;

    @Builder
    public PostsUpdateRequestDto(String title, String content) {
        this.title = title;
        this.content = content;
    }
}
```

<br>

**java/com/boks/springboot/web/dto/PostsResponseDto**

```java
package com.boks.springboot.web.dto;

@Getter
public class PostsResponseDto {
    private Long id;
    private String title;
    private String content;
    private String author;

    public PostsResponseDto(Posts entity) {
        this.id = entity.getId();
        this.title = entity.getTitle();
        this.content = entity.getContent();
        this.author = entity.getAuthor();
    }
}
```

책의 설명을 보면 이 DTO 는 Entity 의 필드 중 일부만 사용하므로 생성자로 Entity 를 받아와 필드에 대입한다고 한다.

굳이 모든 필드를 가진 생성자가 필요하진 않으므로 DTO 는 Entity 를 받아 처리한다고 한다.

그런데 이해가 가지 않는 부분이 service 에 findById 메소드를 보면 id 를 통해 찾아주는 메소드인데..

이때 왜 모든 필드가 필요하진 않다는 걸까.. findById 를 통해 특정 글쓴이의 글만 찾을 수도 있으니 그런건가.. 일단 더 해봐야겠다.

## ☀️ 수정 API 테스트

수정 / 조회 기능을 다 만들었으니 테스트를 할 시간이다.

<a href="https://nam-ki-bok.github.io/spring/PostAPI/" style="color:#0FA678">[Spring] Post 등록 API 생성 및 분석과 테스트</a> 에서 만들었던 테스트 코드에 이어서 작성한다.

**java/com/boks/springboot/web/PostsApiControllerTest**

```java
package com.boks.springboot.web;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class PostsApiControllerTest {

  ...

    @Test
    public void updatePost() throws Exception {
        // given
        Posts savedPost = postsRepository.save(Posts.builder()
                .title("title")
                .content("content")
                .author("author")
                .build());

        Long updateId = savedPost.getId();
        String expectedTitle = "title2";
        String expectedContent = "content2";

        PostsUpdateRequestDto requestDto = PostsUpdateRequestDto.builder()
                .title(expectedTitle)
                .content(expectedContent)
                .build();

        String url = "http://localhost:" + port + "/api/v1/posts/" + updateId;

        HttpEntity<PostsUpdateRequestDto> requestEntity = new HttpEntity<>(requestDto);

        // when
        ResponseEntity<Long> responseEntity = restTemplate.exchange(url, HttpMethod.PUT, requestEntity, Long.class);

        // then
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(responseEntity.getBody()).isGreaterThan(0L);

        List<Posts> all = postsRepository.findAll();
        assertThat(all.get(0).getTitle()).isEqualTo(expectedTitle);
        assertThat(all.get(0).getContent()).isEqualTo(expectedContent);
    }
}
```

![image](https://user-images.githubusercontent.com/54533309/103482678-8a8a2d80-4e25-11eb-9212-c15ffdf1e00b.png)

쿼리문을 보면 글 한 개를 만들고, 선택을 하고, 수정을 하는 로그를 볼 수 있다.

결과는 통과!

## 📡 조회 API 테스트

Post 를 조회하는 테스트는 실제로 어플리케이션을 실행시켜 확인해보려고 한다.

로컬에서는 H2DB 를 사용하기 때문에 웹 콘솔로 접근해야 한다.

**resources/application.properties**

```java
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL5InnoDBDialect
spring.h2.console.enabled=true
```

JPA 적용을 하면서 MySQL 쿼리문을 로그로 보기 위해 설정했던 파일에 **spring.h2.console.enabled=true** 를 추가한다.

그리고 어플리케이션을 실행 시킨 뒤 **localhost:8080/h2-console** 에 접속하자.

<img src="https://user-images.githubusercontent.com/54533309/103482905-f1f4ad00-4e26-11eb-970f-b25631779461.png" alt="스크린샷 2021-01-04 오전 12 51 09" style="zoom:80%;" />

JDBC URL 이 **jdbc:h2:mem:testdb** 로 안되어있다면 꼭 이렇게 작성하고 Connect 를 누르자.

연결을 하고 나면 아래와 같은 화면이 보이는데 테이블을 보게되면 지금까지 만들었던 posts 테이블이 보인다 !

쿼리문을 통해 글을 한 개 작성하자.

![스크린샷 2021-01-04 오전 12 53 52](https://user-images.githubusercontent.com/54533309/103482963-5283ea00-4e27-11eb-92d5-14ac7132a53b.png)



그리고 **localhost:8080/api/v1/posts/1** 주소로 접속을 하게 되면..

<br>

![스크린샷 2021-01-04 오전 12 56 14](https://user-images.githubusercontent.com/54533309/103483006-a8589200-4e27-11eb-9f0d-9977fd86c9a4.png)

Post 등록이 잘 된 것을 볼 수 있다.



## 📕 정리

Post 등록 API 만 만들고 나서는 컨트롤러와 서비스 DTO 간의 관계가 잘 이해가 가지 않았었다.

하지만 수정, 조회 API 까지 만들고 나니 전체적인 흐름을 알게 됐다.

이제 이 구조를 완전히 나 혼자 코딩할 수 있도록 해야한다..

우선 내일부터 머스테치를 이용해 View 부분을 구현하는데 얼른 하고싶다.

<br>

