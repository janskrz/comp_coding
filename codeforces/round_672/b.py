import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

for t in range(0, get_int()):
	n = get_int()
	array = get_ints()
	array.sort()

	count = 0
	mask = 0
	same_power = 0

	for i in range(0, n):
		if array[i] > mask:
			count += (same_power * same_power - same_power) // 2
			mask += 1
			while mask <= array[i]:
				mask *= 2
			mask -= 1
			same_power = 1
		else:
			same_power += 1

	count  += (same_power * same_power - same_power) // 2

	print(count)