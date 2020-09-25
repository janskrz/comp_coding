def get_int():
	return int(input())

for t in range(0, get_int()):
	x = get_int()

	current_stair_size = 1
	number = 0
	while x > 0:
		n = current_stair_size
		cells = (n * n + n) // 2
		x -= cells
		if x >= 0:
			number += 1

		current_stair_size = current_stair_size * 2 + 1

	print(number)