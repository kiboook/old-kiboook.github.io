---
title:  "[Algorithm] 삽입정렬 - Insertion Sort"

categories:
  - Algorithm

tags:
  - insertion
  - sort
  - 삽입정렬
---

- ## Insertion Sort

  지금까지 배운 정렬 방법들을 정리해보려고 한다.

  다른 블로그를 보면 시간복잡도 등등 아주 자세히 설명하고 있다.

  하지만 나는 아직 남에게 가르쳐 줄 정도는 아니기 때문에 복습용으로 정리하고 있다.

  그래서 아주 간단하게 개념이랑 코드 정도만 소개하려고 한다.

  <br>

  그 중 첫번째는 <span style="color:darkolivegreen">**삽입정렬**</span>이다.

  종종 선택정렬과 삽입정렬이 헷갈릴때가 있다.

  물론 정렬만 된다면 어떤 정렬을 써도 상관 없지만, 시간복잡도의 최고 효율을 위해선

  상황에 맞는 정렬을 써야 할 것이다.
  
  <br>
  
  삽입정렬은 말 그대로 앞에서 부터 비교를 해 자신의 위치에 삽입 하는 정렬이다.
  
  역시 말로만 쓰면 엄청 쉬워 보인다. 물론 다른 정렬에 비해 쉽긴 하지만
  
  잘 익혀두자 !
  
  <br>
  
  ![](https://nam-ki-bok.github.io/assets/images/algorithm/insertion.png)
  
  위 사진이 아주아주 간단하게 표현 한 삽입정렬이다.
  
  왼쪽에서 부터 <span style="color:red">**KEY**</span>값을 정해 그 <span style="color:red">**KEY**</span>값의 위치를 찾아 삽입하는 것 이다.
  
  <br>
  
  코드로 보자면
  
  ```c
  void insertionSort(int *arr, int arrSize) {
      int i, j, key;
      
      // 배열의 원소 개수 - 1 만큼 반복한다.
      for(i = 1; i < arrSize; i++) {
          key = arr[i];
          for(j = i - 1; j >= 0; j--) {
              if(key < arr[j]) {
                  arr[j+1] = arr[j]; // key 값 보다 크다면 오른쪽으로 한칸 이동
              
              else
                  break;
          }
          arr[j+1] = key; // 비교 후 j 값은 key 값이 삽입될 위치 - 1 이 되므로
  
      }
  }
  ```
  
  

