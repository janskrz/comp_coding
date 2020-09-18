n = int(input())

bills = 0
for denom in [100, 20, 10, 5, 1]:
	bills += n // denom
	n %= denom

print(bills)