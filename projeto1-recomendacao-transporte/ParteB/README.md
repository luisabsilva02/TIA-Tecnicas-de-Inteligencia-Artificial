# Projeto 1 — Parte B

## Aquisição Automática de Conhecimento para Recomendação de Meio de Transporte

Esta pasta contém a Parte B do Projeto 1, desenvolvida no âmbito da unidade curricular de Técnicas de Inteligência Artificial.

Nesta parte, o sistema mantém o objetivo de recomendar meios de transporte, mas a base de conhecimento foi obtida através de aquisição automática de conhecimento, recorrendo a técnicas de Data Mining.

## Objetivo

O objetivo desta parte é gerar regras de conhecimento de forma automática e adaptá-las para utilização em Prolog.

A aquisição automática de conhecimento foi realizada com recurso ao RapidMiner, a partir de dados organizados previamente. As regras resultantes foram depois convertidas e integradas no sistema Prolog.

## Ficheiros

- `bc.pl` — base de conhecimento resultante da aquisição automática;
- `bd.pl` — base de dados com os meios de transporte e respetivas características;
- `forward.pl` — sistema de inferência por forward chaining;
- `proof.pl` — mecanismo de prova;
- `interface.pl` — interface de interação com o utilizador.

## Funcionamento

O sistema utiliza factos fornecidos pelo utilizador através da interface e aplica regras de inferência para chegar a características finais.

Essas características são posteriormente comparadas com a base de dados de transportes, permitindo apresentar uma recomendação.

## Como executar

Para executar esta parte, é necessário ter o SWI-Prolog instalado.

Abrir o SWI-Prolog nesta pasta e carregar o ficheiro principal:

```prolog
[interface].

Depois executar:
interface.

Exemplo de regras
if max5pessoas then final:transporte_pessoal.
if mais5pessoas then final:transporte_publico.
if enjoos then final:confortavel.
if urgente then final:rapido.

Tecnologias utilizadas
Prolog;
SWI-Prolog;
RapidMiner.


