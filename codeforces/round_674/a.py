import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

for t in range(0, get_int()):
	n, x = get_ints()

	if n <= 2:
		print(1)
	else:
		n -= 2
		print((n - 1) // x + 2)