def get_int():
	return int(input())

t = get_int()
for i in range(0, t):
	n = get_int()
	s = input()

	r = ""
	for i in range(0, n):
		r += s[i*2]

	print(r)

