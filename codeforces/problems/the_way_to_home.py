n, d = [int(i) for i in input().split()]
lillies = [c for c in input()]

jumps = 0
position = 0
while position < n - 1:
	candidate_pos = position + d
	if candidate_pos >= n - 1:
		jumps += 1
		break

	while lillies[candidate_pos] == '0':
		candidate_pos -= 1

	if candidate_pos == position:
		jumps = -1
		break
	position = candidate_pos
	jumps += 1

print(jumps)