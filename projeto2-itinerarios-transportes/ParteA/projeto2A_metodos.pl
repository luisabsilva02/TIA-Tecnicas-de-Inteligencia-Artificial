%------------------------gerar e testar-------------------
%encontra o caminho de menor custo entre dois pontos. Ele gera todas as combinacoes de caminhos possiveis e calcula o custo total de cada caminho, selecionando o caminho com o menor custo.

caminho_menor_custo(X, Y, Caminho, Custo, Transportes) :-
    % Encontra todos os caminhos possiveis de X para Y e seus custos
    findall([CaminhoAtual, CustoAtual, TransportesAtual], caminho(X, Y, [], CaminhoAtual, 0, CustoAtual, TransportesAtual), Resultados1),
    % Encontra todos os caminhos possiveis de Y para X e seus custos
    findall([CaminhoAtual, CustoAtual, TransportesAtual], caminho(Y, X, [], CaminhoAtual, 0, CustoAtual, TransportesAtual), Resultados2),
    % Combina os resultados dos dois sentidos
    append(Resultados1, Resultados2, TodosResultados),
    % Encontra o caminho de menor custo entre todos os resultados
    menor_custo(TodosResultados, CaminhoInvertido, Custo, TransportesInvertidos),
    % Inverte o caminho e a lista de transportes se necess�rio
    (CaminhoInvertido = [X|_]
    -> Caminho = CaminhoInvertido, Transportes = TransportesInvertidos
    ; inverte_caminho(CaminhoInvertido, Caminho), inverte_transportes(TransportesInvertidos, Transportes)).

% Percorre o caminho de X para Y, calculando o custo total
caminho(Y, Y, Visitados, [Y], CustoAtual, CustoAtual, []) :-
    % Verifica se Y nao foi visitado anteriormente
    \+ member(Y, Visitados).

caminho(X, Y, Visitados, [X|Caminho], CustoAtual, CustoTotal, [Transporte|Transportes]) :-
    % Verifica se X nao foi visitado anteriormente
    \+ member(X, Visitados),
    % Encontra um arco entre X e Z, com o respectivo transporte
    arco(X, Z, Transporte),
    % Verifica se Z nao foi visitado anteriormente
    \+ member(Z, Visitados),
    % Obtem o custo do transporte de X para Z
    custo(X, Z, Transporte, Custo),
    % Calcula o novo custo total
    NovoCusto is CustoAtual + Custo,
    % Percorre recursivamente o caminho de Z para Y
    caminho(Z, Y, [X|Visitados], Caminho, NovoCusto, CustoTotal, Transportes).

% Encontra o caminho de menor custo entre os resultados
menor_custo([[Caminho, Custo, Transportes]], Caminho, Custo, Transportes).

menor_custo([[Caminho, Custo, Transportes]|Resto], CaminhoMenor, CustoMenor, TransportesMenor) :-
    menor_custo(Resto, CaminhoAux, CustoAux, TransportesAux),
    % Compara o custo do caminho atual com o menor custo encontrado at� agora
    (Custo < CustoAux -> (CaminhoMenor = Caminho, CustoMenor = Custo, TransportesMenor = Transportes); (CaminhoMenor = CaminhoAux, CustoMenor = CustoAux, TransportesMenor = TransportesAux)).

% Inverte a ordem dos elementos em uma lista
inverte_caminho([], []).
inverte_caminho([H|T], L) :- inverte_caminho(T, X), concatenar(X, [H], L).

% Inverte a ordem dos elementos em uma lista
inverte_transportes([], []).
inverte_transportes([H|T], L) :- inverte_transportes(T, X), append(X, [H], L).

% Concatena duas listas
concatenar([], L, L).
concatenar([H|T], L, [H|D]) :- concatenar(T, L, D).

%------------------Depth First---------------------
% Caso de saida, quando a ciade atual e o destino, retorna o custo acumulado.
% Função de verificação de caminho: O destino é alcançado
path(City, City, _, [], Cost) :- Cost = 0.

% Recursão: Encontrar o caminho de custo mínimo da cidade atual para o destino
path(City, Destination, Visited, [(City, NextCity, Transport) | Path], Cost) :-
    \+ member(City, Visited), % assegurar que a cidade ainda não foi visitada
    ligacao(City, [NextCity, Transport], StepCost), % consultar a base de dados para encontrar a ligação
    path(NextCity, Destination, [City | Visited], Path, RemainingCost),
    Cost is StepCost + RemainingCost.

% Função de entrada
custo_depth(Origin, Destination, AllPaths) :-
    findall((Cost, Path),
        (path(Origin, Destination, [], Path, Cost)),
        AllPaths),
    find_min_cost_path(AllPaths, MinCost, MinPath),
    write('-------------------------------------------------------'),nl,
    format("Custo total: ~w~n", [MinCost]),nl,
    write('Caminho: '),nl,
    imprimir(MinPath).

% Predicado para encontrar o caminho de custo mínimo de uma lista
find_min_cost_path([(Cost, Path)], Cost, Path).
find_min_cost_path([(Cost, Path) | Rest], MinCost, MinPath) :-
    find_min_cost_path(Rest, RestMinCost, RestMinPath),
    (Cost < RestMinCost ->
        (MinCost = Cost, MinPath = Path);
        (MinCost = RestMinCost, MinPath = RestMinPath)
    ).

% Função para imprimir o resultado
imprimir([]) :- nl.
imprimir([(Origem, Destino, Transporte) | Resto]) :-
    nl, write('         '),write('De '), write(Origem),
    write(' para '), write(Destino),
    write(' utilizando '), write(Transporte), write('. '),nl,nl, write('         '),
    imprimir(Resto).

%-----------------------Stoichastic Hill Climbing------------------------------------------------
% Caso de saída, quando a cidade atual é o destino, retorna o custo acumulado.
path_a(City, City, _, [], Cost) :- Cost = 0.

% Recursão: Encontrar o caminho de custo mínimo da cidade atual para o destino
path_a(City, Destination, Visited, [(City, NextCity, Transport) | Path], Cost) :-
    \+ member(City, Visited), % Assegurar que a cidade ainda não foi visitada
    ligacao(City, [NextCity, Transport], StepCost), % Consultar a base de dados para encontrar a ligação
    path_a(NextCity, Destination, [City | Visited], Path, RemainingCost),
    Cost is StepCost + RemainingCost.

% Função de entrada
custo_hill(Origin, Destination, MinPath) :-
    findall((Cost, Path),
        (path_a(Origin, Destination, [], Path, Cost)),
        AllPaths),
    stochastic_hill_climbing_a(AllPaths, BestPath),
    write('-------------------------------------------------------'), nl,
    write('Custo Total: '), BestPath = (X, MinPath), write(X), write(' Euros'), nl,nl, write('Caminho: '),nl,
    imprimir(MinPath).

% Algoritmo para encontrar o melhor caminho
stochastic_hill_climbing_a(Paths, BestPath) :-
    random_permutation(Paths, ShuffledPaths), % Embaralhar as paths aleatoriamente.
    evaluate_paths(ShuffledPaths, BestPath).

% Avaliar o melhor caminho e retorná-lo
evaluate_paths([Path], Path).
evaluate_paths([Path1, Path2 | Rest], BestPath) :-
    evaluate_paths([Path2 | Rest], CurrentBestPath),
    compare_paths(Path1, CurrentBestPath, BestPath).

% Comparar dois caminhos e retornar o melhor
compare_paths(Path1, Path2, BestPath) :-
    Path1 = (Cost1, _),
    Path2 = (Cost2, _),
    (Cost1 < Cost2 -> BestPath = Path1 ; BestPath = Path2).

