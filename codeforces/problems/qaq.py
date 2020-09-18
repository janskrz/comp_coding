### Implementation that can be used for generic patterns
char_list = [char for char in input()]
pattern = [char for char in "QAQ"]

seen_prefix = [0] * len(pattern)
for letter in char_list:
	for p_i in range(0, len(pattern)):
		if pattern[p_i] == letter:
			if p_i == 0:
				seen_prefix[p_i] += 1
			else:
				seen_prefix[p_i] += seen_prefix[p_i-1]

print(seen_prefix[-1])

### Optimial implementation with 1 pass
#char_list = [char for char in input()]
#
#q_seen = 0
#qa_seen = 0
#qaq_seen = 0
#for letter in char_list:
#	if letter == 'Q':
#		q_seen += 1
#		qaq_seen += qa_seen
#	elif letter == 'A':
#		qa_seen += q_seen
#
#print(qaq_seen)


### NAIVE (non-brute force) IMPLEMENTATION with 3 passes trough list

#char_list = [char for char in input()]
#
#q_before = [0] * len(char_list)
#q_before[0] = 1 if char_list[0] == 'Q' else 0
#for i in range(1, len(char_list)):
#	q_before[i] = q_before[i-1]
#	if char_list[i] == 'Q':
#		q_before[i] += 1
#
#qa_before = [0] * len(char_list)
#for i in range(1, len(char_list)):
#	qa_before[i] = qa_before[i-1]
#	if char_list[i] == 'A':
#		qa_before[i] += q_before[i-1]
#
#
#qaq_count = 0
#for i in range(2, len(char_list)):
#	if char_list[i] == "Q":
#		qaq_count += qa_before[i]
#
#print(qaq_count)
