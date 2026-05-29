# Projeto 1 — Parte A

## Sistema Baseado em Conhecimento para Recomendação de Meio de Transporte

Esta pasta contém a Parte A do Projeto 1, desenvolvida no âmbito da unidade curricular de Técnicas de Inteligência Artificial.

Nesta parte, foi implementado um Sistema Baseado em Conhecimento em Prolog, com aquisição manual de conhecimento. O objetivo é recomendar ao utilizador o meio de transporte mais adequado para uma viagem, tendo em conta diferentes preferências e necessidades.

## Objetivo

O sistema faz perguntas ao utilizador e, com base nas respostas, cria factos que são usados por regras de inferência para chegar a uma recomendação.

Entre os critérios considerados estão:

- tipo de viagem;
- urgência;
- preço;
- utilização de computador;
- conforto;
- enjoos;
- número de pessoas;
- transporte público ou pessoal;
- bagagem.

## Ficheiros

- `bc.pl` — base de conhecimento com as regras de inferência;
- `bd.pl` — base de dados com os meios de transporte e respetivas características;
- `forward.pl` — sistema de inferência por forward chaining;
- `proof.pl` — mecanismo de prova;
- `interface.pl` — interface de interação com o utilizador.

## Funcionamento

O sistema começa por perguntar ao utilizador se pretende receber uma recomendação. Depois recolhe informação sobre a viagem e utiliza regras de produção para deduzir características finais.

Essas características são comparadas com a base de dados dos meios de transporte, permitindo apresentar uma recomendação adequada ao perfil indicado pelo utilizador.

## Como executar

Para executar esta parte, é necessário ter o SWI-Prolog instalado.

Abrir o SWI-Prolog nesta pasta e carregar o ficheiro principal:

```prolog
[interface].

Depois executar:
interface.

O sistema irá apresentar as perguntas na consola e, no final, mostrará a recomendação de transporte.

Exemplo de regras
if viagem_trabalho and urgente then rapido.
if viagem_trabalho and preco_baixo then final:barato.
if enjoos then final:confortavel.

Tecnologias utilizadas
Prolog;
SWI-Prolog.
