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
        int x,y;
        cin >> x >> y;
        cout << x - 1 << " " << y << endl;
    }
}