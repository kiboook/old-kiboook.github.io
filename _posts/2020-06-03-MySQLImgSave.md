---
title:  "[How To] MySQL에 이미지 저장 후 출력하는 방법"
excerpt: ""

categories:
  - How To

tags:
  - MySQL
  - Java
---

## MySQL에 이미지 저장

학교 프로젝트를 하던 중 MySQL 에 이미지를 저장 할 일이 생겼다.

이때까지 데이터베이스에 이미지를 저장 할 생각은 해본 적이 없어서 처음에는 당황스러웠다.

구글링을 해 본 결과 BLOB 이라는 자료형을 사용하면 된다고 했다.

하지만 BLOB 는 용량도 적을 뿐 더러 많은 이미지가 저장되면 성능이 아주 느려진다고 했다.

그래서 이미지 경로를 VARCHAR() 로 저장하고 필요한 경우에 사용하는 방법을 택하기로 했다.

## Java 를 통한 이미지 출력

이미지를 저장만 하면 무슨 의미가 있을까 !

자바를 통해 데이터베이스에 저장한 이미지를 출력해보도록 하자.

```java
data = stmt.executeQuery("select * from Car");
Image image = null;
String urlStr="";
				
while(data.next()) {
	urlStr = rs.getString(5);
	}
				
// URL로 부터 이미지 읽기
URL url = new URL(urlStr);
image = ImageIO.read(url);
JLabel carLabel = new JLabel(new ImageIcon(image));
		        
panel.add(carLabel);
```

코드의 일부분만 가져왔다.

Car 테이블에서 이미지 URL 을 가져온 후 label 로 만들어 panel 에 넣어줬다.

어떻게 디자인 하는 지는 본인 마음이다.

이렇게 하면 아주 간단하게 데이터베이스에 저장 된 이미지를 출력 할 수 있다.