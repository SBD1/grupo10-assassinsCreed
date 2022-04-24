from pathfinding.core.grid import Grid
from pathfinding.finder.a_star import AStarFinder


matriz = [
    [1, 1, 1, 1, 1, 1],
    [1, 0, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
]

grid = Grid(matrix = matriz)

inicio = grid.node(0,0)

fim = grid.node(5,2)


busca = AStarFinder()

path,runs = busca.find_path(inicio, fim, grid)

print(path)
