---
title: "[BaekJoon] 백준 2659번 십자카드 문제"
excerpt: ""

categories:
  - BaekJoon

tags:
---

## 2659번 : 십자카드 문제

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/105456910-550c8d80-5cc9-11eb-9646-3fc9eb06ff67.png">
</center>

<center><img width="1150" alt="" src="https://user-images.githubusercontent.com/54533309/105456959-68b7f400-5cc9-11eb-9138-b17a047c7874.png">
</center>

<br>

주어진 카드의 십자수를 구한 뒤 모든 십자수 중 몇 번째로 작은 십자수인지 구하면 된다.

십자수를 구하는 방법은 여러가지가 있는데 나는 문자열을 잘라 만들었다.

총 네 가지 숫자를 만들 수 있는데 그 중 가장 작은 숫자를 십자수라고 하면 된다.

그리고 1111 로 되어있는 카드부터 9999 로 되어있는 카드까지 십자수를 구하면서

나의 십자수와 같을 때 까지 십자수가 몇 번 나왔는지 계산하면 된다.

---

```python
def cal_clock_num(card):
	num = int(card)

	for idx in range(1, 4):
		tmp = int(card[idx:4] + card[:idx])
		if num > tmp:
			num = tmp

	return num


if __name__ == '__main__':
	data = ''.join(list(input().rsplit()))
	clock_num = cal_clock_num(data)

	cnt = 0
	for i in range(1111, 10000):
		i_card_clock_num = cal_clock_num(str(i))
		if i == i_card_clock_num:
			cnt += 1
			if i == clock_num:
				print(cnt)
				exit(0)
```

<br>