#include "setup.h"

#define LIMIT 1'000'000

uint_fast32_t cache[LIMIT] = {0};

START_SOLUTION
    uint_fast32_t longest = 0;
    uint_fast32_t longest_starting_num = 0;
    for (uint_fast32_t i = 2; i < LIMIT; i++) 
    {
        uint_fast32_t cur_len = 1;
        uint_fast64_t n = i;
        while (n != 1)
        {
            if (n < LIMIT && cache[n] != 0)
            {
                cur_len += cache[n];
                break;
            }
            cur_len++;
            n = n % 2 ? n * 3 + 1 : n / 2;
        }

        if (longest < cur_len)
        {
            longest = cur_len;
            longest_starting_num = i;
        }
        cache[i] = cur_len;
    }

    RESULT(longest_starting_num);
END_SOLUTION
