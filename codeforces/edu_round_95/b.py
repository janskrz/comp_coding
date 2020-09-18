import math

def get_int():
	return int(input())

def get_ints():
	return [int(x) for x in input().split()]

t = get_int()
for test in range(0, t):
	n = get_int()
	a = get_ints()
	locked = get_ints()

	s = [a[i] for i in range(0, len(a)) if locked[i] == 0]
	s.sort(reverse=True)

	idx = 0
	for i in range(0, n):
		if locked[i] == 0:
			a[i] = s[idx]
			idx += 1

	print(*a,sep=' ')
