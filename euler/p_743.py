from math import sqrt

k = 10 ** 8
n = 10 ** 16
MOD = 1000000007


pre_computed = {}
def factorial(x):
	r = x % 4
	if r == 0: return pre_computed[x]

	result = pre_computed[x - r]
	for i in range(0, r):
		result *= x - i

	return result % MOD

def create_precomputed_table():
	pre_computed[0] = 1
	for i in range(4, k+1, 4):
		pre_computed[i] = (pre_computed[i-4] * (i-3) * (i-2)  * (i-1) * i) % MOD
		if i % 1000000 == 0:
			print(i)
 
create_precomputed_table()

############## the actual solution

fac_k = factorial(k) % MOD
def custom_binom_term(i):
	tmp = factorial((k - i) // 2)
	tmp = (tmp * tmp) % MOD
	divisor = (tmp * factorial(i)) % MOD
	return (fac_k * pow(divisor, MOD-2, MOD)) % MOD


print("precomputation done")

sum = 0
single_pow_base=  pow(2, 2 * (n // k), MOD)
this_pow = 1
start = k % 2
for singles in range(start, k+1, 2):
	sum = (sum + (this_pow * custom_binom_term(singles))) % MOD

	if singles % 1000000 == 0:
		print(singles)

	next_pow = (this_pow * single_pow_base) % MOD
	this_pow = next_pow

print("Result: ", sum)