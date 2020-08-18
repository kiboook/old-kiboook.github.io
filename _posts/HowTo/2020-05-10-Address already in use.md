---
title:  "[How To] Address already in use"
excerpt: ""

categories:
  - How To

tags:
  - Flask
---

# Address already in use

---

플라스크와 몽고를 이용하여 웹에 데이터를 출력 하는 도중 !

잘 실행되던 코드가 갑자기 Address already in use 라며 에러가 발생했다.

http://127.0.0.1:5000/ 이 주소를 사용하고 있었는데 말이다 !

이때 약간 느낌이 왔다.. 코드를 수정한 후 재 실행 하기 전에 cmd + c 를 통해 연결을 끊어주지 못한 것이다.

그래서 이미 수정 하기 전 코드가 주소를 사용하고 있었던 것이다.

터미널을 실행시켜 **lsof -i :5000**  입력해 보자. 5000 port를 사용하고 있는 프로세스를 알려준다.

역시나 파이썬이 잡아먹고 있었다 ! 그리고 해당 Pid를 잘 기억하고 있자 종료할때 필요하다.

**sudo kill -9 pid** 를 입력해 종료 시킨 후 다시 코드를 실행 시켜보면 잘 돌아갈 것 이다.