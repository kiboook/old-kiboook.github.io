---
title:  "[Programmers] 메뉴 리뉴얼"
excerpt: ""

categories:
  - Quiz

tags:
---

## 메뉴 리뉴얼

<a href="https://programmers.co.kr/learn/courses/30/lessons/72411" style="color:#0FA678">메뉴 리뉴얼</a> 을 클릭하면 바로 이동한다.

손님들이 주문한 메뉴를 가지고 조합을 만들고 나서 가장 많이 주문된 조합을 반환하면 된다.

문제를 풀고 나니 시간 초과가 발생해 고칠 수 있는 부분은 죄다 고쳐봤는데 통과를 하지 못했다.

진짜 더 이상 줄일 게 없다고 생각했는데 조합을 구하는 부분에서 문제가 있었다.

처음 문제를 풀 때는 조합을 손님이 주문한 메뉴를 모두 모아 그 상태에서 조합을 만들었다.

이렇게 되면 만들 수 없는 조합이더라도 일단 반복문을 돌아 시간 초과가 발생한다.

예를 들어 **[A, B, C, D], [E, F, G, H]** 라는 주문이 두 개 들어왔다고 해보자.

손님이 주문한 메뉴를 모두 모아 길이가 2인 조합을 만들게 되면

**[A, B, C, D, E, F, G, H]** 를 가지고 조합을 만들기 때문에  **[A, E], [C, H]** 같이 실제로는 만들 수 없는 조합이 생긴다.

이런 필요 없는 조합을 만들지 않기 위해서 주문 표를 반복하면서 조합을 만들었다.

메뉴 조합을 다 만들고 나서 주문이 두 번 이상 됐고 가장 많이 주문된 조합을 코스요리로 넣으면 된다.

추가로 집합이 어떤 집합의 부분집합임을 확인하고 싶으면 차집합을 이용하기보다 **issubset** 메소드를 사용하는 게 5배가량 빠르다.

---

```python
from itertools import combinations


def solution(orders, course):
	answer = list()

	for i in course:
		max_order_cnt = 0
		course_list = list()
		comb_list = list()
		
		for order in orders:
			comb_list.append(list(combinations(order, i)))

		comb_list = set(sum(comb_list, []))
		for val in comb_list:
			order_cnt = 0
			comb_food = set(val)

			for order in orders:
				if set.issubset(comb_food, order):
					order_cnt += 1

			if order_cnt >= 2:
				if max_order_cnt < order_cnt:
					course_list = [''.join(sorted(comb_food))]
					max_order_cnt = order_cnt
				elif max_order_cnt == order_cnt:
					course_list.append(''.join(sorted(comb_food)))

		answer += course_list

	return sorted(answer)


if __name__ == '__main__':
	orders = ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]
	course = [2, 3, 4]

	print(solution(orders, course))
```

 

