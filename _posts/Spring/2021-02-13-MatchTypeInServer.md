---
title:  "[FIFA Online TMI] 유저 최고 등급 서버단에서 가져오도록 수정 및 메타 데이터 매핑"
excerpt: ""

categories:
  - Spring

tags:
---

## 🍤 API KEY 숨기기

<a href="https://nam-ki-bok.github.io/spring/HideAPI/" style="color:#0FA678">[FIFA Online TMI] Properties 를 통해 API KEY 숨기고 가져오기</a>

<a href="https://nam-ki-bok.github.io/spring/Division/" style="color:#0FA678">[FIFA Online TMI] 유저 최고 등급 가져오기</a>

프로퍼티를 이용해 키를 숨기고, 유저 최고 등급을 프론트단에서 바로 가져왔다.

그런데 정말 바보같은 생각을 하고 있었다.

기존의 코드는 숨긴 키를 가지고 프론트단에서 그 키를 가져와 사용한다.

그렇게 되면 내가 아무리 숨겨서 사용한다 한들 **console.log()** 명령 하나로 키 값을 볼 수 있게 된다.

왜 이 생각을 못 했을까?! 🤬🤯

## 🌮 OPEN API 요청은 모두 서버단으로

결국 KEY 값을 사용하는 요청은 모두 서버단으로 옮겼다.

모두라고 해봤자 지금은 한 가지 밖에 없었지만.. 

DB 에 저장 할 필요 없이 바로 출력하면 되는 요청을 전부 프론트단에 두고 나서 알았다면.. 끔찍하다 !

유저 최고 등급 API 를 서버단에서 요청하도록 수정했다.

가장 먼저 유저 최고 등급 정보를 받아 전달 해 줄 DTO 를 생성한다.

**/web/dto/UserDivisionResponseDto**

```java
package com.fifaonline.tmi.web.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UserDivisionResponseDto {
    private String matchType;
    private String division;
    private String achievementDate;
}
```

여기서 주의할 부분은 **@Setter** 이다.

DTO 는 단순히 데이터만 전달하는 용도이기 때문에 절대 값이 수정되어서는 안된다.

하지만 메타 데이터와 매핑을 하기 위해 Setter 를 넣어주었다.

<br>

**/web/IndexController**

```java
@GetMapping("/user/division/{nickname}")
public String userDivision(@PathVariable String nickname, Model model) {
    UserDivisionResponseDto[] userDivisionResponseArray = userService.requestUserDivision(nickname);
    model.addAttribute("division", userDivisionResponseArray);
    return "user-division";
}
```

기존에는 JS 에서 유저 최고 등급 정보를 가져와 태그를 찾아 값을 수정하는 방식으로 코딩했었다.

하지만 서버단으로 옮겨왔으므로 Model 을 통해 머스타치 파일에 넣어 함께 반환한다.

실행 순서를 적어보자면 **IndexController &rarr; UserService &rarr; UserApiClient** 순으로 들어가 정보를 가져온다.

<br>

**/service/UserService.java**

```java

	...

@RequiredArgsConstructor
@Service
public class UserService {
    private final UserApiClient userApiClient;
    private final UserRepository userRepository;
    private final MatchTypeRepository matchTypeRepository;

	...

    public String requestUserAccessId(String nickname) {
        User entity = userRepository.findById(nickname).orElseThrow(() -> new IllegalArgumentException("구단주가 존재하지 않습니다!"));

        return entity.getAccessId();
    }

    public UserDivisionResponseDto[] requestUserDivision(String nickname) {
        String accessId = requestUserAccessId(nickname);
        return userApiClient.requestUserDivision(accessId);
    }
}
```

 Nexon Open API 의 특징이 맨 처음 유저 정보를 반환 해주는 API 만 유저 이름을 값으로 요청하고

다른 모든 API 는 그 유저의 고유 아이디를 값으로 요구한다.

따라서 유저 이름을 유저 고유 아이디로 바꾸어 주는 작업을 한 번 한다.

<br>

**/tmi/api/UserApiClient.java**

```java

	...

@RequiredArgsConstructor
@Service
public class UserApiClient {
    private final MatchTypeRepository matchTypeRepository;
    private final RestTemplate restTemplate;

    @Inject
    private ApiKey apiKey;

	...

    public UserDivisionResponseDto[] requestUserDivision(String accessId) {
        UserDivisionResponseDto[] userDivisionResponseDtoArray = null;
        final String UserDivisionUrl = "https://api.nexon.co.kr/fifaonline4/v1.0/users/{accessid}/maxdivision";
        final HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Authorization", apiKey.getKey());
        final HttpEntity<String> entity = new HttpEntity<>(httpHeaders);


        try {
            userDivisionResponseDtoArray =
                    restTemplate.exchange(UserDivisionUrl, HttpMethod.GET, entity,
                            UserDivisionResponseDto[].class, accessId).getBody();
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        assert userDivisionResponseDtoArray != null;
        for (UserDivisionResponseDto val : userDivisionResponseDtoArray) {
            val.setMatchType(requestUserDivisionMatchType(val.getMatchType()));
            val.setAchievementDate(val.getAchievementDate().split("T")[0]);
        }
        return userDivisionResponseDtoArray;
    }

    public String requestUserDivisionMatchType(int id) {
        MatchType entity = matchTypeRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("매치 타입 에러!"));

        return entity.getDesc();
    }
}
```

드디어 OPEN API 를 직접 찌르는 곳 까지 이동을 했다.

여기서 API 를 찔러 받아 온 정보를 바로 메타 데이터와 매핑한다.

숫자 정보로 받아 온 매치 정보를 문자로 바꾸어서 전달 해야하기 때문에 DTO 지만 Setter 를 추가 한 것이다.

내일 등급 정보도 메타 데이터를 가져와 매핑을 해야한다.

## 📬 정리

![스크린샷 2021-02-14 오전 12 06 00](https://user-images.githubusercontent.com/54533309/107853305-6ecc6b00-6e58-11eb-8a88-97a174c57e05.png)

메타 데이터와 매핑을 하기 전에는 매치 종류를 숫자 정보로 보여 줬지만 이 정보를 문자 정보로 바꾸는 작업을 했다.

<br>

![스크린샷 2021-02-14 오전 12 05 28](https://user-images.githubusercontent.com/54533309/107853290-5b210480-6e58-11eb-897e-600019b08fbc.png)

이제 자신이 어떤 매치 종류에서 달성 했는지 한 눈에 알 수 있다.

최고 등급도 이와 같은 작업으로 매핑을 해준다면 역대 최고 등급 서비스는 완성이다.

<a href="https://github.com/Nam-Ki-Bok/FIFA-Online-TMI" style="color:#0FA678" target="_blank">Github</a>

<br>