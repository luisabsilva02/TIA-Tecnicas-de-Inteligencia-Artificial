
%a simple backward chaining rule interpreter
:-op(800, fx, if).
:-op(700, xfx, then).
:-op(300, xfy, or).
:-op(500, xfy, and).
:-op( 800, xfx, <=).


% Simple forward chaining in Prolog
demo:-new_derived_fact(P), !, assert(fact(P)),demo.
demo:-write('Obrigado pela sua preferencia!').
new_derived_fact(Concl):-if Cond then Concl, \+ fact(Concl), composed_fact(Cond).

composed_fact(Cond):- fact(Cond).
composed_fact(Cond1 and Cond2):-
    composed_fact(Cond1),
    composed_fact(Cond2).
composed_fact(Cond1 or Cond2):-
    composed_fact(Cond1);
    composed_fact(Cond2).
