

start = 1504170715041707
mod = 4503599627370517

curr = start
smallest = start
result = start
n = 1
while True:
	if curr < smallest:
		result += curr
		smallest = curr
		print(result, curr, n)
	curr = (curr + start) % mod
	n += 1