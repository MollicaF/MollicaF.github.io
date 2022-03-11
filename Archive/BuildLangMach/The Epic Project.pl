% chat/0 is the main cycle. It processes the input
% and then decides if/how it wants to respond

chat:-
 repeat,
   readinput(Input),
   process(Input),
   (Input = [bye]),!.


process([bye]):-
   write('> bye!').



process(Sentence):- 
	chart_sem(Sentence,Proposition),!,  % chart_sem/2 is the equivalent of parse
	check_sem(Proposition),nl.          % chart_sem/1 is a model checker and responder


readinput(List):-
   read_line_to_codes(user_input,Input),
   string_to_atom(Input,IA),
   concat_atom(List,' ',IA). 

%=====================================================================================
%  LEXICON
%=====================================================================================

% 		ADJECTIVES

lemma([u,n,u,s,u,a,l],adj).
lemma([p,r,e,c,i,o,u,s],adj).
lemma([b,l,u,e],adj).
lemma([w,h,i,t,e],adj).
lemma([r,e,d],adj).
lemma([p,i,n,k],adj).
lemma([y,e,l,l,o,w],adj).
lemma([b,l,a,c,k],adj).
lemma([g,r,e,e,n],adj).
lemma([o,p,e,n],adj).
lemma([t,e,a],adj).
lemma([u,n,s,t,a,b,l,e],adj).
lemma([o,u,t,s,i,d,e],adj).
lemma([c,l,e,a,r],adj).
lemma([c,o,o,k,i,e],adj).

%		NOMINALS
% Common Nouns

lemma([r,i,n,g],n).
lemma([c,u,r,t,a,i,n],n).
lemma([k,i,t,c,h,e,n],n).
lemma([c,u,p,b,o,a,r,d],n).
lemma([s,h,o,e],n).
lemma([c,u,p],n).
lemma([t,h,i,n,g],n).
lemma([g,i,r,l],n).
lemma([d,a,u,g,h,t,e,r],n).
lemma([p,e,r,s,o,n],n).
lemma([b,a,l,l],n).
lemma([m,o,t,h,e,r],n).
lemma([w,o,m,a,n],n).
lemma([d,i,s,h],n).
lemma([b,o,x],n).
lemma([t,a,b,l,e],n).
lemma([m,a,n,u,a,l],n).
lemma([w,a,t,e,r],n).
lemma([b,o,y],n).
lemma([b,o,o,k],n).
lemma([c,o,o,k,i,e],n).
lemma([w,i,n,d,o,w],n).
lemma([s,i,n,k],n).
lemma([c,o,u,n,t,e,r],n).
lemma([s,t,o,o,l],n).
lemma([p,l,a,t,e],n).
lemma([p,a,t,h],n).
lemma([p,u,d,d,l,e],n).
lemma([j,a,r],n).

% Proper Nouns

lemma([a,l,e,x,i,s],pn).
lemma([a,r,a,g,o,r,n],pn).
lemma([a,r,w,e,n],pn).
lemma([m,e,l,c,h,i,o,r],pn).
lemma([b,i,l,b,o],pn).
lemma([g,a,n,d,a,l,f],pn).
lemma([s,u,e],pn).

%		VERBS
% Intransitive

lemma([l,a,u,g,h],iv).
lemma([o,v,e,r,f,l,o,w],iv).
lemma([s,n,o,r,e],iv).
lemma([b,l,i,n,k],iv).
lemma([s,n,e,e,z,e],iv).

% Transitive

lemma([a,s,s,i,s,t],tv).
lemma([h,o,l,d],tv).
lemma([s,e,e],tv).
lemma([f,a,c,e],tv).
lemma([c,o,n,t,a,i,n],tv).
lemma([w,e,a,r],tv).
lemma([g,r,a,b],tv).
lemma([o,v,e,r,f,l,o,w],tv).
lemma([w,a,s,h],tv).
lemma([b,e,l,o,n,g],pv).

% Ditransitive

lemma([g,i,v,e],dtv).
lemma([d,o,n,a,t,e],pdv).
lemma([p,u,t],pdv).
lemma([t,h,r,o,w],dtv).
lemma([h,i,d,e],pdv).

%		PREPOSITIONS

lemma([u,n,d,e,r],p).
lemma([t,o],p).
lemma([o,n],p).
lemma([i,n],p).
lemma([i,n,s,i,d,e],p).


%=====================================================================
% 			MORPHOLOGICAL PARSER ;) ;)
%===============================:P====================================

%==========================================================================
%      GREEDY MORPHEMIZER
% This will break down a letter string into morphemes, which handles
% verb inflections
%==========================================================================

greed([],[]).
greed(String,[Morpheme|MorphemeList]):- morphemize([],String,StringRest,Morpheme), greed(StringRest,MorphemeList).

morphemize(String,[Char|Rest1],Rest2,Morpheme):- append(String,[Char],NewString), check(NewString,Rest1,Rest2,Morpheme).

check(NewString,Rest,Rest,NewString):- morpheme(NewString).
check(NewString,Rest1,Rest2,Morpheme):- morphemize(NewString,Rest1,Rest2,Morpheme).

% Morphemes

morpheme([e,d]).
morpheme([d]).
morpheme([e,s]).
morpheme([s]).
morpheme([i,n,g]).
morpheme([e,n]).

morpheme(X):- lemma(X,_). % This ensures all content lemmas are morphemes

%============================================================================
% The lexicon has entries with lists [a,b,c], which is not efficient 
% reflecting back on the code but there is no extra credit for efficiency.
% stringtolist/2 takes a lexeme abc as its second argument and outputs the 
% lemma [a,b,c] as its first argument. The argument structure is reversed but
% we are not gonna change it.

stringtolist(List,Atom):- string_to_list(Atom,CL), converted(CL,List).

converted([],[]).
converted([X|L],[Y|L2]):- char_code(Y,X), converted(L,L2).

%==============================================================================
% Welcome to the Syn-Sem interface
%	Where words retrieve their meaning
%==============================================================================

% Typically lex/2 has a semantic representation that is made from its lemma 
% as its first argument and the lexeme itself as its second argument. These entries
% are accessed by the bottom up charser to populate the chart with POS and semantics
% for each word in the input.


% 		ADJECTIVES

lex(adj((X^P)^X^and(P,RUI)),Lexeme):-stringtolist(Lemma,Lexeme),lemma(Lemma,adj),RUI=..[Lexeme,X].

%		NOMINALS
% Common Nouns

lex(n(X^P),Lexeme):- stringtolist(Lemma,Lexeme),lemma(Lemma,n), P =..[Lexeme,X].

% Proper Names

lex(pn((Lexeme^X)^X),Lexeme):- stringtolist(Lemma,Lexeme),lemma(Lemma,pn).

%		VERBS

% Intransitive

lex(iv(X^P,[]),Lexeme):- stringtolist(Lemma,Lexeme),lemma(Lemma,iv), P =..[Lexeme,X].

% Transitive

lex(tv(K^W^P,[]),Lexeme):- stringtolist(Lemma,Lexeme), lemma(Lemma,tv), P =..[Lexeme,K,W].
lex(pv(K^W^P,[]),Lexeme):- stringtolist(Lemma,Lexeme), lemma(Lemma,pv), P =..[Lexeme,K,W].

% Ditransitive

lex(dtv(A^K^W^P,[]),Lexeme):- stringtolist(Lemma,Lexeme), lemma(Lemma,dtv), P =..[Lexeme,A,K,W].
lex(pdv(A^K^W^P,[]),Lexeme):- stringtolist(Lemma,Lexeme), lemma(Lemma,pdv), P =..[Lexeme,A,K,W].


%		PREPOSITIONS

lex(p,Lexeme):- stringtolist(Lemma,Lexeme),lemma(Lemma,p).
lex(p((Y^R)^Q^(X^P)^and(P,Q),[]),Lexeme):- stringtolist(Lemma,Lexeme),lemma(Lemma,p),R=..[Lexeme,X,Y].
lex(pp1,Lexeme):-stringtolist(Lemma,Lexeme),lemma(Lemma,p).
lex(p1(X^(Y^P)^and(exists(Y,P),R),[]),Lexeme):- stringtolist(Lemma,Lexeme),lemma(Lemma,p),R=..[Lexeme,X,Y].


% 		DETERMINERS

% Universal Quantifier

lex(dt((X^P)^(X^Q)^forall(X,imp(P,Q))),every).

% Existential Quantifiers

lex(dt((X^P)^(X^Q)^exists(X,and(P,Q))),a).
lex(dt((X^P)^(X^Q)^exists(X,and(P,Q))),an).
lex(there((X^P)^exists(X,P)),there).
lex(dt((X^P)^(X^Q)^exists(X,and(P,Q))),some).

% Existential Quantifiers with presupposition

lex(dt((X^P)^(X^Q)^no(X,and(P,Q))),no).
lex(dt((X^P)^(X^Q)^the(X,and(P,Q))),the).
lex(the((X^P)^the(X,P)),the).

%		MISCELLANEOUS

% Negation

lex(neg,not).

% Auxillaries

lex(aux,did).
lex(aux,does).
lex(aux,do).
lex(aux,is).
lex(be,is).
lex(aux,has).
lex(aux,was).
lex(be,was).
lex(aux,have).
lex(aux,had).

% Complementizers/Question Words

lex(whpr((X^P)^q(X,and(person(X),P))),who).
lex(whpr((X^P)^q(X,and(thing(X),P))),what).
lex(whpr((X^P)^(X^Q)^q(X,and(P,Q))),which).
lex(whpr((X^P)^(X^Q)^q(X,and(P,Q))),what).

lex(rel,that).
lex(rel,who).

% Irregular Verbs
% 	are just redirected to the the lex/2 for their lemma to make a
% semantic representation.

lex(Sem,gave):-lex(Sem,give).
lex(Sem,hid):-lex(Sem,hide).
lex(Sem,wore):-lex(Sem,wear).
lex(Sem,held):-lex(Sem,hold).
lex(Sem,saw):-lex(Sem,see).
lex(Sem,threw):-lex(Sem,throw).

% Inflected Verbs
% 	The inflected verb would be broken up to a verb morpheme and an inflectional morpheme.
% The inflection is clipped off (yes this is crude) and the semantic representation of the verb
% is built from the uninflected lemma.

lex(Sem,Word):- stringtolist(Lemma,Word), greed(Lemma,[V_lemma,Inflection]), member(Inflection,[[e,d],[d],[e,s],[s],[i,n,g],[e,n]]), concat_atom(V_lemma,'',V_lex), lex(Sem,V_lex).

%=========================================================================
% Phrase Structure Rules 
%=========================================================================
% One may traditionally call this section the grammar. These are the rules
% for combining semantic representation and POS that are used by the
% bottom up chart parser implemented below.

% Sentences

rule(s(Y,WH),[np(X^Y),vp(X,WH)]).                
rule(s(X,[WH]),[vp(X,[WH])]).

rule(inv_s(Y,[WH]),[aux,np(X^Y),vp(X,[WH])]).

% Questions

rule(Y,[whpr(X^Y),vp(X,[])]). 
rule(K,[whpr(P^Q^K),n(P),vp(Q,[])]).
rule(ynq(Y),[aux,np(X^Y),vp(X,[])]). 
rule(ynq(Y),[be,np1(Y)]). 
rule(Y,[whpr(X^Y),be,pp2(X,[])]).
rule(Z,[whpr((X^Y)^Z),inv_s(Y,[X])]).
rule(K,[whpr(P^(X^Y)^K),n(P),inv_s(Y,[X])]).

% Verb Phrases

rule(vp(X^W,[]),[tv(X^Y,[]),np(Y^W)]).
rule(vp(X^W,[WH]),[tv(X^Y,[WH]),np(Y^W),pp1]).
rule(vp(W,[WH]),[tv(Y,[WH]),np(Y^W)]).

rule(vp(X,WH),[iv(X,WH)]).
rule(vp(X,WH),[iv(X,WH),pp1]).

rule(vp(X^W,[]),[pv(X^Y,[]),pp1(Y^W,[])]).
rule(vp(X^W,[WH]),[pv(X^Y,[WH]),pp1(Y^W,[])]).
rule(vp(W,[WH]),[pv(Y,[WH]),pp1(Y^W,[])]).

rule(vp(X^P,[]),[pdv(X^Y^Z^R,[]),np((Y^Q)^P),pp1((Z^R)^Q,[])]).
rule(vp(X^P,[]),[dtv(X^Y^Z^R,[]),np((Z^Q)^P),np((Y^R)^Q)]).
rule(pdv(X^Y^Z^R,[]),[dtv(X^Y^Z^R,[])]).

rule(vp(X^Y,[]),[be,pp2(X^Y,[])]).

rule(vp(X^not(P),WH),[aux,neg,vp(X^P,WH)]).

% Noun Phrases

rule(np(Y),[dt(X^Y),n(X)]).
rule(np(X),[pn(X)]).
rule(np1(Y),[there(X^Y),dt(_),n(X)]).
rule(np1(Y),[the(X^Y),n(X)]).

% Adjective Phrases

rule(n(Y),[adj(X^Y),n(X)]).

% Prepositional Phrase

rule(n(X^Z),[n(X^Y),pp((X^Y)^Z,[])]). 
rule(pp1(X^Y,[]),[p,np(X^Y)]). 
rule(pp(Z,[]),[p(X^Y^Z,[]),np(X^Y)]). 
rule(pp2(X^R,[]),[p1(X^Q^R,[]),dt(_),n(Q)]).

% Relative Clauses

rule(rc(X^Y,[]),[rel,s(Y,[X])]).
rule(rc(Y,[]),[rel,vp(Y,[])]).
%rule(rc(X^Y,[]),[rel,s(Y,[X])]).
rule(n(X^and(P,Q)),[n(X^P),rc(X^Q,[])]).

% Gap Raising

rule(iv(X^K,[Y]),[tv(X^Y^K,[])]).
rule(iv(X^K,[Y]),[pv(X^Y^K,[])]).
rule(tv(Y^K,[X]),[tv(X^Y^K,[])]).
rule(pv(Y^K,[X]),[pv(X^Y^K,[])]).
rule(pv(X^Z^K,[Y]),[pdv(X^Y^Z^K,[])]).
rule(tv(X^Y^K,[Z]),[pdv(X^Y^Z^K,[])]).

%==========================================================
% CHART BOTTOM-UP PASSIVE 
%==========================================================
% This is a standard bottom up parser modified but borrowed
% from R. Chaves. It combines meanings and outputs a 
% semantic proposition.

:- dynamic arc/3.
:- dynamic scan/3.

%%% chart_recognize_bottomup(+sentence)
chart_sem(Input,Sem) :-
        cleanup,                    % this removes any remnants from parses past
        initialize_chart(Input, 0), % this populates the chart based on the input
        process_chart_bottomup,     % this combines meanings according to the above rules
        length(Input, N),           % this searches for a meaning that spans the lenth of the input
        arc(0, N, Sem).             % this outputs meaning
%        numbervars(X,0,_),nl,nl,          In general the chart parser can create propositions for
%        write(X).                         several ambiguities however the model checker only handles one
%                                          proposition. The parser could be augmented with stats to ensure
%                                          that the most likely proposition gets passed on.
 
%%% cleanup
cleanup :-  
        retractall(scan(_,_,_)),
        retractall(arc(_,_,_)).
 
%%% initialize(+sentence, +start node)
initialize_chart([], _).
initialize_chart([Word|Input], From) :-
        To is From + 1,
        assertz(scan(From, To, Word)),
        initialize_chart(Input, To).
 
%%% process_chart_bottomup
process_chart_bottomup :- 
         doall(
              (scan(From, To, Word),
               lex(Cat,Word),
               add_arc(arc(From, To, Cat)))
          ).
 
%%% add_arc(+arc)
add_arc(Arc) :-
        \+ Arc,
        assert(Arc),
        new_arcs(Arc).
 
%%% new_arcs(+Arc)
new_arcs(arc(J, K, Cat)) :-
         doall(
               (rule(LHS,RHS),
               append(Before, [Cat], RHS),
	       path(I, J, Before),
               add_arc(arc(I, K, LHS)))
                ).
 
%% path(?start node, ?end node, +categories)
path(I, I, []).
path(I, K, [Cat|Cats]) :-
        arc(I, J, Cat),
        J =< K,
        path(J, K, Cats).
 
%%% doall(+goal)

doall(Goal) :-  
        Goal, fail.
doall(_) :- true.


%==========================================================
% 		MODELS
%	But don't get too excited. 
%		They're not that type of model :/
%==========================================================

% This is the model we used when building the program.
% Consider it a relic/tribute to the sweat we put into
% this project.

%model([a,b,c,d,e,g,f,h,pass],
%       [[ball,[a]], 
%	[thing,[a,r,b,h,e,g,c,f]],
%	[person,[d,pass]],
%	[yellow,[f]],
%	[pink,[a]],
%	[ring,[r]],
%	[precious,[r]],
%	[red,[h]],
%	[box,[b,f]],
%	[blue,[b]],
%	[dish,[e]],
%	[contain,[[b,g],[b,a]]],
%	[manual,[g]],
%	[belong,[[a,d],[r,d]]],
%	[wash,[[d,b],[d,a],[d,e]]],
%	[in,[[a,b]]],
%	[under,[[f,h]]],
%	[table,[c,h]],
%	[on,[[e,c],[b,c]]],
%	[white,[c]],
%	[hide,[[d,r,pass]]], 
%	[bilbo,[d]],
%	[gandalf,[pass]],
%	[put,[[d,b,c]]]]).

% This model is based off of "The Cookie Theft", one of the
% pictures used by the Boston Aphasics Exam to diagnose 
% aphasia. We figured we'd see how we do. We never did figure
% out how to encode "to be full of" but its besides the point.

%model([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t],
%       [[thing,[b,c,d,e,g,h,i,j,k,l,n,o,p,q,r,s,t]],
%	[person,[a,f,m]],
%	[boy,[a]],
%	[cookie,[b,q]],
%	[grab,[[a,b]]],
%	[window,[c]],
%	[open,[c]],
%	[water,[d]],
%	[overflow,[[d,e]]],
%	[sink,[e]],
%	[dish,[g,h]],
%	[woman,[f]],
%	[tea,[i,j]],
%	[cup,[i,j]],
%	[counter,[k]],
%	[stool,[l]],
%	[unstable,[l]],
%	[girl,[m]],
%	[laugh,[m]],
%	[see,[]],
%	[belong,[[o,f]]],
%	[hold,[[f,g]]],
%	[full,[[e,d],[q,b]]],
%	[path,[n]],
%	[outside,[n]],
%	[clear,[n]],
%	[shoe,[o]],
%	[wear,[[f,o]]],
%	[in,[[o,p],[q,r],[m,s],[a,s],[f,s]]],
%	[puddle,[p]],
%	[assist,[[m,a]]],
%	[face,[[f,c]]],
%	[jar,[q]],
%	[cupboard,[r]],
%	[kitchen,[s]],
%	[give,[[a,b,m]]],
%	[contain,[[r,q],[q,b]]],
%	[curtain,[t]],
%	[on,[[i,k],[j,k],[t,c]]],
%	[wash,[[f,g]]]]).

% This is the model that contains most of the implementations
% from the project assignment file. There was one implementation
% which we decided was deontologically impossible in this and
% all other accessible possible worlds. It had a box in a table.
% We also didn't know what to put in the green box so OP did
% not deliver.
 

model([a,b,c,d,m,f,p,pb,b1,blb,y,w,s],

	[[thing,[a,b,c,d,p,pb,b1,blb,y,w]],
	[person,[m,f,s]],
	[red,[a,d]],
	[ball,[pb]],

	[pink,[pb]],

	[box,[a,y,b1]],
	[book,[b,c,w,blb]],
	[black,[blb]],
	[yellow,[y,w]],

	[contain,[[a,b],[y,w],[b1,pb],[b1,blb]]],

	[sue,[s]],

	[belong,[[pb,s]]],
	[blue,[c,b1]],
	[inside,[[blb,b1]]],
	[table,[d]],

	[on,[[a,d]]],
	[under,[[y,d],[b1,d]]],
	[give,[[m,d,f]]],
	[mary,[m]],
	[fred,[f]]]).


%==================================================
%   MODEL CHECKER
%==================================================
% The check_sem/1 evaluates the proposition
% according to the active model and responds to
% declarative sentences, content questions and 
% yes/no questions.

check_sem(Proposition):-
	check(Proposition),!.

check(Input):-
	Input=..[s,Formula,[]],
	( sat([],Formula,_), nl,
	write('That is correct.') ;
	nl, write('That is incorrect.')) ,!.

check(Input):-
	Input=..[q,X,Formula],
	( \+(sat([],exists(X,Formula),G)), nl,
	  write('I have no idea.') ;
	doall( (sat([],exists(X,Formula),G),
	describe(G,Output),nl, p(Output),nl))),!.

check(Input):-
	Input=..[ynq,Formula],
	(sat([],Formula,_), nl, 
	write('Yes') ; nl, write('No')),!.
	
	
% ==================================================
% Function i
% Determines the value of a variable/constant in an assignment G
% ==================================================

i(Var,G,Value):- 
    var(Var),
    member([Var2,Value],G), 
    Var == Var2.   

i(C,_,Value):- 
   nonvar(C),
   f(C,Value).


% ==================================================
% Function F
% Determines if a value is in the denotation of a Predicate/Relation
% ==================================================

f(Symbol,Value):- 
   model(_,F),
    member([Symbol,ListOfValues],F), 
    member(Value,ListOfValues).  


% ==================================================
% Extension of a variable assignment
% ==================================================

extend(G,X,[ [X,Val] | G]):-
   model(D,_),
   member(Val,D).


% ==================================================
% Existential quantifier
% ==================================================

sat(G1,exists(X,Formula),G3):-
   extend(G1,X,G2),
   sat(G2,Formula,G3).


% ==================================================
% Negation 
% ==================================================

sat(G,not(Formula),G):-
   \+ sat(G,Formula,_).

% ==================================================
% Universal quantifier
% ==================================================

sat(G, forall(X,Formula),G):-
  sat(G,not( exists(X,not(Formula) ) ),G).


% ==================================================
% Conjunction
% ==================================================

sat(G1,and(Formula1,Formula2),G3):-
  sat(G1,Formula1,G2), 
  sat(G2,Formula2,G3). 


% ==================================================
% Disjunction
% ==================================================


sat(G1,or(Formula1,Formula2),G2):-
  ( sat(G1,Formula1,G2) ;
    sat(G1,Formula2,G2) ).


% ==================================================
% Implication
% ==================================================

sat(G1,imp(Formula1,Formula2),G2):-
   sat(G1,or(not(Formula1),Formula2),G2).



% ==================================================
% Predicates
% ==================================================

sat(G,Predicate,G):-
   Predicate =.. [P,Var],
   \+ (P = not),
   i(Var,G,Value),
   f(P,Value).

% ==================================================
% Two-place Relations
% ==================================================

sat(G,Rel,G):-
   Rel =.. [R,Var1,Var2],
   \+ ( member(R,[exists,forall,and,or,imp]) ),
   i(Var1,G,Value1),
   i(Var2,G,Value2),
   f(R,[Value1,Value2]).

% ==================================================
% Three-place Relations
% ==================================================

sat(G,Rel,G):-
   Rel =.. [R,Var1,Var2,Var3],
   \+ ( member(R,[exists,forall,and,or,imp]) ),
   i(Var1,G,Value1),
   i(Var2,G,Value2),
   i(Var3,G,Value3),
   f(R,[Value1,Value2,Value3]).

% ==================================================
% The-Presupposition
% ==================================================

sat(G1,the(X,and(A,B)),G3):-
   sat(G1,exists(X,and(A,B)),G3),
   i(X,G3,Value), 
   \+ ( ( sat(G1,exists(X,A),G2), i(X,G2,Value2), \+(Value = Value2)) ).

% ==================================================
% No Quantifier
% ==================================================

sat(G,no(X,Formula),G):-
   sat(G,not(exists(X,Formula)),G).

%=======================================================
%  Describe, Nominalize and Quantify
%=======================================================
% describe/2 grabs all the single argument predicates in 
% the active model that the first entity of an assignment
% function (i.e. its first argument) refers to and passes 
% them on to a nominalizer (i.e. nonnom/3). nomnom/3 
% takes the list of the predicates as its input/first
% argument, filters out generic labes (e.g., person and
% thing) and intransitive verbs and organizes the remaining
% predicates into a single noun (with descriptive content)
% and any adjectives describing the noun or a proper noun.
% bind/3 organizes the adjective and noun output so that
% the adjectives preceed the noun and adds an existential
% determiner (always "a"-we thought this was sufficient). 

describe(G,Output):-
	reverse(G,[[_,X]|_]),
	findall(Sym,f(Sym,X),Out),
	nomnom(Out,Adj,N),
	bind(Adj,N,Output),!.

nomnom([],[],[]).
nomnom([thing|R],L,Y):-
	nomnom(R,L,Y).
nomnom([person|R],L,Y):-
	nomnom(R,L,Y).
nomnom([X|R],[X|L],Y):-
	stringtolist(Lemma,X),
	lemma(Lemma,adj),
	nomnom(R,L,Y).
nomnom([X|R],L,[X|Y]):-
	stringtolist(Lemma,X),
	lemma(Lemma,n),
	nomnom(R,L,Y).
nomnom([X|R],L,[X|Y]):-
	stringtolist(Lemma,X),
	lemma(Lemma,pn),
	nomnom(R,L,Y).
nomnom([X|R],L,Y):-
	stringtolist(Lemma,X),
	lemma(Lemma,iv),
	nomnom(R,L,Y).

bind([],[N],[N]):- stringtolist(Lemma,N),lemma(Lemma,pn),!.
bind(Adj,[N],Out):-stringtolist(Lemma,N),lemma(Lemma,n),append([a|Adj],[N],Out),!.

% p/1 prints a list with a space between each member of a list.
p([]).
p([X|Y]) :- write(X), write(' '), p(Y).
