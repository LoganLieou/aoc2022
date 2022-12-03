#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

int value_of(char c) {
	if (islower(c))
		return c - 'a' + 1;
	return c - 'A' + 27;
}

int solve(string a, string b, string c) {
	// if x is also in b and c then it's the common item
	for (char x : a)
		if (b.find(x) != string::npos && c.find(x) != string::npos)
			return value_of(x);
	return 0;
}

int main() {
	cin.tie(0); ios::sync_with_stdio(0);
	ifstream file("../input.txt");
	string temp;
	vector<string> backpacks;
	while (file >> temp) backpacks.push_back(temp);
	int n = backpacks.size();
	int r = 0;
	// select 3 backpacks at a time
	// find the common character between these 3 packs
	// taking window of size 3
	for (int i = 0; i < n - 2; i += 3) {
		string a = backpacks[i], b = backpacks[i+1], c = backpacks[i+2];
		r += solve(a,b,c);
	}
	cout << r << "\n";
}
