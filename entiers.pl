entier(0).
entier(ss(X)) :- entier(X).

plus(0, Z, Z).
plus(ss(X),Y,ss(Z)) :- plus(X, Y, Z).

fois(X, 0, 0).
fois(X,ss(Y),Z) :- fois(X,Y,Z1), plus(X,Z1,Z).
