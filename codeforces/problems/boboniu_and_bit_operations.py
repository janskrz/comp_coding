n, m = [int(i) for i in input().split()]

a_list = [int(i) for i in input().split()]
b_list = [int(i) for i in input().split()]

for target in range(0, 2**10):
	for a in a_list:
		found = False
		for b in b_list:
			if 	(a & b) | target == target:
				found = True
				break

		if found == False:
			break

	if found == True:
		print(target)
		break
