def get_int():
	return int(input())

def get_ints():
	return [int(x) for x in input().split()]

n = get_int()
spheres = get_ints()

spheres.sort(reverse=True)

reorder = [0] * len(spheres)

i = 0
for i in range(0, len(reorder)):
	if i * 2 >= len(reorder):
		break
	reorder[i*2] = spheres[i]
	i += 1

j = 1
while i < len(reorder):
	reorder[j] = spheres[i]
	j += 2
	i += 1


cheaper = 0
for i in range(1, len(reorder)-1):
	if reorder[i] < reorder[i-1] and reorder[i] < reorder[i+1]:
		cheaper += 1


reorder2 = []

i = 0
j = len(spheres) - 1
while i <= j:
	reorder2.append(spheres[i])
	i += 1
	if i <= j:
		reorder2.append(spheres[j])
		j -= 1

cheaper2 = 0
for i in range(1, len(reorder2)-1):
	if reorder2[i] < reorder2[i-1] and reorder2[i] < reorder2[i+1]:
		cheaper2 += 1

if cheaper2 > cheaper:
	print(cheaper2)
	print(*reorder2, sep=' ')
else:
	print(cheaper)
	print(*reorder, sep=' ')


