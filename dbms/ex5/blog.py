import sql.connector

conn = sql.connector.connect()
c = conn.cursor()

while(1):
    print('Press 1 to Make a Post     :')
    print('Press 2 to View Top 5 Post :')

1, 'tarun   ', 'b', 2020, 1,
2, 'udipta  ', 'b', 2020, 1,
3, 'praveen ', 'b', 2021, 1,
4, 'abhishek', 'b', 2019, 2,
5, 'aashish ', 'b', 2018, 2,
6, 'noman   ', 'b', 2023, 3,
7, 'brintha ', 'g', 2020, 4,
8, 'simmi   ', 'g', 2021, 4,
9, 'juganta ', 'g', 2021, 5,
0, 'swati   ', 'g', 2021, 5,