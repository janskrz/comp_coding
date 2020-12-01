#include "setup.h"

int_fast32_t u(int_fast32_t n) 
{
    int_fast32_t r = 1;

    int_fast32_t t_n = -n;

    for (auto i = 1; i <= 10; i++)
    {
        r += t_n;
        t_n *= -n;
    }

   return r;
}

START_SOLUTION
    for (auto i = 1; i < 20; i++)
    {
        cout << u(i) << endl;
    }
END_SOLUTION