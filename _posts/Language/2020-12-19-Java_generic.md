---
title:  "[Java] 제네릭(Generic) 프로그래밍"
excerpt: ""

categories:
  - Java

tags:
---

## 🥗 Generic

우리가 프로그래밍을 할 때 선언하는 변수는 모두 각자의 자료형을 가지고 있다.

정수를 저장하고 싶으면 int, 문자열을 저장하고 싶으면 String 처럼 말이다.

완전히 기능은 동일하지만 어떤 메소드는 정수를 사용하고, 어떤 메소드는 문자열을 사용한다면 우리는 메소드 두 개를 만들어야 한다.

하지만 변수나 메소드의 자료형을 필요에 따라 바꿀 수 있다면 메소드를 한 개만 만들어도 될 것이다.

이처럼 어떤 값이 하나의 자료형이 아닌 여러가지 자료형을 사용할 수 있도록 프로그래밍 하는 것을 **제네릭 프로그래밍** 이라고 한다.

## 🍟 Generic 프로그래밍

리플렉션이나 템플릿 메소드나 싱글톤이나.. 이런 기법들은 글로 설명을 보는 것 보다

직접 예시를 가지고 코딩을 해보는 것이 더 이해하기가 쉽다.

다음은 여러가지 재료를 가지고 프린팅을 해주는 3D 프린터를 제네릭 프로그래밍으로 구현한 예시이다.

```java
package generic;

public class Printer <T> {
    public T material;

    public void setMaterial(T material) {
        this.material = material;
    }

    public T getMaterial() {
        return material;
    }

    public String toString() {
        return this.material.toString();
    }
}
```

우선 Printer 클래스 선언부를 보게 되면 **\<T\>** 라고 뒤에 무언가가 더 붙어있다.

다이아몬드 연산자와 안에 적절한 알파벳을 써주면 제네릭 클래스를 만들 수 있다.

내가 사용 할 자료형이 T 위치에 들어가 수행된다고 생각하면 된다.

물론 다이아몬드 연산자 안에 내가 알아보기 쉬운 문자를 적어도 된다.

하지만 자바 컨벤션을 보게 되면 이런식으로 작성하게 규칙을 정해주었다.

<img width="497" alt="스크린샷 2020-12-20 오전 12 03 36" src="https://user-images.githubusercontent.com/54533309/102692471-d0a49600-4256-11eb-9ed9-350ea2ee2fb9.png">

---

다음으로 프린터에 사용 될 재료인 Powder, Plastic 클래스를 만들어 보자.

```java
package generic;

public class Powder {
    public String toString() {
        return "사용 된 재료는 Powder 입니다.";
    }
}
```

```java
package generic;

public class Plastic {
    public String toString() {
        return "사용 된 재료는 Plastic 입니다.";
    }
}
```

만약 Printer 클래스를 제네릭 클래스로 만들지 않았더라면 이 두 가지 재료를 사용하는 프린터를 각각 구현해야 했을 것 이다.

아니면 자료형 T 로 선언되어 있는 부분을 Object 로 만들어 구현 할 수 있다.

하지만 이렇게 구현한다면 **set** 을 하는 경우는 자식에서 부모로 업 캐스팅이 자동으로 되지만

**get** 을 하는 경우에는 Object 클래스에서 각각의 재료 클래스로 다운 캐스팅을 직접 해주어야 하기 때문에 굉장히 번거롭다.

---

```java
package generic;

public class Main {
    public static void main(String[] args) {
        Printer<Powder> powderPrinter = new Printer<>();
        powderPrinter.setMaterial(new Powder());
        System.out.println(powderPrinter);

        Printer<Plastic> plasticPrinter = new Printer<>();
        plasticPrinter.setMaterial(new Plastic());
        System.out.println(plasticPrinter);
    }
}
```

프린터를 생성 할 때 **printer\<Powder\>** 과 같이 **T** 의 자료형을 정해주면 된다.

생략을 해도 컴파일러가 추측을 해서 정해주지만.. 경고의 주황색 밑줄이 쳐지니 되도록이면 자료형을 정해주자.

그리고 프로그램을 실행시켜보면 하나의 프린터 클래스를 가지고 여러가지 재료를 사용 할 수 있게 되었다.

<img width="268" alt="스크린샷 2020-12-20 오전 12 11 28" src="https://user-images.githubusercontent.com/54533309/102692630-e9fa1200-4257-11eb-879c-c61bcf6fd391.png">

---

마지막으로 제네릭 클래스에서는 **static** 변수나 메소드를 만들 수 없다.

이유는 제네릭 클래스는 위 코드와 같이 자료형이 정해지는 순간 인스턴스가 생성 된다.

하지만 **static** 은 인스턴스를 생성하지 않고도 접근할 수 있는 자료형이기 때문에 만들 수 없는 것 이다.

그리고 **Printer\<T\>** 에 사용 할 자료형을 제한하는 **Printer\<T extends>** 기법도 있다.

<br>

