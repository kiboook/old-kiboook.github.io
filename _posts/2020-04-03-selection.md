---
title:  "[Algorithm] 선택정렬 - Selection Sort"
excerpt: ""

categories:
  - Algorithm

tags:
  - selection
  - sort
  - 선택정렬
---

- ## Selection Sort

  삽입정렬은 위치를 찾아 넣어줬다면

  선택정렬은 삽입할 위치를 정한 후 그 위치에 들어갈 값을 찾아 넣어준다.

  ![](https://nam-ki-bok.github.io/assets/images/algorithm/selection.png)

  위 이미지는 **<span style="color:red">sortLoc</span>**를 통해 삽입할 위치를 정하고

  <span style="color:red">**minLoc**</span>를 통해 최솟값 위치를 찾아 Swap 해주는 방식이다.

  <br>

  코드로 보자면
  
  ```c
  void selectionSort(int *arr, int arrSize) {
      int j, sortLoc, minLoc, tmp;
    // arrSize - 1 만큼 반복하면 정렬 완성
      for(sortLoc = 0; sortLoc < arrSize - 1; sortLoc++) {
        minLoc = sortLoc;
          for(j = sortLoc; j < arrSize; j++) {
              if(arr[minLoc] > arr[j])
                  minLoc = j;
          }
          // 정렬할 위치와 최솟값의 위치가 다른 경우에만 swap 한다
          if(minLoc != sortLoc){
              tmp = arr[minLoc];
              arr[minLoc] = arr[sortLoc];
              arr[sortLoc] = tmp;
          }
      }
  }
  ```
  
  내림차순으로 정렬하고 싶다면 최솟값 찾는 부분을 최댓값으로 바꾸기만 하면 된다.
  
  아주아주 기본 정렬방법인 선택정렬과 삽입정렬을 알아 보았다.
  
  다음에는 처음 배울때 아주아주 헷갈려 이해가 가지 않았던 Merge Sort를 정리해 보겠다.

