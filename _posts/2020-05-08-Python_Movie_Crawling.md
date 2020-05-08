---
title:  "[Python] 크롤링 난생 처음 해보기"
excerpt: ""

categories:
  - Python

tags:
  - Crawling
  - BeautifulSoup4
  - requests
---

## 크롤링 난생 처음 해보기

어제 크롤링 할 모든 준비를 마쳤다. 이제 써먹어 보자!!

하지만 나는 크롤링을 하~나도 모르고 처음 해보는 입장이다.

그래서 일단 검색을 통해 어떻게 긁어 오는지 익히기로 했다.

```python
from bs4 import BeautifulSoup
import requests

html = requests.get('https://search.naver.com/search.naver?query=날씨')
# 웹페이지 요청을 하는 코드이다. 특정 url을 적으면 웹피이지에 대한 소스코드들을 볼 수 있다.

soup = BeautifulSoup(html.text, 'html.parser')
#파이썬에서 보기 좋게, 다루기 쉽게 파싱작업을 거쳐야 각 요소에 접근이 쉬워진다.
#이것을 도와주는게 beautifulsoup4 모듈이다.

data1 = soup.find('div', {'class':'weather_box'})
#soup 모듈의 find 함수를 사용해서 data1에 값을 저장한다.
#매개변수에는 div 태그명과 class 라는 속성의 값이 weather_box라는 녀석을 딕셔너리로 저장하는 코드이다.
#find 함수를 사용할 때 주의할 점은 같은 웹페이지 소스코드에 같은 소스가 여러가지 있으면 맨 처음 탐색된것만 반환하고 나머지는 무시된다는 점이다.

find_address = data1.find('span', {'class':'btn_select'}).text
print('현재 위치: '+find_address)
#data1 변수에 저장된 정보중 span 태그명과 btn_select라는 속성값을 갖고 있는 녀석을 딕셔너리로 저장하는 코드이다.

find_currenttemp = data1.find('span',{'class': 'todaytemp'}).text
print('현재 온도: '+find_currenttemp+'℃')

data2 = data1.findAll('dd')

find_dust = data2[0].find('span', {'class':'num'}).text
find_ultra_dust = data2[1].find('span', {'class':'num'}).text
find_ozone = data2[2].find('span', {'class':'num'}).text
print('현재 미세먼지: '+find_dust)
print('현재 초미세먼지: '+find_ultra_dust)
print('현재 오존지수: '+find_ozone)
```

<a href="https://velog.io/@magnoliarfsit/%ED%8C%8C%EC%9D%B4%EC%8D%AC-%EC%9B%B9-%ED%81%AC%EB%A1%A4%EB%A7%81-2-%EB%84%A4%EC%9D%B4%EB%B2%84-%EB%82%A0%EC%94%A8-%ED%81%AC%EB%A1%A4%EB%A7%81%ED%95%98%EA%B8%B0" style="color:green;" target="_blank">출처</a> 를 통해 기본을 아주 잘 익히게 되었다. 출처에 들어 가 본다면 이 코드에 관한 상세한 설명이 더 되어있다.

내가 크롤링을 공부하면서 느낀 큰 틀은 내가 원하는 페이지의 코드를 가져와 파싱을 한 후 내가 원하는 부분을 골라 출력하는 것.

말로 하면 엄청 간단하다.. 

위 코드를 실행 하면 현재 위치, 온도, 미세먼지, 초미세먼지, 오존지수를 알려준다.

> <pre>현재 위치: 경기도 성남시 수정구 위례동
> 현재 온도: 15℃
> 현재 미세먼지: 57㎍/㎥
> 현재 초미세먼지: 28㎍/㎥
> 현재 오존지수: 0.008ppm</pre>

진짜 처음 실행 시키고 엄청 신기했다.

하지만 내가 직접 짠 코드가 아니고 다른 사람의 코드를 통해 어떻게 돌아가는지 익히기만 했기 때문에

내가 직접 짜보고 싶은 욕구가 생겼다 !!