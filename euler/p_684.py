
mod 		= 1000000007

def s_naive(k):
	ninies = k // 9
	num = k % 9
	for i in range(1, ninies + 1):
		num = num * 10 + 9

	return num

def S_naive(k):
	result = 0
	for i in range(1, k + 1):
		result += s_naive(i)

	return result % mod

def S_fast(k):
	k += 1 

	rest = k % 9
	k = k - rest
	n = k // 9
	result = 5 * modular_power(10, n , mod) - 5 - (n * 9)

	for i in range(1, rest+1):
		result += i * modular_power(10, n, mod) - 1

	return result % mod

def modular_power(base, exponent, modulus):
	result = 1
	while exponent > 0:
		if exponent % 2 == 1:
			result = (result * base) % modulus
		exponent = int(exponent // 2)
		base = (base * base) % modulus
	return result

def fib_terms(first_term=2, last_term=90):
	term = 1
	f_prev = 0
	f_cur = 1
	while term <= last_term:
		if term >= first_term:
			yield f_cur
		f_next = f_cur + f_prev
		f_prev = f_cur
		f_cur = f_next
		term += 1

result = 0
for i in fib_terms():
	term = S_fast(i)
	result += term
result %= mod

print(result )