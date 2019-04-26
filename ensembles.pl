membre(P,[P|Y]).
membre(P,[P1|Y]) :- membre(P, Y).

inclus([],Y).
inclus([X|Q], Y) :- membre(X,Y), inclus(Q,Y).

enlever(X,[],[]).
enlever(X,[X|Y],Y).
enlever(X,[P|Y],[P|Z]) :- X\=P, enlever(X, Y, Z).

egal-ens([],[]).
egal-ens([P|X], Y) :- membre(P,Y), enlever(P,Y,Q1), egal-ens(X,Q1).

not(X) :- \+ X.

membre(P,X,Y) :- membre(P,X), membre(P,Y).
disjoint(X,Y) :- not(membre(_,X,Y)).

intersect(X,Y,[]) :- disjoint(X,Y).
intersect(X,Y,[P|Z]) :- membre(P,X), membre(P,Y),
                        enlever(P,X,Q1), enlever(P,Y,Q2),
									      intersect(Q1, Q2, Z).

union(X,[],X).
union(X,Y,[P|Z]) :- membre(P,Y), enlever(P,X,Q1),
                    enlever(P,Y,Q2), union(Q1,Q2,Z).

soustract(X,[],X).
%soustract(X,Y,X) :- disjoint(X,Y).
soustract(X,[P|Y],Z) :- enlever(P, X, Q1), soustract(Q1, Y, Z). 



