# Projeto 2 — Parte A

## Itinerário e Meios de Transporte — Caminho Mais Económico

Esta pasta contém a Parte A do Projeto 2, desenvolvida no âmbito da unidade curricular de Técnicas de Inteligência Artificial.

O projeto foi implementado em Prolog e tem como objetivo recomendar o itinerário mais económico entre duas cidades, considerando diferentes meios de transporte e respetivos custos.

## Objetivo

Nesta parte, o sistema procura encontrar o caminho de menor custo entre uma cidade de origem e uma cidade de destino.

Foram implementados diferentes métodos de resolução:

- Gerar e Testar;
- Depth First;
- Hill Climbing.

## Ficheiros

- `projeto2A_bd.pl` — base de dados com cidades, ligações, meios de transporte e custos;
- `projeto2A_metodos.pl` — métodos de procura e otimização para encontrar o caminho de menor custo;
- `projeto2A_interface.pl` — interface de interação com o utilizador.

## Funcionamento

O sistema começa por pedir ao utilizador a cidade de origem e a cidade de destino.

Depois, o utilizador escolhe o método de resolução que pretende utilizar:

1. Gerar e Testar;
2. Hill Climbing;
3. Depth First.

No final, o sistema apresenta o caminho recomendado, o custo total e os meios de transporte utilizados.

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
[projeto2A_interface].

Depois executar:
interface.

Exemplo de dados
arco(braga, porto, comboio).
custo(braga, porto, comboio, 3).
ligacao(braga, [porto, comboio], 3).

Tecnologias utilizadas
Prolog;
SWI-Prolog.


