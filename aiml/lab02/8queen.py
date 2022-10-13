import random

board = []
for _ in range(8):
    _row = []
    for _ in range(8):
        _row.append('*')
    board.append(_row)

pos = []

for _ in range(8):
    while True:
        i = random.randint(0, 7)
        j = random.randint(0, 7)
        if board[i][j] == 'Q':
            continue
        pos.append([i, j])
        board[i][j] = 'Q'
        break

def printb():
    for i in range(8):
        for j in range(8):
            print(board[i][j], end = ' ')
        print()

def obj2(r, c):
    i, j = r + 1, c + 1
    cnt = 0
    while i < 8 and j < 8:
        if board[i][j] == 'Q':
            cnt += 1
        i += 1
        j += 1
    i, j = r - 1, c - 1
    while i >= 0 and j >= 0:
        if board[i][j] == 'Q':
            cnt += 1
        i -= 1
        j -= 1
    i, j = r - 1, c + 1
    while i >= 0 and j < 8:
        if board[i][j] == 'Q':
            cnt += 1
        i -= 1
        j += 1
    i, j = r + 1, c - 1
    while i < 8 and j >= 0:
        if board[i][j] == 'Q':
            cnt += 1
        i += 1
        j -= 1
    tmp = 0
    for i in range(8):
        if board[i][c] == 'Q':
            tmp += 1
    cnt += tmp - 1
    tmp = 0
    for i in range(8):
        if board[r][i] == 'Q':
            tmp += 1
    cnt += tmp - 1
    return cnt         


def obj():
    cnt = 0
    for i in range(8):
        cnt += obj2(pos[i][0], pos[i][1])
    return cnt

def nextMove2(r, c):
    obj = []
    for i in range(9):
        obj.append(1000)
    if r - 1 >= 0 and c - 1 >= 0 and board[r - 1][c - 1] != 'Q':
        obj[0] = obj2(r - 1, c - 1)
    if r - 1 >= 0 and board[r - 1][c] != 'Q':
        obj[1] = obj2(r - 1, c)
    if r - 1 >= 0 and c + 1 < 8 and board[r - 1][c + 1] != 'Q':
        obj[2] = obj2(r - 1, c + 1)
    if c + 1 < 8 and board[r][c + 1] != 'Q':
        obj[3] = obj2(r, c + 1)
    if r + 1 < 8 and c + 1 < 8 and board[r + 1][c + 1] != 'Q':
        obj[4] = obj2(r + 1, c + 1)
    if r + 1 < 8 and board[r + 1][c] != 'Q':
        obj[5] = obj2(r + 1, c)
    if r + 1 < 8 and c - 1 >= 0 and board[r + 1][c - 1] != 'Q':
        obj[6] = obj2(r + 1, c - 1)
    if c - 1 >= 0 and board[r][c - 1] != 'Q':
        obj[7] = obj2(r, c - 1)
    return obj

def nextMove():
    canopy = []
    for i in range(8):
        canopy.append(nextMove2(pos[i][0], pos[i][1]))
    currobj = 1000
    r, c = -1, -1
    for i in range(8):
        for j in range(8):
            if canopy[i][j] < currobj:
                currobj = canopy[i][j]
                r = i 
                c = j
    board[pos[r][0]][pos[r][1]] = '*'
    if c == 0:
        pos[r][0] -= 1
        pos[r][1] -= 1
    elif c == 1:
        pos[r][0] -= 1
    elif c == 2:
        pos[r][0] -= 1
        pos[r][1] += 1
    elif c == 3:
        pos[r][1] += 1
    elif c == 4:
        pos[r][0] += 1
        pos[r][1] += 1
    elif c == 5:
        pos[r][0] += 1
    elif c == 6:
        pos[r][0] += 1
        pos[r][1] -= 1
    else:
        pos[r][1] -= 1
    board[pos[r][0]][pos[r][1]] = 'Q'

print('Initial Board:', 'Objective = ', obj())
printb()
print()

for _ in range(100):
    nextMove()

print('Final Board:', 'Objective = ', obj())
printb()
print()
