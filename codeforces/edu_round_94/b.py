def get_int():
	return int(input())

def get_ints():
	return [int(x) for x in input().split()]

t = get_int()
for i in range(0, t):
	p, f = get_ints()
	cnt_s, cnt_w = get_ints()
	s, w = get_ints()

	if s > w:
		s, w = s, w
		cnt_s, cnt_w = cnt_w, cnt_s


	total = min(cnt_s, p // s)
	cnt_s -= total
	total2 = min(cnt_s, f // s)
	total += total2
	cnt_s -= total2

	used_p = total * s
	used_f = total2 * s

	if cnt_s > 0:
		print(total)
	else:
		axes_f = min(cnt_w, (f - used_f) // w)
		used_f += axes_f * w
		total += axes_f

		valid_total = total
		while True:
			used_p += w



		print(total)

