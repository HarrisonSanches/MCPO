from Djikstra import *


def main():
    Rede = GraphUndirectedWeighted(6)
    Rede.add_edge(0, 1, 1)
    Rede.add_edge(0, 5, 1)
    Rede.add_edge(1, 2, 1)
    Rede.add_edge(1, 4, 2)
    Rede.add_edge(2, 3, 1)
    Rede.add_edge(4, 3, 1)
    Rede.add_edge(4, 5, 1)

    shortest_path, distance = dijkstra(Rede, 1, 4)
    print(shortest_path, distance)

    return 0


if __name__ == "__main__":
    main()
