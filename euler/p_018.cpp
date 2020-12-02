#include "setup.h"

#include <array>
#include <algorithm>

START_SOLUTION

    int const row_count = 15;
    array<int_fast32_t, row_count + 1> row = {0};

    for (int r = 1; r < row.size(); r++)
    {
        for (int c = r; c >= 1; c--)
        {
            int cell;
            in_file >> cell;
            row[c] = cell + max(row[c], row[c-1]);
        }
    }

    RESULT(*max_element(row.begin(), row.end()));

END_SOLUTION