import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

for t in range(0, get_int()):
	n, m = get_ints()

	mirrorA = False
	mirrorB = False
	for T in range(0, n):
		tile = get_ints() + get_ints()
		if tile[0] == tile[3]:
			mirrorA = True
		if tile[1] == tile[2]:
			mirrorB = True

	if m % 2 != 0:
		print("No")
		continue

	if mirrorB:
		print("Yes")
	else:
		print("NO")
