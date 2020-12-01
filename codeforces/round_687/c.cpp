#include <iostream>
#include <string>
#include <vector>
#include <climits>

using namespace std;

int main()
{
    int t;
    cin >> t;

    for (auto q = 0; q < t; q++)
    {
        int n, p, k;
        cin >> n >> p >> k;
        p = p-1;
        string level;
        cin >> level;

        int x, y;
        cin >> x >> y;

        vector<int> costs(n);
        std::fill(costs.begin(), costs.end(), INT_MAX);
        for (int i = p; i < n; i++)
        {
            int cost_cell = level[i] == '0' ? x : 0;

            if (i - k >= 0)
            {
                costs[i] = cost_cell + min(costs[i-k], (i-p) * y);
            }
            else
            {
                costs[i] = cost_cell + (i-p) * y;
            }
        }

        int min_cost = -1;
        for (int i = n - 1; i >= max(0, n - k); i--)
        {
            if (min_cost == -1) min_cost = costs[i];
            min_cost = min(costs[i], min_cost);
        }

        cout << min_cost << endl;
    }
}