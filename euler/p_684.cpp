#include <chrono>

#include <cstdint>
#include <iostream>

#define LOWER_BOUND 2
#define UPPER_BOUND 90

#define MOD 1000000007
#define LARGE_S (9999999999 % MOD)

// after s(90) its 10 nines at the end -> exact value doen't matter due to MOD
std::uint_fast64_t S_n[91];

void fill_s_n()
{
    for (size_t i = 1; i < 91; i++) 
    {
        std::uint_fast64_t s_i = i % 9;
        for (size_t x = i / 9; x > 0; x--)
        {
            s_i = (s_i * 10 + 9) % MOD;
        }
        S_n[i] = (S_n[i-1] + s_i) % MOD;
        std::cout << S_n[i] << std::endl;
    }
}

uint64_t get_S(uint64_t n)
{
    //std::cout << (std::uint_fast64_t) n << std::endl;
    if (n <= 90)
    {
        return S_n[n];
    }

    uint64_t S = S_n[90];
    n -= 90;
    uint64_t s = LARGE_S;
    while (n)
    {
        if (n % 2 == 1)
        {
            S = (S + s) % MOD;
        }

        s = (2 * s) % MOD;
        n = n / 2;
    }

    return S;
}

int main()
{
    auto start = std::chrono::steady_clock::now();

    fill_s_n();

    uint64_t result = 0;
    uint64_t f_n1 = 0;
    uint64_t f_n2 = 1;
    for (size_t i = LOWER_BOUND; i <= UPPER_BOUND; i++)
    {
        __int128 f_i = f_n2 + f_n1;
        f_n1 = f_n2;
        f_n2 = f_i;

        result = (result + get_S(f_i)) % MOD;
    }
    auto end = std::chrono::steady_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "It took me " << elapsed.count() / 1000.0 << " milliseconds." << std::endl;
    std::cout << "Solution is: " << ((std::uint_fast64_t) result) << std::endl;
}