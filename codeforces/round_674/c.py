import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

for t in range(0, get_int()):
	n = get_int()

	if n <= 1:
		print(0)
		continue

	m = n
	sq = int(math.sqrt(n))

	if sq * sq == m:
		print(sq - 1 + sq - 1)
	elif (1 + sq) * sq >= n:
		print(sq + sq - 1)
	else:
		print(sq + sq)
