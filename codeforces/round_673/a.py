import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

for t in range(0, get_int()):
	n, k = get_ints()
	candles = get_ints()

	candles.sort()

	pastes = 0
	lowest = candles[0]
	for i in range(1, n):
		dif = k - candles[i]
		if dif > 0:
			pastes += dif // lowest

	print(pastes)