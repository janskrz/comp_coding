#include <iostream>
#include <sstream>
#include <algorithm>
#include <numeric>
#include <vector>

using namespace std;

int main()
{
    int t;
    cin >> t;

    for (int T = 0; T < t; T++)
    {
        int n, w;
        cin >> n;
        cin >>  w;

        vector<int> W;
        for (int i = 0; i < n;i++)
        {
            int e;
            cin >> e;
            W.push_back(e);
        }
        std::vector<size_t> idx(n);
        iota(idx.begin(), idx.end(), 0);

        stable_sort(idx.begin(), idx.end(),
            [&W](size_t i1, size_t i2) {return W[i1] > W[i2];});

        int x = 0;
        int count = 0;
        ostringstream os;
        for (int i = 0; i < n; i++)
        {
            if (W[idx[i]] + x <= w)
            {
                x += W[idx[i]];
                count++;
                os << idx[i] + 1 << " ";
            }
        }

        if (x < (1 + w) / 2)
        {
            cout << -1 << endl;
        }
        else
        {
            cout << count << endl << os.str() << endl;
        }
    }
}