import math
import functools
import operator

def sieve(n):
	primes = [1] * n
	for i in range(2, n):
		if primes[i] == 1:
			primes[i] = i
			for j in range(i *2,n, i):
				primes[j] = 0

	return list(filter(lambda x: x > 1, primes))

# some prime-precomuptation...
primes = sieve(1000000)
#
#num = 1
#for i in range(1, 12):
#num = num * 10 + 1
#print(num, end = ": ")
#for p in primes:
#	if num % p == 0:
#		print(p, end = ", ")
#print()

# prime factors of R(n) for low n
#11: 11,
#111: 3, 37,
#1111: 11, 101,
#11111: 41, 271,
#111111: 3, 7, 11, 13, 37,
#1111111: 239, 4649,
#11111111: 11, 73, 101, 137,
#111111111: 3, 37, 333667,
#1111111111: 11, 41, 271, 9091,
#11111111111: 21649, 513239,
#111111111111: 3, 7, 11, 13, 37, 101, 9901,
# observation 1: For R(n) where n is even: R(n) has all prime factors of R(n/2)
#... and two more

# try 1: divide given n (10 ** 9) until it is uneven
start = 10 ** 9
while start % 2 == 0:
	start //= 2
print(start)
# its 1953125... so we only need to get prime factors of R(1953125)
# but this is still to big...

# observation 2: For R(n) if n % x == 0, then R(n) has all prime factors of R(n/x)!
# if n is a prime > 2, then R(n) is product of two primes!
def get_r(n):
	r = 1
	for i in range(1, n):
		r = r * 10 + 1
	return r

def get_divisors(n):
	divisors = []
	for i in range(2, 1 + int(math.sqrt(n))):
		if n % i == 0:
			divisors.append(i)
			divisors.append(n // i)

	divisors.sort()
	return divisors
	
def get_factors(i):
	result = []
	for p in primes:
		if p > i:
			break
		if i % p == 0:
			result.append(p)
			#result.append(i // p)
	return result

divs = get_divisors(10 ** 9)
print(divs)
# observation 3: 2 and 5 are the only prime factors of 10 ** 9

# try 2: using this info, compute all prime factors up to a reasonably high n
# How do we know that n was sufficiently high? I do not know :(... This is
# quite hacky as we cannot prove that there isn't a lower prime that we missed... 
# we only know it because project euler accepts it
end = 100001 
factors = [set()] * (end + 1)
factors[2] = set([11])
factors[4] = set([11, 101])
factors[5] = set([41, 271])
for i in divs[3:]:
	if i >= end:
		break
	divisors = get_divisors(i)
	union = set().union(*[factors[z] for z in divisors]) 
	prod = functools.reduce(operator.mul, list(union))
	r = get_r(i)
	rest = r // prod
	for f in get_factors(rest):
		union.add(f)
	factors[i] = union
	print(union)


final = set()
for i in divs:
	if i < end:
		print(final)
		final = final.union(factors[i])

final = list(final)
final.sort()
print(final, len(final))
print(sum(final[:40]), len(final[:40]))