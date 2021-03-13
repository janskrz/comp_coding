import math
import time

def p(prefix, prefixlen, nth):
	trunc_limit = 10 ** prefixlen
	v = 1.0
	power = 0
	while nth > 0:
		v *= 2
		power += 1
		if v >= trunc_limit:
			v /= 10
		if int(v) == prefix:
			nth -= 1

	return power


# takes about 1,5 minutes...
print(p(123, 3, 678910))
