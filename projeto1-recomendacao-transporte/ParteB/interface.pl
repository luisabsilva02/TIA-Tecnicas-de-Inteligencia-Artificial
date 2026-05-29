:-dynamic(fact/1).
:-[bd,bc,proof,forward].

%:-initialization(interface).

interface:- retractall(fact(_)), nl,nl,write('Bem-vindo ao nosso sistema baseado em conhecimento!!'),nl,
write('Necessita de ajuda para recomendacao de meio de transporte?'),nl,
    write(' "1." - Sim, ajude-me'),nl,
    write('"0." - Nao. Quero sair '),nl,read(A),(
               (1 == A), nl,origem,nl;
               (0 == A), nl,write('Terminou'),halt).
%braga, porto,aveiro,guima,viseu,lisboa,faro,coimbra,
origem:- nl,nl,write('Qual o seu local de partida?'),nl,
    write(' "1." - Braga  '),nl,
    write(' "2." - Porto  '),nl,
    write(' "3." - Faro  '),nl,
    write(' "4." - Guimaraes  '),nl,
    write(' "5." - Aveiro  '),nl,
    write(' "6." - Lisboa  '),nl,
    write(' "7." - Coimbra  '),nl,


    read(B),(
               (1 == B), nl,assert(origem(braga)),destino,nl;
               (2 == B), nl,assert(origem(porto)),destino,nl;
               (3 == B), nl,assert(origem(faro)),destino,nl;
               (4 == B), nl,assert(origem(guimaraes)),destino,nl;
               (5 == B), nl,assert(origem(aveiro)),destino,nl;
               (6 == B), nl,assert(origem(lisboa)),destino,nl;
               (7 == B), nl,assert(origem(coimbra)),destino,nl;
               (otherwise), nl,write('Introduza uma opcao valida, por favor comece de novo!'),nl,nl, origem).


destino:- nl,nl,write('Qual o seu destino? '),nl,
    write(' "1." - Braga  '),nl,
    write(' "2." - Porto  '),nl,
    write(' "3." - Faro  '),nl,
    write(' "4." - Guimaraes  '),nl,
    write(' "5." - Aveiro  '),nl,
    write(' "6." - Lisboa  '),nl,
    write(' "7." - Coimbra  '),nl,


    read(C),(
               (1 == C), nl,assert(destino(braga)),tipo_viagem,nl;
               (2 == C), nl,assert(destino(porto)),tipo_viagem,nl;
               (3 == C), nl,assert(destino(faro)),tipo_viagem,nl;
               (4 == C), nl,assert(destino(guimaraes)),tipo_viagem,nl;
               (5 == C), nl,assert(destino(aveiro)),tipo_viagem,nl;
               (6 == C), nl,assert(destino(lisboa)),tipo_viagem,nl;
               (7 == C), nl,assert(destino(coimbra)),tipo_viagem,nl;
               (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, destino).

tipo_viagem:-nl,nl,write('Qual o seu objetivo de viagem?'),nl,
    write(' "1." - Trabalho'),nl,
    write('" 2." - Lazer'),nl,

read(D),(
    (1 == D), assert(fact(viagem_trabalho)),pc,nl;
    (2 == D), assert(fact(viagem_lazer)),estadia,nl;
    (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, estadoViajante).

estadia:-nl,nl,write('Quanto tempo vai ficar hospedada?'),nl,
write('1. - Mais de uma semana'),nl,
write('2. - menos de uma semana '),nl,

read(G),(
    (1 == G), assert(fact(bagagem)),estadoViajante;
    (2 == G), assert(fact(n_bagagem)),estadoViajante;
    (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, estadia).


pc:-nl,nl,write('Pretende usar computador durante a viagem?'),nl,
write('1. - Sim'),nl,
write('2. - Nao '),nl,

read(G),(
    (1 == G), assert(fact(computador)),estadoViajante;
    (2 == G), assert(fact(n_computador)),estadoViajante;
    (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, pc).

estadoViajante:-nl,nl,write('E urgente?'),nl,
    write(' "1." - Quero chegar ao destino o mais cedo possivel'),nl,
    write('" 2." - Nao, tenho tempo'),nl,

read(D),(
    (1 == D), assert(fact(urgente)),preco,nl;
    (2 == D), assert(fact(n_urgente)),preco,nl;
    (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, estadoViajante).


preco:-nl,nl,write('Quanto e que esta disposto a gastar?'),nl,
write('1. - O minimo possivel '),nl,
write('2. - Isso nao e problema para mim'),nl,

read(E),(
    (1 == E), assert(fact(preco_baixo)),enjoo;
    (2 == E), assert(fact(preco_alto)),enjoo;
    (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, preco).

enjoo:-nl,nl,write('Tem enjoos?'),nl,
write('1. - Sim'),nl,
write('2. - Nao'),nl,

read(F),(
    (1 == F), assert(fact(enjoos)),fumador;
    (2 == F), assert(fact(n_enjoos)),fumador;
    (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, enjoo).

fumador:-nl,nl,write('Fuma?'),nl,
write('1. - Sim sou fumador'),nl,
write('2. - Nao'),nl,

read(H),(
    (1 == H), assert(fact(fumador)),numero_pessoas;
    (2 == H), assert(fact(n_fumador)),numero_pessoas;
    (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, fumador).

numero_pessoas:-
    nl, write('Quantas pessoas vao consigo na viagem? '), nl,
    read(N),
    (N > 5, assert(fact(mais5pessoas)), resultado;
     N =< 5, assert(fact(max5pessoas)), resultado;
    (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, numero_pessoas).

resultado :-   nl,nl,demo, comparar.

comparar :-
    origem(Origem),
    destino(Destino),
    findall(bd(L, M, Origem, Destino,Distancia,Custo), bd(L, M, Origem, Destino,Distancia,Custo), K),
    resposta(K),fim.


resposta([]) :-
    write('Esperemos que goste da recomendacao,aproveite!'),nl, write('Se nao houver recomendacoes disponiveis no momento, tente novamente mais tarde.').

resposta([bd(X, T, O,D,M,C) | R]) :-
    findall(B, fact(final:B), L),
    subset(L, X),nl,nl,
     write('___________ '),write('Meio de transporte mais recomendado '),write('___________ '),nl,nl,write('                  '),write(T),nl,nl, nl,
     write('-> '),write('Origem: '), write(O),nl,nl,
    write('-> '),write('Destino: '), write(D), nl, nl,
    write('-> '),write('Distancia: '), write(M), nl, nl,
     write('-> '),write('Custo: '), write(C), nl, nl, nl,

    resposta(R).

resposta([_|R]) :-
    resposta(R).

fim :-
    retractall(fact(_)),
    retractall(origem(_)),
    retractall(destino(_)),nl,nl,nl,
    write('Obrigado pela sua preferencia! Deseja ser recomendado novamente ?'), nl, nl,
    write(' "1." - Sim, por favor'),nl,
    write('"0." - Nao. Quero sair '), nl,
    read(Z),(
        (1 == Z), nl, retractall(fact(_)), origem;
        (0 == Z), nl, write('Terminou'), halt;
        (otherwise), nl,write('Introduza uma opcao valida, por favor tente novamente!'),nl,nl, fim).

