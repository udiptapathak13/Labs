import random
import math

graph = [[[1, 10], [3, 20], [2, 15]], 
        [[0, 10], [3, 25], [2, 35]],
        [[1, 35], [3, 30], [0, 15]],
        [[0, 20], [1, 25], [2, 30]]]

def comp(element):
    return element[1]

for i in graph:
    i.sort(key = comp)

visited = [0]

itr = 0.1

def propf():
    return (math.exp(- itr * random.random()) - 1) / (math.exp(- itr) - 1)

def greedyDfs(vrtx):
    if len(visited) == len(graph):
        visited.append(0)
        return True
    while True:
        i = math.floor(propf() * len(graph[vrtx]))
        if graph[vrtx][i][0] in visited:
            continue
        visited.append(graph[vrtx][i][0])
        if greedyDfs(graph[vrtx][i][0]):
            return True
        visited.pop()
    return False

ovrlcst = 1000
answer = []

for _ in range(10):
    visited = [0]
    greedyDfs(0)
    ttlcst = 0
    for i in range(len(visited) - 1):
        for j in graph[visited[i]]:
            if j[0] == visited[i + 1]:
                ttlcst += j[1]
                break
    if ttlcst < ovrlcst:
        ovrlcst = ttlcst
        answer = visited 

print(answer)
print('Total cost =', ovrlcst)