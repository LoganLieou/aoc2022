#include <_ctype.h>
#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <string>
using namespace std;

int value_of(char c) {
	if (islower(c))
		return c - 'a' + 1;
	return c - 'A' + 27;
}

char repeated(string s) {
	int n = s.size();

	string first_rucksack = s.substr(0, n / 2);
	string second_rucksack = s.substr(n / 2, n);

	for (char c : first_rucksack)
		if (second_rucksack.find(c) != string::npos)
			return c;
	return '_';
}

int main() {
	cin.tie(0); ios::sync_with_stdio(0);
	string temp;
	vector<string> contents;
	ifstream f("../input.txt");
	int r = 0;
	// not space seperated
	while (f >> temp) {
		// common element between two rucksacks
		char item = repeated(temp);
		cout << item << endl;
		cout << value_of(item) << endl;
		r += value_of(item);
	}
	cout << r << "\n";
}
