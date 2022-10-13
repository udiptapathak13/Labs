expra = [[1, -2, 3], [-2, -1, 3], [-3, -2], [3], [-4, 5], [-5]]
exprb = [[1, -2], [-1, 2]]

def brute(expr1):
    lol = []
    for i in expr1:
        for j in i:
            if abs(j) not in lol:
                lol.append(abs(j))
    n = pow(2, len(lol))
    intr = {}
    for k in range(n):
        for i in range(len(lol)):
            intr[lol[i]] = (k >> i) & 1
        b = True
        for j in expr1:
            b2 = False
            for l in j:
                if l > 0  and intr[l] == True:
                    b2 = True
                    break
                elif l < 0 and intr[-l] == False:
                    b2 = True
                    break
            if b2 == False:
                b = False
                break
        if b == True:
            return intr
    return {}


def dpll(expr1):
    lol = []
    ul = []
    for i in expr1:
        if len(i) == 1:
            ul.append(i[0])
        for j in i:
            if j not in lol:
                lol.append(j)
    pl = []
    for i in lol:
        if -i not in lol:
            pl.append(i)
    intr = {}
    for i in range(len(lol)):
        intr[lol[i]] = 2
    upl = ul + pl
    for i in upl:
        intr[i] = 1
        if -i in lol:
            intr[-i] = 0
    expr2 = []
    for i in expr1:
        if len(list(set(i) & set(upl))) == 0:
            expr2.append(i)
    if len(expr2) != 0:
        intr3 = brute(expr2)
        if len(intr3) == 0:
            return {}
        for i, j in intr3.items():
            intr[i] = j
    intr2 = {}
    for i, j in intr.items():
        if abs(i) in intr2.keys() and intr2[abs(i)] != 'Don\'t Care':
            continue
        if i > 0:
            if j == 0:
                intr2[i] = 'False'
            elif j == 1:
                intr2[i] = 'True'
        elif j == 0:
            intr2[-i] = 'True'
        elif j == 1:
            intr2[-i] = 'False'
        else:
            intr2[abs(i)] = 'Don\'t Care'
    return intr2
    

intr = dpll(expra)
if len(intr) == 0:
    print('Not Possible')
else:
    for i in sorted(intr.keys()):
        print(i, intr[i], sep = ': ')