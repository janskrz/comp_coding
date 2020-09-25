import math

def get_int():
	return int(input())

for t in range(0, get_int()):
	n = get_int()

	divisors = [[x,n//x] for x in range(2, int(math.sqrt(n) + 1)) if n % x == 0]
	divisors = [item for sublist in divisors for item in sublist]
	divisors.append(n)
	print(divisors)