#include <chrono>
#include <functional>
#include <iostream>
#include <iomanip>
#include <sstream>
#include <fstream>

// solution p_XXX.cpp can access input file p_XXX.cpp via captured variable in_file

#define START_SOLUTION                                                          \
    int main(int argc, char **args){                                            \
        std::int_fast32_t problem_id = argc == 1 ? -1 : std::stoi(args[1]);     \
        std::stringstream ss;                                                   \
        ss << std::setw(3) << std::setfill('0') << problem_id;                  \
        std::stringstream ss2;                                                  \
        ss2 << "p_" << ss.str() << ".in";                                       \
        std::ifstream in_file;                                                  \
        in_file.open(ss2.str(), std::ifstream::in);                             \
        runtime([problem_id, &in_file]{

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

