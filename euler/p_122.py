import itertools

m = [-1] * 201
m[1] = [set()]
m[2] = [set([1])]

for i in range(3, 201):
	print(i)
	for j in range(1, i):

		ls1 = m[j]
		ls2 = m[i-j]

		for (a,b) in list(itertools.product(ls1 , ls2)):
			mults = a.union(b, set([j]), set([i-j]))

			if m[i] == -1:
				m[i] = [mults]
			else:
				l = len(m[i][0])
				if l > len(mults):
					m[i] = [mults]
				elif l == len(mults) and (not mults in m[i]):
					m[i].append(mults)

s = 0
for i in m:
	if i != -1:
		l = len(i[0])
		print(l)
		s += l

print(m)
print(s)
