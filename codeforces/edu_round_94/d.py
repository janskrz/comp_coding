def get_int():
	return int(input())

def get_ints():
	return [int(x) for x in input().split()]

t = get_int()
for i in range(0, t):
	n = get_int()

	a_list = get_ints()

	pair_list = []
	for i in range(0, n):
		for j in range(i+1,n):
			if a_list[i] == a_list[j]:
				pair_list.append((i, j))

	combinations = 0
	pairs = len(pair_list)
	for i in range(0, pairs):
		for j in range(i+1, pairs):
			ia,ib = pair_list[i]
			ja,jb = pair_list[j]
			if ia < ja and ja < ib and ib < jb:
				combinations += 1

	print(combinations)