---
title:  "[FIFA Online TMI] 넥슨 Open API로 유저 구매 내역 출력하기"
excerpt: ""

categories:
  - Spring

tags:
---

## 🫕 유저 거래 내역 조회 페이지

![스크린샷 2021-02-19 오후 10 00 53](https://user-images.githubusercontent.com/54533309/108507607-f2290900-72fd-11eb-894e-9229ee88ecbf.png)

유저 거래 내역을 조회 할 수 있는 페이지도 완성을 했다.

우선 구매 기록을 누르면 유저의 구매 기록을 볼 수 있게 만들어 보려고 한다.

전체적인 흐름은 구매 기록 버튼 &rarr; IndexController &rarr; UserService &rarr; UserApiClient 로 이어진다.

UserApiClient 가 구매 기록을 가져와 DTO 로 넘겨주게 된다.

## 🥟 유저 구매 기록 가져오기

**/web/IndexController.java**

```java
	...

@RequiredArgsConstructor
@Controller
public class IndexController {
    private final UserService userService;
  
	...
      
    @GetMapping("/user/trade/record/buy/{nickname}")
    public String userTradeBuyRecord(@PathVariable String nickname, Model model) {
        BuyRecordResponseDto[] buyRecordResponseDtoArray = userService.requestBuyRecord(nickname);
        model.addAttribute("record", buyRecordResponseDtoArray);
        return "user-trade-record-buy";
    }
}
```

구매 기록 버튼을 누르면 GET 요청을 보내고 구매 내역을 DTO 배열로 가져온다.

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
    private final DivisionRepository divisionRepository;
    private final PlayerRepository playerRepository;

	...

    public BuyRecordResponseDto[] requestBuyRecord(String nickname) {
        String accessId = requestUserAccessId(nickname);
        return userApiClient.requestBuyRecord(accessId);
    }
}
```

<br>

**/api/UserApiClient.java**

```java

	...
    
@RequiredArgsConstructor
@Service
public class UserApiClient {
    private final MatchTypeRepository matchTypeRepository;
    private final DivisionRepository divisionRepository;
    private final RestTemplate restTemplate;

    @Inject
    private ApiKey apiKey;
	
  ...
    
    public BuyRecordResponseDto[] requestBuyRecord(String accessId) {
        BuyRecordResponseDto[] buyRecordResponseDtoArray = null;

        final String UserBuyRecordUrl =
                "https://api.nexon.co.kr/fifaonline4/v1.0/users/{accessid}/markets?tradetype=buy&offset=0&limit=7";
        final HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Authorization", apiKey.getKey());
        final HttpEntity<String> entity = new HttpEntity<>(httpHeaders);

        try {
            buyRecordResponseDtoArray =
                    restTemplate.exchange(UserBuyRecordUrl, HttpMethod.GET, entity,
                            BuyRecordResponseDto[].class, accessId).getBody();
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        assert buyRecordResponseDtoArray != null;
        for (BuyRecordResponseDto val : buyRecordResponseDtoArray) {
            String valSpid = val.getSpid();
            String imgUrl = null;
            val.setTradeDate(val.getTradeDate().split("T")[0]);
            val.setValue(NumberFormat.getInstance().format(Long.valueOf(val.getValue())));
            try {
                restTemplate.getForEntity(
                        "https://fo4.dn.nexoncdn.co.kr/live/externalAssets/common/playersAction/p{spid}.png",
                        String.class, valSpid);
                imgUrl = "https://fo4.dn.nexoncdn.co.kr/live/externalAssets/common/playersAction/p" + valSpid + ".png";
                val.setSpid(imgUrl);
            } catch (Exception e1) {
                try {
                    restTemplate.getForEntity(
                            "https://fo4.dn.nexoncdn.co.kr/live/externalAssets/common/players/p{spid}.png",
                            String.class, valSpid);
                    imgUrl = "https://fo4.dn.nexoncdn.co.kr/live/externalAssets/common/players/p" + valSpid + ".png";
                    val.setSpid(imgUrl);
                } catch (Exception e2) {
                    val.setSpid("https://user-images.githubusercontent.com/54533309/108505829-58605c80-72fb-11eb-963d-eaf02f050f34.png");
                }
            }
        }
        return buyRecordResponseDtoArray;
    }
}
```

구매 내역을 받아오는 과정이 조금 복잡하다.

원래대로라면 구매 내역은 거래 날짜, 거래 고유 번호, 선수 아이디, 선수 등급, 가격으로 구성되어있다.

여기서 사용자에게 보여 줄 정보는 거래 날짜, 선수 아이디, 선수 등급, 가격이다.

그런데 선수 아이디로 보여 줄 경우 어떤 선수인지 사용자는 알 수가 없다.

따라서 선수 아이디를 사용자가 잘 알아 볼 수 있도록 바꿔줘야한다.

처음엔 선수 아이디와 선수 이름으로 저장되어있는 메타 데이터를 가져와 매핑하려고 했다.

그런데 이 메타 데이터가 4만개가 넘는다..

그래서 선수 아이디를 통해 그 선수의 이미지를 가져와 넣어주기로 했다.

선수 이미지도 액션샷 이미지와 기본 이미지 두 개로 나누어져 있는데 액션샷이 없거나 기본 이미지가 없는 경우가 있다.

물론 두 가지 다 없는 경우도 있었다.

따라서 try catch 로 존재하는 이미지를 넣어주었고 둘 다 존재하지 않는다면 예외 처리 이미지를 넣어주었다.

<br>

**templates/user-trade-record-buy.mustache**

```html
{>layout/header}

<h1 style="text-align: center">구매 기록</h1>

<div class="container" style="margin-top: 50px;">
    <table class="table table-hover table-striped table-bordered">
        <thead class="thead-strong table-head">
        <tr>
            <th>구매 날짜</th>
            <th>선수</th>
            <th>강화 등급</th>
            <th>BP</th>
        </tr>
        </thead>
        <tbody id="tbody">
        {#record}
            <tr>
                <td>{tradeDate}</td>
                <td><img src="{spid}" style="width: 80px; height: 80px; margin-right: 10px;" alt="선수 이미지가 없습니다!"></td>
                <td>{grade}</td>
                <td>{value}</td>
            </tr>
        {/record}
        </tbody>
    </table>
</div>
{>layout/footer}
```

ApiClient 에서 spid 자체를 이미지 URL 로 변경 해주었기 때문에 바로 이미지 태그 주소로 넣어준다.

이렇게 하면 유저 거래 내역을 조회 하고, 선수 아이디는 해당 선수 이미지로 바꿔 주는 작업이 완료 된다.

## 📬 정리

![스크린샷 2021-02-20 오후 8 44 54](https://user-images.githubusercontent.com/54533309/108594291-7e016a80-73bc-11eb-91ea-a6a82fe93ac7.png)

판매 기록까지 완성한 뒤 거래 내역을 더 많이 가져오고 페이지를 나누는 과정까지 해야겠다.

<a href="https://github.com/Nam-Ki-Bok/FIFA-Online-TMI" style="color:#0FA678" target="_blank">Github</a>

<br>