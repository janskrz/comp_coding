def get_int():
	return int(input())

def get_ints():
	return [int(x) for x in input().split()]

t = get_int()
for i in range(0, t):
	s = input()
	x = get_int()

	w = "0" * x + "?" * len(s) + "0" * x

	s = list(s)
	w = list(w)
	for j in range(0, len(s)):
		if s[j] == '0':
			w[j] = '0'
			w[j+2*x] = '0'

	for j in range(0, len(w)):
		if w[j] == '?':
			w[j] = '1'

	impossible = False
	for j in range(0, len(s)):
		if s[j] == '1':
			if w[j] == '0' and w[j+2*x] == '0':
				print("-1")
				impossible = True
				break


	if not impossible:
		print("".join(w[x:x+len(s)]))

