# Projeto 2 — Parte B

## Itinerário e Meios de Transporte — Custo, Tempo e Equilíbrio

Esta pasta contém a Parte B do Projeto 2, desenvolvida no âmbito da unidade curricular de Técnicas de Inteligência Artificial.

Esta parte expande a Parte A, acrescentando a dimensão do tempo de viagem. Assim, o sistema permite recomendar itinerários com base no menor custo, no menor tempo ou num equilíbrio entre custo e tempo.

## Objetivo

O objetivo é calcular o melhor itinerário entre uma cidade de origem e uma cidade de destino, considerando três possibilidades:

- caminho mais económico;
- caminho mais rápido;
- caminho equilibrado entre custo e tempo.

Foram implementados diferentes métodos de resolução:

- Gerar e Testar;
- Depth First;
- Hill Climbing.

## Ficheiros

- `projeto2B_bd.pl` — base de dados com cidades, ligações, meios de transporte, custos e tempos;
- `projeto2B_metodos.pl` — métodos de procura e otimização considerando custo, tempo e equilíbrio entre ambos;
- `projeto2B_interface.pl` — interface de interação com o utilizador.

## Funcionamento

O sistema começa por pedir ao utilizador a cidade de origem e a cidade de destino.

Depois, o utilizador escolhe o tipo de recomendação pretendida:

1. mais económico;
2. mais rápido;
3. mais económico e rápido.

De seguida, escolhe o método de resolução:

1. Gerar e Testar;
2. Hill Climbing;
3. Depth First.

No final, o sistema apresenta o caminho recomendado, os meios de transporte utilizados e o respetivo custo, tempo ou valor combinado.

## Cidades consideradas

O sistema inclui ligações entre várias cidades, nomeadamente:

- Braga;
- Porto;
- Lisboa;
- Faro;
- Viseu;
- Guimarães;
- Coimbra.

## Como executar

Para executar esta parte, é necessário ter o SWI-Prolog instalado.

Abrir o SWI-Prolog nesta pasta e carregar o ficheiro principal:

```prolog
[projeto2B_interface].

Depois executar:
interface.

Exemplo de dados
arco(braga, porto, comboio).
custo(braga, porto, comboio, 3).
tempo(braga, porto, comboio, 50).
ligacao(braga, [porto, comboio], 50, 3).

Tecnologias utilizadas
Prolog;
SWI-Prolog.


