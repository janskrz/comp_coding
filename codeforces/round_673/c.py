import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]


for t in range(0, get_int()):
	n = get_int()
	nums = get_ints()

	hist = {}
	for i in range(0, n):
		e = nums[i]
		if e in hist:
			hist[e].append(i)
		else:
			hist[e] = [i]

	results = [-1] * n

	filled = n + 1
	for e in sorted(hist):
		gap = -1
		last_idx = -1
		for x in hist[e]:
			gap = max(gap, x - last_idx)
			last_idx = x
		gap = max(gap, n - hist[e][-1])

		tmp = gap
		while gap < filled:
			results[gap-1] = e
			gap += 1
		filled = min(tmp, filled)

	print(*results, sep=" ")

