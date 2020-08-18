---
title:  "[How To] MySQL Workbench Syntax 색 변경"
excerpt: ""

categories:
  - How To

tags:
  - MySQL
  - workbench
---

- ## Workbench Syntax 색 변경

  앞서 다크모드가 적용된 workbench에서 syntax 색을 어울리게 변경하려고 꽤 노력을 했다.

  결론은 라이트모드로 바꾸는게 훨씬 나아서 라이트모드로 바꿨지만..

  syntax 색 변경은 preferences를 통해 바꿀 수 없다.

  Applications/MySQLWorkbench.app/Contents/Resources/data 경로를 통해

  code_editor.xml 파일을 클릭 한 후 아래 코드 부분을 수정하면 된다.

  나같은 경우 라이트 모드에서 주석이 파란색으로 표시되어 초록색으로 바꿨다.

```xml
 <style id="0" fore-color-light="#284444" fore-color-dark="#808a8c" /> <!-- SCE_MYSQL_DEFAULT -->

    <style id="1" fore-color-light="#136d13" fore-color-dark="#0a99e5" /> <!-- SCE_MYSQL_COMMENT -->
    <style id="2" fore-color-light="#136d13" fore-color-dark="#0a99e5" /> <!-- SCE_MYSQL_COMMENTLINE -->
    <style id="21" back-color-light="#F0F0F0" back-color-dark="#404040" /> <!-- SCE_MYSQL_HIDDENCOMMAND -->

    <style id="3" fore-color-light="#63bf8d" fore-color-dark="#63bf8d" /> <!-- SCE_MYSQL_VARIABLE -->
    <style id="4" fore-color-light="#45aa73" fore-color-dark="#45aa73" /> <!-- SCE_MYSQL_SYSTEMVARIABLE -->
    <style id="5" fore-color-light="#45aa73" fore-color-dark="#45aa73" /> <!-- SCE_MYSQL_KNOWNSYSTEMVARIABLE -->

    <style id="6" fore-color-light="#cc6c00" fore-color-dark="#e57a00" /> <!-- SCE_MYSQL_NUMBER -->
    <style id="12" fore-color-light="#dd7a00" fore-color-dark="#f28600" /> <!-- SCE_MYSQL_SQSTRING -->
    <style id="13" fore-color-light="#dd7a00" fore-color-dark="#f28600" /> <!-- SCE_MYSQL_DQSTRING -->

    <style id="7" bold="Yes" fore-color-light="#007FBF" /> <!-- SCE_MYSQL_MAJORKEYWORD -->
    <style id="8" bold="Yes" fore-color-light="#007FBF" /> <!-- SCE_MYSQL_KEYWORD -->
    <style id="15" fore-color-light="#7d7d63" fore-color-dark="#7db27d" /> <!-- SCE_MYSQL_FUNCTION -->
    <style id="10" fore-color-light="#7d7d63" fore-color-dark="#7db27d" /> <!-- SCE_MYSQL_PROCEDUREKEYWORD -->
    <style id="14" bold="Yes" /> <!-- SCE_MYSQL_OPERATOR -->

    <style id="16" fore-color-light="#000000" fore-color-dark="#FFFFFF" /> <!-- SCE_MYSQL_IDENTIFIER -->
    <style id="17" fore-color-light="#993a3e" fore-color-dark="#e5454c" /> <!-- SCE_MYSQL_QUOTEDIDENTIFIER -->

    <style id="22" fore-color-light="#FFFFFF" back-color-light="#A0A0A0" fore-color-dark="#000000" back-color-dark="#404040" bold="Yes" /> <!-- SCE_MYSQL_PLACEHOLDER -->

    <style id="18" fore-color-light="#007F00" fore-color-dark="#00b200" bold="yes"/> <!-- SCE_MYSQL_USER1 -->
```

