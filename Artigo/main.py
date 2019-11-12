from Djikstra import *


def main():
    dic_links = {}
    tam = 9
    for i in range(tam):
        for j in range(tam):
            if i != j:
                dic_links[str(i) +" - " + str(j)] = 0

    print(dic_links)

    arq = open("adjascências.txt", 'r')
    linha = arq.readline()
    Rede = GraphUndirectedWeighted(tam)
    while linha:
        linha = linha.split()
        Rede.add_edge(int(linha[0]), int(linha[1]), int(linha[2]))
        linha = arq.readline()
    arq.close()

    arq = open("rotas_pre_def.txt", 'r')
    linha = arq.readline()

    while linha:
        print("cadeia", linha, end="")
        linha = linha.split()
        for i in range(len(linha) - 1):
            shortest_path, distance = dijkstra(Rede, int(linha[i]), int(linha[i + 1]))
            print("origem", linha[i], "destino:", linha[i + 1])
            print("caminho:", shortest_path, "saltos", distance)
        print()
        print()
        linha = arq.readline()

    arq.close()

    return 0


if __name__ == "__main__":
    main()
