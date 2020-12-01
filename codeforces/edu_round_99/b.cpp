#include <iostream>
#include <string>
#include <vector>
#include <climits>
#include <algorithm>

using namespace std;

int main()
{
    int T;
    cin >> T;
    for (int t = 0; t < T; t++)
    {
        int x;
        cin >> x;

        if (x == 1)
        {
            cout << 1 << endl;
            continue;
        }

        int jumps = 1;        
        int y = 1;

        while (y < x)
        {
            y += jumps + 1;
            jumps++;
        }
        if (x + 1 == y)
        {
            jumps++;
        }
        cout << jumps << endl;
    }
}