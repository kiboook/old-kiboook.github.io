---
title:  "[Java] 싱글톤 패턴(Singleton pattern) 구현"
excerpt: ""

categories:
  - Java

tags:
---

## 🍣 Singleton Pattern

객체 지향 프로그램에서 인스턴스를 하나만 생성하는 디자인 패턴이다.

프로그램을 만들다 보면 하나의 인스턴스만 필요한 경우가 있는데 이때 사용한다.

예를들어 회사 직원들을 객체 지향 프로그램으로 구현하는 경우 직원 객체는 여러 개가 필요하지만 회사 객체는 하나만 있으면 된다.

이럴때 회사 객체에 싱글톤 패턴을 적용하면 된다.

## 🍕 Singleton Pattern 구현

**Step 1**

```java
package singleton;

public class Company {
    private Company() {}
}
```

외부 클래스가 Company 객체를 생성 할 수 없게 생성자를 Private 로 지정해준다.

이렇게 해주지 않으면 컴파일러가 dafault 생성자를 Public 으로 만들어버리기 때문에 **꼭** 지정해줘야한다.

<br>

**Step 2**

```java
package singleton;

public class Company {
  
    private static Company instance = new Company();
    private Company() {}
}
```

생성자를 Private 로 지정해주었다면 인스턴스 한 개를 생성한다.

지금 만든 인스턴스가 프로그램 전체에서 유일한 인스턴스가 된다.

<br>

**Step 3**

```java
package singleton;

public class Company {

    private static Company instance = new Company();
    private Company() {}

    public static Company getInstance() {
        if (instance == null) {
            instance = new Company();
        }
        return instance;
    }
}
```

마지막으로 외부 클래스에서 인스턴스를 가져올 수 있는 Public 함수인 **getInstance** 함수를 만들어 준다.

getInstance 함수는 static 함수이기 때문에 외부에서 별도의 클래스 생성 없이 바로 사용 할 수 있다.

<br>

**Step 4**

```java
package singleton;

public class Main {

    public static void main(String[] args) {
        Company company1 = Company.getInstance();
        Company company2 = Company.getInstance();

        System.out.println(company1);
        System.out.println(company2);
        System.out.println(company1 == company2);
    }
}
```

마지막으로 Company1, Company2 가 같은 인스턴스를 가리키고 있는지 확인해보면 된다.

위 main 함수를 실행 해 본다면 같은 인스턴스를 가리키고 있다는 것을 알 수 있다.

<br>