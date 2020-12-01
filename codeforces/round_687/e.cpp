#include <iostream>
#include <string>
#include <vector>
#include <climits>
#include <algorithm>

using namespace std;

int main()
{
    int n, k;
    cin >> n >> k;

    vector<int> bonuses(n);
    for (auto &i : bonuses)
    {
        cin >> i;
    }
    sort(bonuses.begin(), bonuses.end(), greater<int>());

    int total_score = 0;
    int c_bonus = 0;
    int i = 0;
    for (;i < n && c_bonus >= 0; i++)
    {
        total_score += c_bonus;
        c_bonus += bonuses[i];
    }

    while (k > 0){
        bonuses.pop_back();
        k--;
    }
    if (i < bonuses.size())
    {
        total_score += c_bonus;
        c_bonus = 0;
    }

    for (;i < bonuses.size(); i++)
    {
        total_score += c_bonus;
        c_bonus += bonuses[i];
    }

    cout << total_score << endl;
}