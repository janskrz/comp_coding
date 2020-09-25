def get_int():
	return int(input())

def get_ints():
	return [int(x) for x in input().split()]


for t in range(0, get_int()):
	n, y = get_ints()
	accounts = get_ints()

	s = sum(accounts)
	if y in accounts and len(set(accounts)) == 1:
		print(0)
		continue

	if y in accounts or n * y == s:
		print(1)
	else:
		print(2)
