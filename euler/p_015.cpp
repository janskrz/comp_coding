#include <algorithm>

#include "setup.h"

#define GRID_SIZE (20 + 1) // +1 as a grid with 2 cells wide has 3 lines etc

START_SOLUTION
    uint_fast64_t routes[GRID_SIZE][GRID_SIZE];
    // wow filling a 2D array fast is ugly
    std::fill(&routes[0][0], &routes[0][0] + sizeof(routes) / sizeof(routes[0][0]), 1);

    for (size_t r = 1; r < GRID_SIZE; r++)
    {
        for (size_t c = 1; c < GRID_SIZE; c++)
        {
            routes[r][c] = routes[r-1][c] + routes[r][c-1];
        }
    }

    RESULT(routes[GRID_SIZE-1][GRID_SIZE-1]);

END_SOLUTION