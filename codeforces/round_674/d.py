import math

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

n = get_int()
a = get_ints()

s = set()
summe = 0
count = 0
for e in a:
	summe += e

	if summe in s or summe == 0:
		count += 1
		s = set()
		s.add(e)
		summe = e
	else:
		s.add(summe)

print(count)