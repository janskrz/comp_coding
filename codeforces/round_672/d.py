import operator as op
from functools import reduce

def ncr(n, r):

	r = min(r, n-r)
	numer = reduce(op.mul, range(n, n-r, -1), 1)
	denom = reduce(op.mul, range(1, r+1), 1)
	result = numer // denom
	cache[(n, r)] = result
	return result

def comb(N, k):
    if (k > N) or (N < 0) or (k < 0):
        return 0
    N,k = map(int,(N,k))
    top = N
    val = 1
    while (top > (N-k)):
        val *= top
        top -= 1
    n = 1
    while (n < k+1):
        val /= n
        n += 1
    return int(val)

def get_int():
	return int(input())

def get_ints():
	return [int(i) for i in input().split()]

mod = 998244353

n, k = get_ints()
starts = [0] * n
ends = [0] * n
for i in range(0, n):
	l, r = get_ints()
	starts[i] = l
	ends[i] = r

starts.sort()
ends.sort()

endIdx = 0
on = 0
combinations = 0
for time in starts:
	on += 1
	while ends[endIdx] < time:
		endIdx += 1
		on -= 1

	if on >= k:
		combinations += (comb(on-1, k-1) % mod)

print(combinations % mod)
