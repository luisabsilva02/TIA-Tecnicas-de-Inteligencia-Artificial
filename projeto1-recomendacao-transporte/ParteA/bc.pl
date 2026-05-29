if viagem_trabalho and urgente then rapido.
if viagem_trabalho and n_urgente then lento.
if viagem_trabalho and preco_baixo then final:barato.
if viagem_trabalho and computador then wifi.
if lento and wifi then final:tomada.
if rapido and wifi then final:online.
if enjoos then final:confortavel.
if viagem_trabalho and mais5pessoas then mais5lugares.
if viagem_trabalho and max5pessoas then max5lugares.
if viagem_trabalho and mais5lugares then final:transporte_publico.
if fumador and max5lugares then final:transporte_pessoal.

if viagem_lazer and urgente then rapido.
if viagem_lazer and n_urgente then lento.
%if enjoos then final:confortavel.
if viagem_lazer and preco_baixo then final:barato.
if viagem_lazer and mais5pessoas then mais5lugares.
if viagem_lazer and max5pessoas then max5lugares.
if viagem_lazer and mais5lugares then final:transporte_publico.
if viagem_lazer and estadia then final:bagagemDePorao.
if rapido and estadia then final:bagagemDeMao.




