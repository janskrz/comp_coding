#include <map>
#include <string>

#include "setup.h"

#define LIMIT 1000

START_SOLUTION

    map<uint_fast32_t, string> letters = {};
    letters[0] = "";
    letters[1] = "one";
    letters[2] = "two";
    letters[3] = "three";
    letters[4] = "four";
    letters[5] = "five";
    letters[6] = "six";
    letters[7] = "seven";
    letters[8] = "eight";
    letters[9] = "nine";
    letters[10] = "ten";
    letters[11] = "eleven";
    letters[12] = "twelve";
    letters[13] = "thirteen";
    letters[14] = "fourteen";
    letters[15] = "fifteen";
    letters[16] = "sixteen";
    letters[17] = "seventeen";
    letters[18] = "eighteen";
    letters[19] = "nineteen";
    letters[20] = "twenty";
    letters[30] = "thirty";
    letters[40] = "forty";
    letters[50] = "fifty";
    letters[60] = "sixty";
    letters[70] = "seventy";
    letters[80] = "eighty";
    letters[90] = "ninety";
    letters[100] = "hundred";
    letters[1000] = "thousand";

    uint_fast32_t lettercount = 0;
    for (size_t i = 1; i <= 1000; i++)
    {
        auto n = i;
        if (n >= 1000)
        {
            lettercount += letters[n / 1000].length() + letters[1000].length();
            n %= 1000;
        }
        if (n >= 100)
        {
            lettercount += letters[n / 100].length() + letters[100].length();
            n %= 100;
            if (n != 0) lettercount += 3; // "and"
        }
        if (n >= 20)
        {
            lettercount += letters[(n / 10) * 10].length() + letters[n % 10].length();
        }
        else if (n > 0)
        {
            lettercount += letters[n].length();
        }
    }
    RESULT(lettercount);
END_SOLUTION