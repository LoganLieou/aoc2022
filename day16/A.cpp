// what is the most pressure you can release in 30min?
#include <iostream>
#include <fstream>
#include <vector>
#include <regex>
#define node_regex "[A-Z]+"
#define pressure_regex "\\d+"

using namespace std;

struct Valve {
	// attributes
	string name;
	int pressure;
	vector<Valve*> neighbors;

	// constructors
	Valve():
		name(""), pressure(0), neighbors(vector<Valve*>()) {}
	Valve (string name):
		name(name), pressure(0), neighbors(vector<Valve*>()) {}
	Valve (string name, int pressure):
		name(name), pressure(pressure), neighbors(vector<Valve*>()) {}
	Valve (string name, int pressure, vector<Valve*> neighbors):
		name(name), pressure(pressure), neighbors(neighbors) {}
};

int main() {
	fstream file("input.txt");
	string t;
	while (getline(file, t)) {
		// remove capital V
		t = t.substr(1, t.size() - 1);
		Valve new_valve;
		smatch m;

		regex_search(t, m, regex(node_regex));
		new_valve.name = m[0].str();

		vector<Valve*> neighbors;
		for (int i = 1; i < m.size(); ++i) {
			neighbors.push_back(new Valve(m[i]));
		}

		// pressure regex is done
		regex_search(t, m, regex(pressure_regex));
		new_valve.pressure = stoi(m.str());
	}
}
