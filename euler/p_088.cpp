#include <chrono>
#include <iostream>
#include <cstdint>
#include <set>

#define UPPER_LIMIT 12000

std::uint_fast32_t N_k[UPPER_LIMIT+1];

void compute(std::uint_fast32_t prod,std::uint_fast32_t sum, std::uint_fast32_t factor_count)
{
    factor_count++;
    for (std::uint_fast32_t f = 2; ; f++)
    {
        std::uint_fast32_t  prod_t = f * prod;
        std::uint_fast32_t  sum_t = f + sum;
        std::uint_fast32_t  k = factor_count + (prod_t - sum_t);

        if (k > UPPER_LIMIT) break; // further increasing a factor will only lead to bigger k's

        if (N_k[k] > prod_t) N_k[k] = prod_t;
        compute(prod_t, sum_t, factor_count);
    }
}

int main()
{
    auto start = std::chrono::steady_clock::now();

    // N_k is unsigned int array. Due to 'underflow' frapps around 
    std::fill_n(N_k, UPPER_LIMIT, -1); // note that this is unsigned array, due to overflow filled with large valse

    for (std::uint_fast32_t f = 2; f <= UPPER_LIMIT; f++)
    {
        compute(f, f, 1);
    }

    std::uint_fast64_t result = 0;
    std::set<std::uint_fast32_t> seen;
    for (size_t i = 2; i <= UPPER_LIMIT; i++)
    {
        if (seen.count(N_k[i]) == 0)
        {  
            seen.insert(N_k[i]);
            result += N_k[i];
        }
    }
    auto end = std::chrono::steady_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "It took me " << elapsed.count() / 1000.0 << " milliseconds." << std::endl;

    std::cout << "Solution is " << result << std::endl;
}