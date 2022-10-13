board = []
for _ in range(3):
    _row = []
    for _ in range(3):
        _row.append('.')
    board.append(_row)

def printb():
    for i in range(3):
        for j in range(3):
            print(board[i][j], end = ' ')
        print()
    print()

printb()

aichar = 'X'
usrchar = 'O'

def nextmove():
    canopy = []
    for _ in range(3):
        _row = []
        for _ in range(3):
            _row.append(0)
        canopy.append(_row)
    if (board[0][1] == board[0][2] and board[0][1] != '.') or (board[1][0] == board[2][0] and board[1][0] != '.') or (board[1][1] == board[2][2] and board[1][1] != '.'):
        canopy[0][0] = 10
    else:
        canopy[0][0] = 3
    if (board[0][1] == board[0][0] and board[0][0] != '.') or (board[1][2] == board[2][2] and board[2][2] != '.') or (board[1][1] == board[2][0] and board[1][1] != '.'):
        canopy[0][2] = 10
    else:
        canopy[0][2] = 3
    if (board[2][1] == board[2][2] and board[2][2] != '.') or (board[1][0] == board[0][0] and board[0][0] != '.') or (board[1][1] == board[0][2] and board[1][1] != '.'):
        canopy[2][0] = 10
    else:
        canopy[2][0] = 3
    if (board[2][1] == board[2][0] and board[2][0] != '.') or (board[1][2] == board[0][2] and board[0][2] != '.') or (board[1][1] == board[0][0] and board[0][0] != '.'):
        canopy[2][2] = 10
    else:
        canopy[2][2] = 3
    if (board[0][0] == board[0][2] and board[0][0] != '.') or (board[1][1] == board[2][1] and board[1][1] != '.'):
        canopy[0][1] = 12
    else:
        canopy[0][1] = 2
    if (board[0][0] == board[2][0] and board[0][0] != '.') or (board[1][1] == board[1][2] and board[1][1] != '.'):
        canopy[1][0] = 12
    else:
        canopy[1][0] = 2
    if (board[1][0] == board[1][1] and board[1][1] != '.') or (board[0][2] == board[2][2] and board[2][2] != '.'):
        canopy[1][2] = 12
    else:
        canopy[1][2] = 2
    if (board[2][0] == board[2][2] and board[2][2] != '.') or (board[1][1] == board[0][1] and board[1][1] != '.'):
        canopy[2][1] = 12
    else:
        canopy[2][1] = 2
    if (board[0][0] == board[2][2] and board[0][0] != '.') or (board[0][2] == board[2][0] and board[2][0] != '.') or (board[0][1] == board[2][1] and board[0][1] != '.') or (board[1][0] == board[1][2] and board[1][0] != '.'):
        canopy[1][1] = 14
    else:
        canopy[1][1] = 4
    r = -1
    c = -1
    currobj = 0
    for i in range(3):
        for j in range(3):
            if board[i][j] != '.':
                canopy[i][j] = 0
            if canopy[i][j] > currobj:
                r, c = i, j
                currobj = canopy[i][j]
    board[r][c] = aichar

def checkWin():
    if board[0][0] == board[0][1] and board[0][1] == board[0][2] and board[0][0] != '.':
        if board[0][0] == 'X':
            return 1
        else:
            return 2
    if board[1][0] == board[1][1] and board[1][1] == board[1][2] and board[1][0] != '.':
        if board[0][0] == 'X':
            return 1
        else:
            return 2
    if board[2][0] == board[2][1] and board[2][1] == board[2][2] and board[2][0] != '.':
        if board[0][0] == 'X':
            return 1
        else:
            return 2
    if board[0][0] == board[1][0] and board[1][0] == board[2][0] and board[0][0] != '.':
        if board[0][0] == 'X':
            return 1
        else:
            return 2
    if board[0][1] == board[1][1] and board[1][1] == board[2][1] and board[0][0] != '.':
        if board[0][1] == 'X':
            return 1
        else:
            return 2
    if board[0][2] == board[1][2] and board[1][2] == board[2][2] and board[0][2] != '.':
        if board[0][2] == 'X':
            return 1
        else:
            return 2
    if board[0][0] == board[1][1] and board[1][1] == board[2][2] and board[0][0] != '.':
        if board[0][0] == 'X':
            return 1
        else:
            return 2
    if board[2][0] == board[1][1] and board[1][1] == board[0][2] and board[1][1] != '.':
        if board[2][0] == 'X':
            return 1
        else:
            return 2
    return 0

while True:
    x, y = list(map(int, input("User Move: ").split()))
    board[x][y] = usrchar
    printb()
    status = checkWin()
    if status == 1:
        print('AI Wins')
        break
    elif status == 2:
        print('User Wins')
        break
    nextmove()
    print("AI Move")
    printb()
    status = checkWin()
    if status == 1:
        print('AI Wins')
        break
    elif status == 2:
        print('User Wins')
        break
