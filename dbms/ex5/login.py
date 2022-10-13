import mysql.connector
import os

def source(filename):
    query = ''
    for line in open(filename):
        if line == '\n':
            continue
        query += line.strip()
        if line[-2] != ';' and line[-1] != ';':
            continue
        c.execute(query)
        for x in c:
            print(x)
        query = ''

def clrscr():
    os.system('clear')

conn = mysql.connector.connect(host = 'localhost', username = 'root', password = 'password')
c = conn.cursor(buffered = True)

# uncomment the next line to create the database from scratch
# source('schema.sql')

c.execute('use ex5')

while(1):
    conn.commit()
    clrscr()
    print('Press \'1\' to login')
    print('Press \'2\' to register')
    print('Press \'3\' to view database')
    print('Press \'4\' to exit')
    reply = int(input())
    clrscr()
    if reply == 1:
        usrname = input('Username: ')
        os.system('stty -echo')
        passwd = input('Password: ')
        print()
        os.system('stty echo')
        c.execute('select * from student where name = \'%s\' and password = \'%s\'' %(usrname, passwd))
        if c.rowcount == 0:
            clrscr()
            print('Incorrect Credenials!')
            input()
            continue
        clrscr()
        for x in c:
            print('Name        : ', x[0])
            print('Age         : ', x[2])
            print('Phone No.   : ', x[3])
            print('Blood Group : ', x[4])
        input()
    elif reply == 2:
        usrname = input('Username         : ')
        c.execute('select * from student where name = \'%s\'' %usrname)
        if c.rowcount != 0:
            clrscr()
            print('Username already taken!')
            input()
            continue
        os.system('stty -echo')
        passwd =  input('Password         : ')
        print()
        passwd2 = input('Confirm Password : ')
        print()
        os.system('stty echo')
        if passwd != passwd2:
            clrscr()
            print('Password Mismatch!')
            input()
            continue
        age = int(input('Age              : '))
        phone = int(input('Phone No.        : '))
        blood = input('Blood Group      : ')
        c.execute('insert into student values (\'%s\', \'%s\', \'%d\', \'%d\', \'%s\')' %(usrname, passwd, age, phone, blood))
    elif reply == 3:
        os.system('stty -echo')
        passwd = input('Admin Password: ')
        os.system('stty echo')
        clrscr()
        print('Username', 'Age', '','Phone number', 'Blood Group', sep = '\t')
        if passwd == 'password':
            c.execute('select * from student')
            for x in c:
                print(x[0], x[2], x[3], x[4], sep = '\t\t')
            input()
        else:
            print('Wrong Password!')
    else:
        break
