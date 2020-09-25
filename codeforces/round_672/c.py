import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

for t in range(0, get_int()):
	n, q = get_ints()
	strengths = get_ints()

	largest_after = [0] * n
	largest_after[n-1] = strengths[n-1]
	for i in range(n-2, 0, -1):
		largest_after[i] = max(largest_after[i+1], strengths[i])


	total = 0
	add = True
	for i in range(1, n):
		if strengths[i-1] < strengths[i] and not add:
			total -= strengths[i-1]
			add = True
		elif strengths[i-1] > strengths[i] and add == True:
			total += strengths[i-1]
			add = False

	if add:
		total += strengths[-1]

	print(total)