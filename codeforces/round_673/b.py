import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

for t in range(0, get_int()):
	n, T = get_ints()
	a_array = get_ints()

	results = [-1] * n

	m = {}
	for i in range(0, n):
		e = a_array[i]
		if e in m:
			m[e] = m[e] + 1
		else:
			m[e] = 1

	for i in range(0, n):
		e = a_array[i]
		if T - e in m:
			if e > T - e:
				results[i] = 0
			elif e == T - e:
				results[i] = m[e] % 2
				m[e] = m[e] - 1
			else:
				results[i] = 1
		else:
			results[i] = 0

	print(*results, sep=' ')