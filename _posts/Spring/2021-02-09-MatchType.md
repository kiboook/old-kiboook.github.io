---
title:  "[FIFA Online TMI] 매치 타입 메타데이터 받아와 저장하기"
excerpt: ""

categories:
  - Spring

tags:
---

## 🌯 NEXON OPEN API 를 통해 메타 데이터 가져오기

유저 고유 식별자를 통해 유저 최고 기록 정보를 받아오면 다음과 같이 숫자로 정보를 제공한다.

```json
[
        {
                "matchType": 50,
                "division": 2400,
                "achievementDate": "2019-03-15T05:41:31"
        },
        {
                "matchType": 52,
                "division": 2400,
                "achievementDate": "2019-03-24T17:53:08"
        }
]
```

사용자에게 이 정보를 바로 제공하면 최고 등급을 언제 달성했는지만 알 수 있을 것이다.

그래서 넥슨에서는 여러가지 메타 데이터를 제공한다.

<img src="https://user-images.githubusercontent.com/54533309/107374560-11b87880-6b2b-11eb-97de-6984381ef8ad.png" alt="스크린샷 2021-02-09 오후 11 03 45" width="300" />

이 중에서 매치 종류, 등급 식별자 메타데이터를 가져와 매핑 시켜주면 된다.

먼저 매치 종류 메타데이터를 가져오려고 한다.

## 🥟 정보를 담을 DTO 생성

먼저 API 를 찔렀을때 받아오는 정보를 담을 DTO 를 생성한다.

**/web/dto/MatchTypeResponseDto.java**

```java
package com.fifaonline.tmi.web.dto;

import com.fifaonline.tmi.domain.MatchType;
import lombok.Getter;

@Getter
public class MatchTypeDto {
    private int matchtype;
    private String desc;

    public MatchType toEntity() {
        return MatchType.builder()
                .matchType(matchtype)
                .desc(desc).build();
    }
}
```

정보를 담을 DTO 를 만들었으니 이제 API 를 찔러 받아오면 된다.

<br>

**/api/UserApiClient.java**

```java

	...

@RequiredArgsConstructor
@Service
public class UserApiClient {

	...

    public MatchTypeDto[] requestMatchTypeMetaDate() {
        MatchTypeDto[] matchTypeDtoArray = null;

        try {
            matchTypeDtoArray =
                    restTemplate.getForEntity("https://static.api.nexon.co.kr/fifaonline4/latest/matchtype.json",
                            MatchTypeDto[].class).getBody();
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return matchTypeDtoArray;
    }
}
```

오브젝트 배열을 받아오는 것은 처음이라 어떻게 파싱을 해야할지 몰라서 검색을 했다.

<a href="https://recordsoflife.tistory.com/33" style="color:#0FA678" target="_blank">RestTemplate에서 List 다루기</a>

앞서 만든 정보를 담을 DTO 를 배열로 선언해 파싱하면 전부 저장이 된다.

## 🍱 가져온 정보 DB 에 저장하기

메타 데이터가 필요할 때 마다 불러올 수는 없으니 한 번 불러와 DB 에 저장하고 사용하도록 한다.

그러기 위해서 먼저 Entity 를 생성한다.

**/domain/MatchType.java**

```java
package com.fifaonline.tmi.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Getter
@NoArgsConstructor
@Entity
public class MatchType {

    @Id
    @Column
    private int matchType;

    @Column
    private String desc;

    @Builder
    public MatchType(int matchType, String desc) {
        this.matchType = matchType;
        this.desc = desc;
    }
}
```

이제 정보도 가져왔고 Entity 도 만들었으니 DTO 배열을 돌면서 DB 에 저장만 하면 된다.

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

    public void matchTypeSave(MatchTypeDto[] matchTypeDtoArray) {
        for (MatchTypeDto val : matchTypeDtoArray) {
            matchTypeRepository.save(val.toEntity());
        }
    }
}
```

아까 받아온 정보를 배열에 저장하고, 배열을 반복하며 DTO 객체를 Entity 로 만들어 저장하는 방식이다.

저장이 완료 됐으면 H2DB 콘솔로 들어가 잘 저장됐는지 확인하자.

<img src="https://user-images.githubusercontent.com/54533309/107377448-54c81b00-6b2e-11eb-9169-bfdbf640cf9e.png" alt="스크린샷 2021-02-09 오후 11 27 07" width="450" />

저장이 잘 된 것을 볼 수 있다.

이제 검색을 해서 매치 종류를 가져와 사용하면 된다.

다른 메타 데이터도 위와 같이 동일한 방법으로 저장하고 사용하면 된다.

## 📬 정리

처음엔 프론트단에서 받아와 어떻게 사용을 해 볼까 했지만 CORS 에러가 계속 발생했다.

넥슨에 문의를 하니 CORS 를 해제 해주었다고 하긴 했는데.. 그래도 여전히 에러가 발생했다.

그래서 서버단에서 받아와 바로 DB 에 저장하도록 했는데 이 방법이 맞는 방법 같다.

내가 원하는대로 정보를 DB 에 저장해서 아주 아주 재밌었다.

이제 division 메타 데이터도 가져와 저장하고 유저 최고 기록을 매핑해 정상적으로 출력하면 된다.

<a href="https://github.com/Nam-Ki-Bok/FIFA-Online-TMI" style="color:#0FA678" target="_blank">Github</a>

<br>