expr1 = [[-1], [1, 2], [3, 4], [-2, -3], [-4, -5], [5]]
expr2 = [[-1], [1, 2], [-2, -3], [-4, -5], [5]]
expr3 = [[1, -2], [3, 2]]

def resolve (expr):
    for i in expr:
        for j in i:
            for k in expr:
                if -j in k:
                    tmp = i + k
                    tmp.remove (j)
                    tmp.remove (-j)
                    expr.remove (i)
                    expr.remove (k)
                    expr.append (tmp)
                    return resolve (expr)
    return expr

res = resolve (expr3)
if len (res[0]):
    for i in res:
        print ('(', end = '')
        for j in i:
            print (j, end = ' v ')
        print ('\b\b\b)', end = ' ^ ')
    print ('\b\b  ')
else:
    print ("inconsistent")