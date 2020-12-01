#include <iostream>

using namespace std;

int main()
{
    int t;
    cin >> t;

    for (auto i = 0; i < t; i++)
    {
        int n, m, r, c;
        cin >> n >> m >> r >> c;
        cout << max(r - 1, n - r) + max(c -1, m -c) << endl;
    }

}