n, d, m = [int(i) for i in input().split()]
days = [int(i) for i in input().split()]
days.sort(reverse=True)

smaller = [i for i in days if i <= m]
larger = [i for i in days if i > m]

highest = 0
current = 0

prefix_sums = [0] * (1 + len(larger))
for i in range(0, len(larger)):
	prefix_sums[i+1] = prefix_sums[i] + larger[i]

prefix_sums2 = [0] * (1 + len(smaller))
for i in range(0, len(smaller)):
	prefix_sums2[i+1] = prefix_sums2[i] + smaller[i]

if n == len(smaller):
	print(sum(smaller))
else:
	for x in range(1, len(prefix_sums)):
		small_remaining = n - (x - 1) * (d+1) - 1

		if small_remaining < 0:
			break

		if small_remaining >= len(prefix_sums2):

			if small_remaining - len(prefix_sums2) > d:
				continue
			else:
				highest = max(highest, prefix_sums[x] + prefix_sums2[-1])
				continue

		current = prefix_sums[x] + prefix_sums2[small_remaining]
		highest = max(current, highest)

	print(highest)