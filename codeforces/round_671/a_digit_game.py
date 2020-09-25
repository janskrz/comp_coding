def get_int():
	return int(input())

for t in range(0, get_int()):
	n = get_int()
	digits = [int(c) for c in input()]


	if n % 2 == 0:
		# breach has last turn
		win = False
		for i in range(1, len(digits), 2):
			if digits[i] % 2 == 0:
				win = True
		if win:
			print(2)
		else:
			print(1)
	else:
		# raze has last turn
		win = False
		for i in range(0, len(digits), 2):
			if digits[i] % 2 == 1:
				win = True
		if win:
			print(1)
		else:
			print(2)
