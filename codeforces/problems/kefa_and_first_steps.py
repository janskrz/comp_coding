n = int(input())
a_list = [int(i) for i in input().split()]

max_pos = 0
cur_pos = 0
last_int = -1
for a in a_list:
	if a >= last_int:
		cur_pos += 1
		max_pos = cur_pos if cur_pos > max_pos else max_pos
	else:
		cur_pos = 1
	last_int = a

print(max_pos)