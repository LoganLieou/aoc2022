import re
from collections import defaultdict, deque

with open("input.txt", "r") as f:
    contents = f.read().split("\n\n")

crates = contents[0]
moves = contents[1]

parsed_crates = crates.split("\n")

m = defaultdict(deque)

# parsing crates
for crate in parsed_crates:
    for i in range(len(crate)):
        if re.match(r"[A-Z]", crate[i]):
            m[int(parsed_crates[-1][i])].append(crate[i])

# parsing moves
move_tokens = []
parsed_moves = moves.split("\n")
for move in parsed_moves:
    t = []
    for c in move.split(' '):
        if re.match(r"[0-9]+", c):
            t.append(int(c))
    move_tokens.append(t)

# at the end there's an extra empty line so it just appends an empty list []
move_tokens.pop()

# do the moves on the crates
for token in move_tokens:
    crates = []
    for _ in range(token[0]):
        crates.append(m[token[1]].pop())
    for crate in crates:
        m[token[2]].appendleft(crate)

r = ""
for k in sorted(m.keys()):
    r += m[k].popleft()
print(r)
