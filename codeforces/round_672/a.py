import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

for t in range(0, get_int()):
	n = get_int()
	cubes = get_ints()


	possible = False
	for i in range(1, n):
		if cubes[i-1] <= cubes[i]:
			possible = True
			break

	if not possible:
		print("NO")
	else:
		print("YES")