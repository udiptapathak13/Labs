import random
import math

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

itr = 0

def propf():
    return (math.exp(- itr * random.random()) - 1) / (math.exp(- itr) - 1)

def comp(element):
    return element[3]

def nextMove():
    global itr
    itr += 0.01
    while True:
        i = random.randint(0, 7)
        j = random.randint(0, 7)
        if board[i][j] == 'Q':
            continue
        canopy = []
        for k in range(8):
            canopy.append([k, pos[k][0], pos[k][1], obj2(pos[k][0], pos[k][1])])
        canopy.append([-1, i, j, obj2(i, j)])
        canopy.sort(key = comp)
        nonce = propf() * 9
        if nonce == 9:
            nonce = 8
        if i != canopy[math.floor(nonce)][1] or j != canopy[math.floor(nonce)][2]:
            board[i][j] = 'Q'
            pos[canopy[math.floor(nonce)][0]][0] = i 
            pos[canopy[math.floor(nonce)][0]][1] = j
            board[canopy[math.floor(nonce)][1]][canopy[math.floor(nonce)][2]] = '*'
        break

print('Initial Board:', 'Objective = ', obj())
printb()
print()

for _ in range(100000):
    nextMove()

print('Final Board:', 'Objective = ', obj())
printb()
print()
