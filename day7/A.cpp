#include <vector>
#include <iostream>
#include <fstream>
#include <algorithm>
#define ll long long
using namespace std;

struct FileNode {
	string name;
	ll size;
	bool isDirectory;
	vector<FileNode*> contents;
};

int main() {
	fstream file("input.txt");
	string t;

	// all that really matters about the root node is the contents
	FileNode* root = nullptr;
	root->isDirectory = true;

	while (file >> t) {
		if (t == "$") {
			file >> t;
			string cmd = t;

			if (cmd == "ls") {
				while (t != "$") {
					FileNode* some_file;
					insert(root, some_file);
				}
			}
			else if (cmd == "cd") {
				// traversal command
				file >> t;
				string dest = t;
			}
		}
	}
}
