#include <iostream>
#include <vector>

using namespace std;

int main()
{
    int t;
    cin >> t;

    for (auto i = 0; i < t; i++)
    {
        int n, k;
        cin >> n >>  k;

        vector<int> houses(n);
        int max_c = 0;
        for (int h = 0; h < n; h++)
        {
            cin >> houses[h];
            max_c = max(houses[h], max_c);
        }
        houses.push_back(101); // hack to delimiate with non-existing color

        int min_work = n;
        for (int c = 1; c <= max_c; c++) 
        {
            int work = 0;
            int idx = 0;
            while (idx < n)
            {
                while(houses[idx] == c) idx++;

                if (idx >= n) break;
                work++;
                idx += k;
            }
            min_work = min_work < work? min_work : work;
        }
        cout << min_work << endl;
    }
}