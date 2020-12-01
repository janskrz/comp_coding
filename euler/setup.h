#include <chrono>
#include <functional>
#include <iostream>

#define START_SOLUTION                                                          \
    int main(int argc, char **args){                                            \
        std::int_fast32_t problem_id = argc == 1 ? -1 : std::stoi(args[1]);     \
        runtime([problem_id]{

#define END_SOLUTION });}

#define RESULT(r)                                                               \
    std::cout   << "The result of problem " << problem_id                       \
                << " is: " << r << std::endl

using namespace std;

void runtime(std::function<void(void)> solver)
{
    auto start = std::chrono::steady_clock::now();
    solver();
    auto end = std::chrono::steady_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "It took me " << elapsed.count() / 1000.0 << " milliseconds." << std::endl;
}

