---
title:  "[How To] git add 취소하기"
excerpt: ""

categories:
  - How To

tags:
---

## 🔥 git add 취소

git add 를 하다가 나도 모르게 git add . 을 통해 수정 된 모든 파일을 add 해버린적이 있다.

<img width="407" alt="git add ." src="https://user-images.githubusercontent.com/54533309/92470243-22c62c00-f211-11ea-8c45-3ca4013fc355.png">

<br>

**2020-09-09-200908TDL.md** 는 아직 add 하고 싶지 않은데 어떻게 취소 할 수 있을까 ?

**git reset HEAD [파일명]** 을 통해 취소 할 수 있다. 파일명을 입력하지 않으면 add 된 모든 파일이 취소된다.

<img width="450" alt="git reset HEAD" src="https://user-images.githubusercontent.com/54533309/92470652-bb5cac00-f211-11ea-8c44-b2d0189ab1b5.png">

commit, push 를 취소하는 방법도 있는데 거기까지는 아직 경험 할 일이 없었으니 언젠가 취소 할 일이 생기면 그때 정리해야겠다.