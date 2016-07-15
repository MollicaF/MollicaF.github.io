%consult(file) === load the source file.

tag :-
 repeat,
   readinput(Input),
   process(Input), 
  (Input = [done]),!.


readinput(List):-
   read_line_to_codes(user_input,Input),
   string_to_atom(Input,IA),
   concat_atom(List,' ',IA). 


process([done]):- write('done').

process(Sentence) :- postag(Sentence, X), write(X),nl,!.
postag([],[]).
postag([T|L], [POS|L2]) :- stringtolist(Lemma, T), lex(Lemma,POS), postag(L, L2).

%=============================================================================================
%  LEXICON
%=============================================================================================

% 		ADJECTIVES

%		NOMINALS
% Common Nouns

lemma([m,o,t,h,e,r],n).
lemma([d,i,s,h],n).

% Mass Nouns?

% Proper Nouns

lemma([b,i,a],pn).

%		VERBS
% Intransitive

lemma([s,n,o,r,e],iv).

% Transitive

lemma([w,a,s,h],tv).
lemma([b,e,l,o,n,g],pv).

% Ditransitive

lemma([g,i,v,e],dtv).

% Sentential

%		PREPOSITIONS

lemma([t,o],p).
lemma([o,n],p).

% 		DETERMINERS

lemma([t,h,e],dt).

lex(A,B) :- lemma(A,B).

lex(L, X) :- greed(L,[T|_]), lemma(T, X).

%===============================================================================================
%      GREEDY TOKENIZER
%===============================================================================================

greed([],[]).
greed(String,[Token|TokenList]):- tokenize([],String,StringRest,Token), greed(StringRest,TokenList).

tokenize(String,[Char|Rest1],Rest2,Token):- append(String,[Char],NewString), check(NewString,Rest1,Rest2,Token).

check(NewString,Rest,Rest,NewString):- token(NewString).
check(NewString,Rest1,Rest2,Token):- tokenize(NewString,Rest1,Rest2,Token).

% Tokens

token([e,d]).
token([d]).
token([e,s]).
token([s]).
token([i,n,g]).
token([e,n]).

token(X):- lemma(X,_).

%=============================================================================================

stringtolist(List,Atom):- string_to_list(Atom,CL), converted(CL,List).

converted([],[]).
converted([X|L],[Y|L2]):- char_code(Y,X), converted(L,L2).

