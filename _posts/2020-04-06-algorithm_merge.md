---
title:  "[Algorithm] 병합정렬 - Merge Sort"
excerpt: ""

categories:
  - Algorithm

tags:
  - merge
  - sort
  - 병합정렬
---

- ## Merge Sort

  병합정렬은 배열의 크기가 1이 될 때 까지 분할한 후 다시 합치면서 정렬하는 방식이다.

  분할정복 알고리즘 중 하나라고 할 수 있다.

  - ###### 분할정복 알고리즘

    분할정복 알고리즘은 말 그대로 이해 하면 된다.

    어떠한 문제를 아주 작게 분할 해서 해결하며 합치는 알고리즘이다.

    여기서는 정렬 해야 할 배열들을 아주 작게 분할 해서 정렬하며 합친다고 생각하면 된다.

  <br>
  
  <img src="https://nam-ki-bok.github.io/assets/images/algorithm/merge.png" style="zoom:85%;" />
  
  위 그림을 본다면 더욱 이해가 잘 될 것이다.
  
  하지만 이론적으로는 이해가 가도 코드로 옮기려고 하면 생각보다 어렵다.
  
  재귀를 완벽히 이해하고 있어야 하는데 처음 코딩할땐 꽤 애를 먹었다.
  
  <br>
  
  병합정렬은 리스트나 배열을 이용하는 방법이 있다.
  
  여기서는 배열을 이용하는 방법을 소개하도록 하겠다.
  
  ```c
  #define MAX_SIZE 100000
  void mergeSort (int *arr, int left, int mid, int right) {
      int tmpArr[MAX_SIZE];
      int i, j, loc;
      loc = i = left;
      j = mid + 1;
      
      // 왼쪽 배열을 다 옮기거나
      // 오른쪽 배열을 다 옮길때까지 반복
      while ((i <= mid) && (j <= right)) {
          if (arr[i] <= arr[j]) {
              tmpArr[loc++] = arr[i++];
          }
          else {
              tmpArr[loc++] = arr[j++];
          }
      }
      
      // 오른쪽 배열을 다 옮긴 경우
      // 나머지 왼쪽 배열을 전부 옮긴다
      if (i <= mid) {
          while (i <= mid) {
              tmpArr[loc++] = arr[i++];
          }
      }
      
      // 왼쪽 배열을 다 옮긴 경우
      // 나머지 오른쪽 배열을 전부 옮긴다
      if (j <= right) {
          while (j <= right) {
              tmpArr[loc++] = arr[j++];
          }
      }
      
      // 임시 배열에서 본 배열로 복사한다
      for (i = left; i <= right; i++) {
          arr[i] = tmpArr[i];
      }
      
  }
  
  void merge (int *arr, int left, int right) {
      int mid = (left + right) / 2;
      
      if (mid < right) {
          merge(arr, 0, mid); // 왼쪽 배열 분할
          merge(arr, mid+1, right); // 오른쪽 배열 분할
          mergeSort(arr, left, mid, right); // 왼쪽, 오른쪽 배열 정렬
      }
  }
  ```
  
  배열을 사용하여 병합정렬을 할 땐 추가 배열이 필요하다.
  
  추가 배열에 정렬을 미리 해준 후 본 배열에 복사를 해주는 과정이 필요하기 때문이다.
  
  따라서 크기가 아주 큰 데이터를 정렬 하는 경우에는 리스트를 사용하는 것이 저장공간에 낭비가 없다.
  
  
