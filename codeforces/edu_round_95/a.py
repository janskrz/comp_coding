import math

def get_int():
	return int(input())

def get_ints():
	return [int(x) for x in input().split()]

t = get_int()
for test in range(0, t):
	x, y, k = get_ints()

	n = math.ceil((k * y + k - 1) / (x - 1))

	# floating point garbage
	while k * y + k > (x - 1) * n + 1:
		n += 1

	while k * y + k <= (x - 1) * n + 1:
		n -= 1
	n += 1

	print(int(n) + k)