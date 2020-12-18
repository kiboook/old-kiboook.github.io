---
title:  "[Java] Reflection 프로그래밍"
excerpt: ""

categories:
  - Java

tags:
---

## 🍪 Reflection

자바의 모든 클래스, 인터페이스는 컴파일 과정을 거치면 class 파일이 생성된다.

example.java 파일이 컴파일 되면 example.class 파일이 생성되는 것이다.

이 class 파일은 example 클래스에 대한 생성자, 필드, 메소드 정보를 모두 가지고 있다.

밑의 코드를 보면 정보를 모르는 클래스의 메소드는 사용 할 수 없다..

```java
package reflection

class Person {
    void printPersonInfo() {
        System.out.println("I'm Person");
    }
}

public class Main {
    public static void main(String[] args) {
        Object person = new Person();
        person.printPersonInfo();  // 컴파일 에러
    }
}
```

Object 로 인스턴스를 만들 수는 있지만, person 객체는 Object 클래스에 구현되어있는 메소드 밖에 사용을 못 한다.

때문에 클래스에 대한 정보가 없다면 그 클래스의 메소드를 실행할 수 없는 것이다.

**리플렉션 프로그래밍**은 이 class 파일에 대한 정보를 읽어와 내가 그 클래스에 대한 정보가 없더라도 접근 할 수 있게 한다.

## 🎂 Reflection 프로그래밍

앞서 class 파일은 생성자, 필드, 메소드 정보를 가지고 있다고 했다.

그렇다면 어떻게 class 파일을 읽어 가져올 수 있을까?

**java.lang.String** 클래스를 가져와 정보를 읽어보자.

```java
package chapter5.reflection;

import java.lang.reflect.*;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException {
        Class strClass = Class.forName("java.lang.String");

        Constructor[] cons = strClass.getConstructors();
        for (Constructor val : cons) {
            System.out.println(val);
        }
    }
}
```

 <br>

<img width="600" alt="스크린샷 2020-12-18 오후 10 54 07" src="https://user-images.githubusercontent.com/54533309/102622113-f0b75500-4183-11eb-9eb1-f2085d0ef715.png">

실행을 하게 되면 java.lang.String 클래스 안에 있는 모든 생성자를 보여준다.

이와 같은 방법으로 **getConstructors** 대신 **getFields, getMethods** 메소드를 사용하면 필드, 메소드를 읽어 올 수 있다.

---

그렇다면 이제 아까 컴파일 에러가 발생했던 person 클래스를 수정해보자.

```java
package reflection;

class Person {
    void printPersonInfo() {
        System.out.println("I'm Person");
    }
}

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
        Class personClass = Class.forName("reflection.Person");
        Person person = (Person) personClass.newInstance();
        person.printPersonInfo();
    }
}
```

Class 클래스에는 **newInstance** 라는 메소드를 제공하는데

이 메소드는 가져온 클래스 정보를 바탕으로 디폴드 생성자를 통해 인스턴스를 만들어준다.

대신 Object 형으로 반환을 해주기 때문에 다운 캐스팅을 해주어야 한다.

이렇게 클래스 정보를 가져와 Object 형으로 인스턴스를 생성 후 다운 캐스팅을 해준 다음 클래스를 사용하면 된다.

그런데 내가 공부하고 있는 책은 JAVA 8을 기준으로 설명을 해주었는데 JAVA 14로 코딩을 해보니 newInstance 에 취소선이 그어져있다..

newInstance 메소드가 사라질 수도 있겠다..

---

이런 방식으로 코딩을 하게 되면 프로그램 실행 이후 필요한 클래스만 가져 올 수 있다.

```java
package reflection;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
    		String driverName = "내가 필요한 드라이버"
        Class personClass = Class.forName(driverName);
    }
}
```

만약 이 프로그램이 MySQL, Oracle, Mongo 데이터베이스를 연결한다고 해보자.

이 때 프로그램을 실행하면서 모든 데이터베이스 드라이버를 로딩할 필요는 없다.

**driverName** 만 상황에 맞게 정해주고 드라이버 정보를 가져와 로딩하면 된다.

<br>

