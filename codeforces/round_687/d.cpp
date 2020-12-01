#include <iostream>
#include <string>
#include <vector>
#include <climits>

using namespace std;

#define I(r, c) (r *n + c);

int main()
{
    int n;
    cin >> n;
    vector<int> cells(n);
    cin >> cells[0];
    for (int i = 1; i < n; i++)
    {
        cin >> cells[i];
        cells[i] ^= cells[i-1];
    }

    auto xor_slice = [&cells] (size_t from, size_t to) {
        if (from == 0) return cells[to];
        return cells[from-1] ^ cells[to];
    };

    if (n > 65) {
        cout << 1 << endl;
        return 0;
    }

    for (int ops = 1; ops < n - 1; ops++)
    {
        for (int border = 0; border < n; border++) 
        {
            for (int left = max(0, border - ops); left <= border; left++)
            {
                int left_op_count = border - left;
                int right_op_count = ops - left_op_count;

                if (border + 1 + right_op_count >= n) break;
                if (xor_slice(left, border) > xor_slice(border + 1, border + 1 + right_op_count))
                {
                    cout << ops << endl;
                    return 0;
                }
            }
        }
    }
    cout << -1 << endl;
}