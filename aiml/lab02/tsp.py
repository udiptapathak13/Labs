graph = [[[1, 10], [3, 20], [2, 15]], 
        [[0, 10], [3, 25], [2, 35]],
        [[1, 35], [3, 30], [0, 15]],
        [[0, 20], [1, 25], [2, 30]]]

def comp(element):
    return element[1]

for i in graph:
    i.sort(key = comp)

visited = [0]

def greedyDfs(vrtx):
    if len(visited) == len(graph):
        visited.append(0)
        return True
    adjList = graph[vrtx]
    for i in adjList:
        if i[0] in visited:
            continue
        visited.append(i[0])
        if greedyDfs(i[0]):
            return True
        visited.pop()
    return False

greedyDfs(0)
print(visited)
ttlcst = 0
for i in range(len(visited) - 1):
    for j in graph[visited[i]]:
        if j[0] == visited[i + 1]:
            ttlcst += j[1]
            break
print('Total Cost =', ttlcst)