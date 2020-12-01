#include <numeric>

#include "setup.h"

#define POWER 1000

START_SOLUTION

    array<int, POWER> digits = {0};
    digits[0] = 2;

    for (size_t i = 1; i < POWER; i++)
    {
        auto carry = 0;
        for (auto &d : digits)
        {
            d = d * 2 + carry;
            carry = d / 10;
            d = d % 10;
        }
    }

    uint_fast32_t sum = accumulate(begin(digits), end(digits), 0);
    RESULT(sum);

END_SOLUTION