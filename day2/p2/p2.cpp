#include <iostream>
#include <vector>
#include <algorithm>
#include <unordered_map>
#include <fstream>
using namespace std;

vector<vector<int>> yourHand = {{2,3,1}, {3,1,2}, {2,1,3}};

// various mappings
unordered_map<char, int> em = {{'A', 0}, {'B', 1}, {'C', 2}};
unordered_map<char, int> om = {{'X', 0}, {'Y', 3}, {'Z', 6}};
unordered_map<char, int> ym = {{'Z', 0}, {'Y', 1}, {'X', 2}};

int process(string game) {
	// enemy play, outcome
	// outcomeValue + yourHand[enemyHand][outcomeIndex]
	return om[game[2]] + yourHand[em[game[0]]][ym[game[2]]];
}

int main() {
	cin.tie(0); ios::sync_with_stdio(0);
	string t;
	fstream file("../input.txt");
	int r = 0;
	while (file >> t) {
		r += process(t);
	}
	cout << r << "\n";
}
