def is_S(target, num):
	if num < target: return False
	if num == target: return True 
	
	t = 10
	while t < num:
		q = num // t
		r = num % t
		if is_S(target - r, q): return True
		t *= 10

	return False

zum = 0
for i in range(2, 1000001):
	if is_S(i, i*i):
		print(i*i)
		zum += i*i

print(zum)