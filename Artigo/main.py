from Djikstra import *


# /40 10 25 20 85
def cargas_link(dic, lista, quantidade):
    for i in range(len(lista) - 1):
        dic[str(lista[i]) + " - " + str(lista[i + 1])] += quantidade
    return dic

def maior_link(dic):
    maior = 0
    link = ""
    for item in dic:
        if dic[item] > maior:
            maior = dic[item]
            link = item

    return maior,link


def main():
    dic_links = {}
    tam = 8
    for i in range(tam):
        for j in range(tam):
            if i != j:
                dic_links[str(i) + " - " + str(j)] = 0

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
        quantidade = int(linha)
        linha = arq.readline()
        linha = linha.split()
        print(quantidade)
        for i in range(len(linha) - 1):
            shortest_path, distance = dijkstra(Rede, int(linha[i]), int(linha[i + 1]))
            dic_links = cargas_link(dic_links, shortest_path, quantidade)
            print("origem", linha[i], "destino:", linha[i + 1])
            print("caminho:", shortest_path, "saltos", distance)

        print()
        print()
        linha = arq.readline()

    arq.close()
    for item in dic_links:
        print(item, " -> ", dic_links[item])
    maior,link = maior_link(dic_links)
    print(link,":", maior)
    return 0


if __name__ == "__main__":
    main()
