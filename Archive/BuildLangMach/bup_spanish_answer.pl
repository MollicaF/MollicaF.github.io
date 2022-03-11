rule(s,[np,vp]).
rule(s,[adv,s]).

rule(vp,[tv,np]).
rule(vp,[tv, ap]).
rule(vp,[sv,s]).
rule(vp,[vp,pp]).
rule(vp,[iv]).
rule(vp,[neg, vp]).
rule(vp,[vp, adv]).
rule(vp,[adv, vp]).
rule(vp,[aux, vperf]).

rule(np,[dt,n]).
rule(np,[pn]).
rule(n,[adj,n]).
rule(n,[n,pp]).
rule(np, [n]).

rule(pp,[p,np]).

rule(ap, [adv, adj]).
rule(ap, [adj]).

rule(adv,[p,adv]).

rule(np, [np, conj, np]).

lex(p,a).
lex(n,abagado).
lex(n,alma).
lex(n,aqui).
lex(adv,aqui).
lex(n,arbol).
lex(iv, desperto).
lex(adv, ayer).
lex(n, azucar).
lex(adj, azur).
lex(n, binoculos).
lex(n,burro).
lex(n,cafe).
lex(n, calcetines).
lex(n, camisa).
lex(iv, cayo).
lex(n, cielo).
lex(p, con).
lex(iv, corren).
lex(n, cumpleanos).
lex(p, de).
lex(tv, descubre).
lex(n, dinero).
lex(iv, duermen).
lex(dt, el).
lex(p, en).
lex(tv, es).
lex(tv, esconde).
lex(tv, escribe).
lex(tv, esta).
lex(dt, esta).
lex(adj, fabulosa).
lex(n,fuera).
lex(n, gente).
lex(tv, golpea).
lex(aux, ha).
lex(n, hombre).
lex(adv, hoy).
lex(n, journalista).
lex(dt, la).
lex(n, leche).
lex(n, libre).
lex(adj, loca).
lex(dt, los).
lex(dt, mis).
lex(adj, muertos).
lex(n, muertos).
lex(adv, muy).
lex(n, nina).
lex(n, nino).
lex(neg, no).
lex(pn, nosotros).
lex(n, novia).
lex(n, oficina).
lex(tv, olvido).
lex(n, pajaro).
lex(n, pelota).
lex(tv, perdio).
lex(n, periodico).
lex(n, perra).
lex(n, pollo).
lex(tv, queremos).
lex(n, racha).
lex(adv, repente).
lex(n, sol).
lex(dt, sus).
lex(vperf, terminado).
lex(tv, tiene).
lex(n, tio).
lex(iv, trabaja).
lex(dt, un).
lex(dt, una).
lex(tv, veo).
lex(n, verdad).
lex(conj, y).
lex(pn, yo).

% = CHART BOTTOM-UP PASSIVE =======================================

:- dynamic arc/4.
:- dynamic scan/3.

%%%============================================= chart_recognize_bottomup(+sentence)

chart_recognize_bottomup(Input, Parse_Tree) :-
        cleanup,
        initialize_chart(Input, 0),
        process_chart_bottomup,
        length(Input, N),
        arc(0, N, s, Parse_Tree).
 
%%% =======================================================CLEANUP
cleanup :-  
        retractall(scan(_,_,_)),
        retractall(arc(_,_,_,_)).
 
%%% =============================================initialize(+sentence, +start node)
initialize_chart([], _).
initialize_chart([Word|Input], From) :-
        To is From + 1,
        assertz(scan(From, To, Word)),
        initialize_chart(Input, To).
 
%%%==================================================== process_chart_bottomup
process_chart_bottomup :-
         doall(
              (scan(From, To, Word),
               lex(Cat,Word), Node =.. [Cat,Word],
               add_arc(arc(From, To, Cat, Node)))
          ).
 
%%%========================================================== add_arc(+arc)
add_arc(Arc) :-
        \+ Arc,
        assert(Arc),
        new_arcs(Arc).
 
%%% ==============================================================new_arcs(+Arc)
new_arcs(arc(J, K, Cat, ParseJK)) :-
         doall(
               (rule(LHS,RHS),
               append(Before, [Cat], RHS),
               path(I, J, Before,ParseIJ),
		append([LHS|ParseIJ],[ParseJK], Google),
               Node =.. Google,
               add_arc(arc(I, K, LHS, Node)))
                ).
 
%% ================================================path(?start node, ?end node, +categories)
path(I, I, [],[]).
path(I, K, [Cat|Cats],[PIJ|PIK]) :-
        arc(I, J, Cat,PIJ),
        J =< K,
        path(J, K, Cats,PIK).


%%% ============================================================doall(+goal)

doall(Goal) :-  
        Goal, fail.
doall(_) :- true.

%%%%====================================================

